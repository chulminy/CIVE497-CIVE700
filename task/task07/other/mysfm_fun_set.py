import numpy as np
import os
from scipy.spatial.transform import Rotation as R
from PIL import Image
import numpy as np
from scipy.interpolate import interp2d
from scipy.ndimage import map_coordinates

def quaternion2ROT(q):
    
    q = q / np.linalg.norm(q)
    ROT = np.array([[1 - 2*q[2]**2 - 2*q[3]**2,
                        2*q[1]*q[2] - 2*q[0]*q[3],
                        2*q[3]*q[1] + 2*q[0]*q[2]],
                        [2*q[1]*q[2] + 2*q[0]*q[3],
                        1 - 2*q[1]**2 - 2*q[3]**2,
                        2*q[2]*q[3] - 2*q[0]*q[1]],
                        [2*q[3]*q[1] - 2*q[0]*q[2],
                        2*q[2]*q[3] + 2*q[0]*q[1],
                        1 - 2*q[1]**2 - 2*q[2]**2]])
    return ROT

def read_nvm_file(folder_path_img, nvm_file_name):
    with open(nvm_file_name, 'r') as file:
        lines = file.readlines()

    n_images = int(lines[2])
    images_info = lines[3:3 + n_images]
    
    ImgStruct = {
        'nImg': n_images,
        'imgFileName': [],
        'imgSize': [],
        'fMat': [],
        'RMat': [],
        'CMat': [],
        'rDistMat': [],
        'PMat': []
    }

    for info in images_info:
        parts = info.split()
        img_file_name = parts[0]
        f_mat = float(parts[1])
        quaternion = np.array(parts[2:6], dtype=float)
        c_mat = np.array(parts[6:9], dtype=float)
        r_dist_mat = float(parts[9])

        r_mat = quaternion2ROT(quaternion)

        img_path = os.path.join(folder_path_img, img_file_name)
        with Image.open(img_path) as img:
            width, height = img.size

        ImgStruct['imgFileName'].append(img_file_name)
        ImgStruct['imgSize'].append((width, height))
        ImgStruct['fMat'].append(f_mat)
        ImgStruct['RMat'].append(r_mat)
        ImgStruct['CMat'].append(c_mat)
        ImgStruct['rDistMat'].append(r_dist_mat)
        
    point_start_line = n_images + 4
    n_points = int(lines[point_start_line])

    PointInfo = {
        'nPt3D': n_points,
        'Pt3D': [],
        'PtRGB': [],
        'nMatchImg': [],
        'matchImgIdx': [],
        'matchImgPos': [],
        'matchImgPosUndist': []
    }

    points_info = lines[point_start_line + 1: point_start_line+n_points+1]
    
    for info in points_info:

        parts = info.split()
        
        pt_3d = [float(i) for i in parts[:3]]
        pt_rgb = [int(i) for i in parts[3:6]]
        n_match_img = int(parts[6])
        matches = parts[7:7 + n_match_img * 4]
        
        match_img_idx = []
        match_img_pos = []
        for i in range(n_match_img):
            img_idx = int(matches[i * 4])
            sift_idx = int(matches[i * 4 + 1])  # not used here
            pos_x, pos_y = [float(i) for i in matches[i * 4 + 2:i * 4 + 4]] 

            # Adjust position (example calculation, may need adjustments based on actual NVM format details)
            pos_x += ImgStruct['imgSize'][img_idx][0] / 2
            pos_y += ImgStruct['imgSize'][img_idx][1] / 2

            match_img_idx.append(img_idx)
            match_img_pos.append((pos_x, pos_y))

        PointInfo['Pt3D'].append(pt_3d)
        PointInfo['PtRGB'].append(pt_rgb)
        PointInfo['nMatchImg'].append(n_match_img)
        PointInfo['matchImgIdx'].append(match_img_idx)
        PointInfo['matchImgPos'].append(match_img_pos)
        PointInfo['matchImgPosUndist'].append([None]*n_match_img)  # Placeholder for undistorted positions

    return ImgStruct, PointInfo

def undistort_image(Idistorted, params):
    cx = params['cx']
    cy = params['cy']
    r = params['r']

    if r == 0:
        return Idistorted

    I = np.zeros_like(Idistorted)

    # Finding indices
    ii, jj = np.nonzero(~np.isnan(I[:, :, 0]))

    ii = ii - cy
    jj = jj - cx
    ii[ii == 0] = 1.e-12
    jj[jj == 0] = 1.e-12

    t2 = ii ** 2
    t3 = t2 ** 3
    t4 = jj ** 2
    t7 = r * (t2 + t4)

    if r > 0:
        t8 = 1.0 / t7
        t10 = t3 / (t7 ** 2)
        t14 = np.sqrt(t10 * (0.25 + t8 / 27.0))
        t15 = t2 * t8 * ii * 0.5
        t17 = (t14 + t15) ** (1 / 3)
        t18 = t17 - t2 * t8 / (t17 * 3.0)
        
        x2 = t18 + cy
        x1 = t18 * jj / ii + cx
    else:
        t9 = t3 / (t7 ** 2 * 4)
        t11 = t3 / (t7 ** 3 * 27)
        t12 = t9 + t11
        t13 = np.sqrt(t12)
        t14 = t2 / t7
        t15 = t14 * ii * 0.5
        t16 = t13 + t15
        t17 = t16 ** (1 / 3)
        t18 = (t17 + t14 / (t17 * 3)) * (1j * np.sqrt(3))
        t19 = -0.5 * (t17 + t18) + t14 / (t17 * 6)
        
        x2 = np.real(t19) + cy
        x1 = np.real(t19) * jj / ii + cx

    # Handling interpolation
    if I.shape[2] == 1:  # Single-channel (grayscale) image
        coordinates = np.vstack((x2.flatten(), x1.flatten()))
        I = map_coordinates(Idistorted[:, :, 0], coordinates, order=1).reshape(I.shape[0], I.shape[1])
        I = np.expand_dims(I, axis=2)  # Add back the channel dimension if needed
    else:  # Multi-channel (RGB) image
        for c in range(3):  # Iterate over each color channel
            coordinates = np.vstack((x2.flatten(), x1.flatten()))  # Flatten x1, x2 for mapping
            I[:, :, c] = map_coordinates(Idistorted[:, :, c], coordinates, order=1).reshape(I.shape[0], I.shape[1])

    return I
