# Task06: Image Processing

**Announcement**: March 06, 2021        
**1st due date**: March 16, 2021 before 11:59pm   
**2nd due date**: March 23, 2021 before 11:59pm         

The main goal of this task is to understand the fundamental of the linear filter, edge detection, and Hough transform. You must study the tutorials at edge detection, linear filter, and image morphology before solving these problems. Please answer all sub-questions in each problem. You should write your own code to solve these questions. 

:loudspeaker::loudspeaker: **PLEASE INCLUDE YOUR RESULTING IMAGES OR GRAPHS IN THE REPORT**

## Problem 1: 2D Convolution (20 points)

The general expression of a 2D convolution is
 
![](https://latex.codecogs.com/gif.latex?G%5Bi%2Cj%5D%3D%5Csum_%7Bu%3D-k%7D%5E%7Bk%7D%20%5Csum_%7Bv%3D-k%7D%5E%7Bk%7D%20H%5Bu%2Cv%5D%20F%5Bi-u%2C%20j-v%5D)

where G is the filtered image, F is the original image, and H is the kernel.  

You first take a colour picture or download any colour image on the web, and resize the image to have 400 pixel in the shortest side. For example, if your image 5000 x 4000 pixel, it becomes 500x400 pixel. Then, please do the convolution of the resized image and the kernel H:

![](https://latex.codecogs.com/gif.latex?h%20%3D%20%5Cbegin%7Bbmatrix%7D%200%20%26-0.5%20%260%20%5C%5C%20-0.5%20%26%202%20%26%20-0.5%5C%5C%200%26%20-0.5%26%200%20%5Cend%7Bbmatrix%7D)

(a) Please compute G using `conv2`. In the shape option, you set `same`. For Python users, you can use 	[`scipy.signal.convolve2d`](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.convolve2d.html)

(b) Please compute G using your own code (use of a for-loop structure).

Note that answers for (a) and (b) must be the same. 

## Problem 2: Different Kernels (20 points)

You are going to filter your image using the following kernels. Please conduct convolution of your image (used in Problem 1) with the kernel H1, H2, H3, H4, and H5, respectively. Then, you need to explain the effect of filtering with the each kernel with the resulting images. 

![](https://latex.codecogs.com/gif.latex?H_1%20%3D%20%5Cfrac%7B1%7D%7B9%7D%5Cbegin%7Bbmatrix%7D%201%20%26%201%20%26%201%5C%5C%201%20%26%201%20%26%201%5C%5C%201%20%26%201%20%26%201%20%5Cend%7Bbmatrix%7D%2C%5C%2C%5C%2C%20H_2%20%3D%20%5Cbegin%7Bbmatrix%7D%200%20%26%201%20%26%200%5C%5C%201%20%26%20-4%20%26%201%5C%5C%200%20%26%201%20%26%200%20%5Cend%7Bbmatrix%7D%20%2C%20%5C%2C%5C%2C%20H_3%20%3D%20%5Cbegin%7Bbmatrix%7D%20-0.55%20%26%20-0.55%20%26%20-0.55%5C%5C%20-0.55%20%26%205.40%20%26%20-0.55%5C%5C%20-0.55%20%26%20-0.55%20%26%20-0.55%20%5Cend%7Bbmatrix%7D%20%2C)
</br>
![](https://latex.codecogs.com/gif.latex?H_4%20%3D%20%5Cbegin%7Bbmatrix%7D%200.0030%20%26%200.0133%20%26%200.0219%20%26%200.0133%20%26%200.0030%20%5C%5C%200.0133%20%26%200.0596%20%26%200.0983%20%26%200.0596%20%26%200.0133%20%5C%5C%200.0219%20%26%200.0983%20%26%200.1621%20%26%200.0983%20%26%200.0219%20%5C%5C%200.0133%20%26%200.0596%20%26%200.0983%20%26%200.0596%20%26%200.0133%20%5C%5C%200.0030%20%26%200.0133%20%26%200.0219%20%26%200.0133%20%26%200.0030%20%5Cend%7Bbmatrix%7D) ![](https://latex.codecogs.com/gif.latex?,) &nbsp;&nbsp;&nbsp;   ![](https://latex.codecogs.com/gif.latex?H_5%20%3D%20%5Cbegin%7Bbmatrix%7D%200%20%26%200%20%26%200%26%200%26%200%5C%5C%200%20%26%200%20%26%200%20%26%200%20%26%200%5C%5C%200%20%26%200%20%26%200%20%26%200%20%26%201%5C%5C%200%20%26%200%20%26%200%20%26%200%20%26%200%5C%5C%200%20%26%200%20%26%200%20%26%200%20%26%200%20%5Cend%7Bbmatrix%7D)

<!--
H_5 = \begin{bmatrix}
0 & 0 & 1&  0& 0\\ 
0 & 0 & 0 & 0 & 0\\ 
0 & 0 & 0 & 0 & 0\\ 
0 & 0 & 0 & 0 & 0\\ 
0 & 0 & 0 & 0 & 0 
\end{bmatrix}

-->
## Problem 3: Gaussian Kernel (20 points)
(a) Write a code to create the following Gaussian kernel h without using `fspecial`. 

```matlab
h = fspecial('gaussian', 11, 3);
```
You need to use a theoretical Gaussian curve to get the value of each element in h. Your code produces the kernel close to h obtained from the `fspecial` function.   

(b) What is the difference between the kernel h1 and h2 in terms of the effect on the  images filtered with these kernels? You can explain it with sample results.    

```matlab    
h1 = fspecial('gaussian', 20, 2);
h2 = fspecial('gaussian', 20, 4);
```

(c) What is the difference between the kernel h2 and h3 in terms of the effect on the  images filtered with these kernels? Are they different? You can explain it with sample results.   

```matlab   
h2 = fspecial('gaussian', 11, 3);
h3 = fspecial('gaussian', 51, 3);
```

(d) What is the difference between the kernel h2 and h4 in terms of the effect on the  images filtered with these kernels? Are they different? You can explain it with sample results.   

```matlab   
h2 = fspecial('gaussian', 11, 3);
h4 = fspecial('gaussian', 21, 21);
```
Please **ignore** the boundary effect. You can do either zero-padding (e.g., `same` option in `conv2` in MATLAB) or get the valid area (e.g., `valid` option in `conv2` in MATLAB).  

## Problem 4: Hough Transform (20 points)

This problem is to write your own program that extracts a booklet image from each image provided and remove its projective distortion in an automated way. Here is a sample demo.  

[![](http://img.youtube.com/vi/wi4LXCr3xfs/0.jpg)](https://youtu.be/wi4LXCr3xfs)

A sample code is provided in [**problem4**](problem4). You need to write your own code for extracting four corners of the booklet using edge detection and Hough transform on the given images. In other word, you need to write your own `FindCorner` function. In addition, you might need  your `ComputeH`, which was used in Task05. Note that you only remove perspective distortion, meaning that resulting images could be horizontally or vertically flipped.  

**Next**, you need to take photos and demonstrate your code using your own images. Certainly, your code should work on your own images as well. Please include both results and codes in your submission.  

Hint: I used functions of `edge`, `imgaussfilt`, `houghpeaks`, `hough`, `cross`, `norm` in MATLAB to write the `FindCorner`.  However, you can use any functions in OpenCV or MATLAB.  You can use `fitgeotrans` in MATLAB and `getPerspectiveTransform` in Python. 

## Problem 5: Hough Transform & Image Overlay (30 points) 

This problem is to write your own program that extracts a booklet image from an image provided and overlay the extracted image into the white board. Note the height of the booklet image should be placed at the width of the board. Here is a sample demo.  

[![](http://img.youtube.com/vi/JVAoPLohA-8/0.jpg)](https://youtu.be/JVAoPLohA-8)

Your goal is to write your `fun_prob5` function. A sample code is provided in [**problem5**](problem5). You can reuse any code that you wrote for solving Problem 4 in Task 06 or Problem 5 or 6 in Task 5. Again, you only remove perspective distortion, meaning that resulting images could be horizontally or vertically flipped. 

**Next**, you need to demonstrate the performance using your images captured in Problem 4 and overlay into a rectangle area. Thus, you need to take an image where a planar rectangular region is captured, like the whiteboard image above. Please include both results and codes in your submission.  

## Problem 6: Fiduciary Marker Detection (40 points) 
You are going to build a marker identification tool. Aruco marker (Augmented Reality University of Cordoba) is a popular fiducial marker widely used for augmented reality applications. Acruco marker is a binary square with black background and white generated pattern. Each marker has own unique id ranging from 0 to 999. The marker code is unique under a rotated environment. For example, although you rotate the marker 90 degrees, the code (white) pattern does not overlap with the ones from the rest of the 998 codes. I generated five 4 x 4 Aruco marker from [here](https://chev.me/arucogen/) where ID is from 1 to 5 and print them.  

|![](problem6/marker_number.png)|![](problem6/marker.png)|
|:-----:|:----:|
|**(a) Five Aruco markers used in this problem**|**(b) a 4 x 4 maker design**|

The objective of the tool is to identify the id of a marker on a given image. You are going to select the outline of the marker and your tool identify the id of the maker. 

A total of 7 images are given and you need to estimate the ids for the markers on these images. The Aruco marker binary pattern matrices for these markers are provided in `aruco_marker.mat`. You need to use this matrix to identify the id of the marker on each test image.   

Here is a sample demo. 

[![](http://img.youtube.com/vi/y-CTJWiyw38/0.jpg)](https://youtu.be/y-CTJWiyw38)

A sample script is provided in this problem. You are going to make your own `find_aruco_num` script, which is given as p-code. If you are a Python user, you need to make an equivalent function to identify marker ids. To do so, you need to import `aruco_marker.mat` to your Python script. Note that you **should not** use any computer vision library (including marker detection library) in MATLAB or Python. You can solve this using `ComputeH` that you made and some basic functions in MATLAB or Python. Note that this is not a feature matching problem so do not try to match features on the marker on the test image and original marker image. 

## Submission of Your Work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* You should turn in a report to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task06_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five lower-case letters your **first + last** name. It should be lower case. (i.g Chul Min Yeum -> chulmi, Juan Park -> juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* Your report includes styled codes for all problems (please check the Markdown tutorial for code styling). 
* The report must be written with Markdown script (GFM) and all other formats like .docx or .pptx are not permitted. 
* You should also include a report in pdf that is converted from your report in Markdown.  
* In your submission folder, you should include a report in the format of both .pdf and .md in a folder. And, it should be zipped before attaching it to your email. 
* The formats of the folder and files are 
	* Folder name: Task06_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guidelines, your report may be returned. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleagues, but do not copy the solutions.     
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  