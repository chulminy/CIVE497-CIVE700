import numpy as np
import cv2
from matplotlib import pyplot as plt

# Setup the parameter before executing this file
mark_size = 100  # mm
imgFile = '20220513_091827.jpg'  # Change to the path of your image file

# Step 1: Pick four corners of your calibrate image
img = cv2.imread(imgFile)
plt.figure(1)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title('Select the corners of the marked square and close the figure.')

# Manual selection of corners
print("Please select the corners of the marked square on the image.")
plt.show(block=False)
corners = plt.ginput(4)
plt.close()

# Step 2: Compute H
movingPoints = np.array(corners)
fixedPoints = np.array([[0, 0], [mark_size, 0], [mark_size, mark_size], [0, mark_size]])
H, status = cv2.findHomography(movingPoints, fixedPoints)

# Step 3: Select the line that you want to measure
plt.figure(2)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title('Select two points along the line you want to measure and close the figure.')

# Manual selection of line points
print("Please select two points along the line you want to measure.")
plt.show(block=False)
line_points = plt.ginput(2)
plt.close()

# Step 4: Measure a distance
ptLine = np.array(line_points)
ptWHom = H.dot(np.vstack((ptLine.T, np.ones((1, ptLine.shape[0])))))
ptW = ptWHom / ptWHom[2]
dist = np.sqrt((ptW[0, 1] - ptW[0, 0])**2 + (ptW[1, 1] - ptW[1, 0])**2)

# Output the distance
print('\nDistance is {:.1f} mm'.format(dist))
print('Distance is {:.1f} inch'.format(dist * 0.0393701))
