# Task3: Homography

**Announcement**: February 12, 2019  
**1st due date**: February 26, 2019 (Tuesday) before 11:59 pm  
**2nd due date**: March 02, 2019 (Saturday) before 11:59 pm  

The main goal of this task is to understand the fundamental of the homogeneous coordinate and the homography relationship between points on two images of the same planar surface in space. You must study the following three tutorials (`ProjectiveDistortion.mlx`, `ProjectiveGeometryV2.mlx`, `ProjectiveTransformation.mlx`) to solve the corresponding problems. Please answer all sub-questions in each problem. You should write your own code to solve these questions. 

## Problem 1: Homogeneous Coordinate (Lines and Points) (10 points)
The intersection of two lines l1 and l2, with l1 passing through the points (0,4) and (3,0), and l2 passing through the points (8,-2) and (10,8). 

**(a)** Compute the intersection without using homogeneous coordinates 

**(b)** Compute the intersection using homogeneous coordinates

## Problem 2: Homogeneous Coordinate (Conic) (10 points)
Given a conic 

![](https://latex.codecogs.com/gif.latex?x%5E2%20&plus;%20y%5E2%20&plus;%204x%20&plus;%202y%20-%2029%20%3D0)

**(a)** Compute the intersection of a tangential line to this conic at (1,4) with the y-axis

**(b)** Compute the coorindates of the intersection of the tangents to this conic at points (1,4) and (3, -4)

## Problem 3: Vanishing Line and Point (10 points)

![](20190206_155248.jpg)

Use the image of '20190206_155248.jpg'

**(a)** Compute two vanishing point coordinates that are formed from vertical edges and horizontal edges, respectively. The left top corner is (1, 1). If you are a Python user, you can assume the origin as (0,0).

**(b)** Compute a vanishing line that connect the above two vanishing point. 

You need to clearly explain how you get the answer with a code or hand calculation.  

**(c)** Please explain how to take a picture of this paper in such a way that the vanishing line becomes a line at infinity. 

## Problem 4: Affine Rectification (10 points)
I take a photo of a rectangular picture frame and the pixel coordinates of the corners of a frame are at P1 = (3,1), P2 = (7, 4), P3 = (8, 2), P4 = (7 -1). Write a code to transform this frame (rectangle) to have only affine distortion (the rectangle determined by new four points has only affine distortion). Please justify why a transformed rectangle has only affine distortion.    

## Problem 5: Linear Algebra (20 points)
**(a)** Find a transpose of inverse H 

![](https://latex.codecogs.com/gif.latex?H%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%200%20%26%200%5C%5C%200%20%26%201%20%26%200%5C%5C%20l_1%20%26%20l_2%20%26%20l_3%20%5Cend%7Bbmatrix%7D)

**(b)** Find a basis of the subspace S. What is a basis? 

![](https://latex.codecogs.com/gif.latex?S%20%3D%20%5Coperatorname%7Bspan%7D%5Cleft%20%5C%7B%20%5Cbegin%7Bpmatrix%7D%201%5C%5C%202%5C%5C%201%5C%5C%201%20%5Cend%7Bpmatrix%7D%2C%20%5Cbegin%7Bpmatrix%7D%202%5C%5C%202%5C%5C%20-1%5C%5C%202%20%5Cend%7Bpmatrix%7D%2C%20%5Cbegin%7Bpmatrix%7D%200%5C%5C%206%5C%5C%201%5C%5C%204%20%5Cend%7Bpmatrix%7D%2C%20%5Cbegin%7Bpmatrix%7D%201%5C%5C%204%5C%5C%200%5C%5C%203%20%5Cend%7Bpmatrix%7D%2C%20%5Cbegin%7Bpmatrix%7D%201%5C%5C%20-1%5C%5C%201%5C%5C%202%20%5Cend%7Bpmatrix%7D%20%5Cright%20%5C%7D)
 
**(c)** What is the definition of a row, column, and null space? Please find a column, row, and null space of a matrix A, respectively.  

![](https://latex.codecogs.com/gif.latex?A%20%3D%20%5Cbegin%7Bbmatrix%7D%20-1%20%26%203%20%26%203%20%26%202%5C%5C%202%26%200%26%206%26%201%5C%5C%20-2%20%26%204%20%26%202%20%26%204%20%5Cend%7Bbmatrix%7D)

**(d)** Find a non-singular (non-trivial) vector of x that satisfy Ax = 0. Does x exist? What is the null space of A and the nullity of A? Please explain your answer. 

![](https://latex.codecogs.com/gif.latex?A%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%200%26%200%26%200%26%202%5C%5C%20-2%20%26%201%20%26%20-3%20%26%20-2%20%26%20-4%5C%5C%200%20%26%205%20%26%20-14%20%26%20-9%20%26%200%5C%5C%202%20%26%2010%20%26%20-28%20%26%20-18%20%26%204%20%5Cend%7Bbmatrix%7D)

**(e)** Find a non-singular (non-trivial) vector of x that satisfy Ax = 0. Does x exist? What is the null space of A and the nullity of A? Please explain your answer.
 
![](https://latex.codecogs.com/gif.latex?A%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%200%26%200%26%200%26%202%5C%5C%20-2%20%26%201%20%26%20-3%20%26%20-2%20%26%20-4%5C%5C%20%5Cend%7Bbmatrix%7D)


## Problem 6: Image Overlay (20 points)

|(a): Img_0067.JPG|(b): Img_0069.JPG|
|:-----:|:----:|
|![](IMG_0067.JPG)|![](IMG_0069.JPG)|

You are going to put up a nice picture on a white board in my office. Please first find out a good picture or drawing having an around 4:3 aspect ratio (You can crop the images to make it as 4:3). Then, the image is projected to the white board area in (a) and (b). Write your own code to project your image. Hint: You need to find homography between the white board frame in (a) and (b) and your image. Please hanging on a nice picture in my office :smile:  

Here is a sample demo (`demo_problem6.m` in [**problem6**](problem6)).

[![](http://img.youtube.com/vi/5jer5NoX7cs/0.jpg)](https://www.youtube.com/watch?v=5jer5NoX7cs)

You can make your tool using the code provided or from the scratch. Note that you **should not** use `fitgeotrans` in MATLAB and `findhomography`, `getPerspectiveTransform` in Python. You need to write your own code to find homography (perspective transformation), meaning that you need to write your own `ComputeH`.  

## Problem 7: Build your 3D Planar Measurement Software (30 points)

You are going to make a 3D planar measurement tool using homography. 

Here is a sample demo.
[![](http://img.youtube.com/vi/_1SB4L98NME/0.jpg)](https://www.youtube.com/watch?v=_1SB4L98NME)

A sample code is not provided because you will implement a similar code used in Problem 6. `drawpolyline` is useful for selecting the line for measurement. 

You need to demonstrate the functionality of your tool using your own images. Any size of a calibration paper can be used. Please provide at least two measurements on the plane that the calibration paper is placed. Note that you should not use `fitgeotrans` in MATLAB and `getPerspectiveTransform`in Python. You need to write your own code to find homography (perspective transformation).  

## Submission of Your Work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* You should turn in a report and codes to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task3_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> Chulmi, Juan Park -> Juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* For writing equations, I recommend the use of latex equations editors introduced in the Markdown tutorial and inserting equation links. However, I also accept for attaching an image of your handwritten equation (but not recommend). 
* Your report includes your answers and styled codes for questions in the problems.
* The formats of the folder and files are 
	* Folder name: Task3_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Code_`Your name` _ `Degree` _ `ID`.m or .py" for codes and "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* The report must be written with Markdown script (GFM) and all other formats like docx or pptx are not permitted. 
* You should also include a report in pdf that must be converted from your report in Markdown.
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guideline, your report will be returned and must be resubmitted. 
> For example, Juan Park is using MATLAB to complete the Task1-2. Juan needs to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task3_Juanp_BA_000000.zip**. In the folder, there are at least three files: 
> * Code_Juanp_BA_000000.m
> * Rept_Juanp_BA_000000.md
> * Rept_Juanp_BA_000000.pdf
* You may need to include all figures used for writing your report. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleague.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  