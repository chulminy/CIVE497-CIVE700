# Task05: Homography

**Announcement**: February 10, 2020        
**1st due date**: February 24, 2020 before 11:59pm
**2nd due date**: March 03, 2020 before 11:59pm        

The main goal of this task is to understand the fundamental of the homogeneous coordinate and the homography relationship between points on two images of the same planar surface in space. Please answer all sub-questions in each problem. You should write your own code to solve these questions. 

## Problem 1: Homogeneous Coordinate (Lines and Points) (10 points)
The intersection of two lines **l1** and **l2**, with **l1** passing through the points (3,6) and (5,1), and **l2** passing through the points (3,-2) and (6,8). 

**(a)** Compute the intersection without using homogeneous coordinates 

**(b)** Compute the intersection using homogeneous coordinates


## Problem 2: Homogeneous Coordinate (Conic) (10 points)

Given a conic 

![](https://latex.codecogs.com/gif.latex?%5Cfrac%7B%28x-3%29%5E%7B2%7D%7D%7B2%5E%7B2%7D%7D%20&plus;%20%5Cfrac%7B%28y-2%29%5E%7B2%7D%7D%7B3%5E%7B2%7D%7D%3D2)

**(a)** Compute the intersection of a tangential line to this conic at (1, 5) with the x-axis

**(b)** Compute the coordinates of the intersection of the tangential lines to this conic at points (1,5) and (1, -1)


## Problem 3: Homogeneous Coordinate (Lines) (10 points)
![](https://latex.codecogs.com/gif.latex?%5C%5C%20l_1%3A%20y_1%20%3D%200.75%20%5Ccdot%20x_1%20&plus;%203%20%5C%5C%20l_2%3A%20y_2%20%3D%200.4%20%5Ccdot%20x_2%20-%205%20%5C%5C%20l_3%3A%20y_3%20%3D%20-1.25%20%5Ccdot%20x_3%20&plus;%205%20%5C%5C%20l_4%3A%20y_4%20%3D%20-x_4%20-%208)

![](https://latex.codecogs.com/gif.latex?%5C%5C%20l_1%3A%20y_1%20%3D%201.25x_1%20&plus;%203%20%5C%5C%20l_2%3A%20y_2%20%3D%200.4x_2%20-%205%5C%5C%20l_3%3A%20y_3%20%3D%20-2.25x_3%20&plus;%205%20%5C%5C%20l_4%3A%20y_4%20%3D%20-x_4%20-%208)

The four lines (**l1**, **l2**, **l3**, and **l4**) are intersected at six points. **Among the six points, please find four points that form a quadrangle with your code, not manually**. 
 

## Problem 4: Linear Algebra (20 points)
**(a)** Find a transpose of inverse H 

![](https://latex.codecogs.com/gif.latex?H%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%200%20%26%200%5C%5C%200%20%26%201%20%26%200%5C%5C%20l_1%20%26%20l_2%20%26%20l_3%20%5Cend%7Bbmatrix%7D)

**(b)** What is the definition of a row and null space? Please find rank and nullity of A. 

![](https://latex.codecogs.com/gif.latex?A%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%203%20%26%202%20%26%201%20%26%204%5C%5C%203%20%26%203%20%26%205%20%26%2010%20%26%201%5C%5C%20-1%20%26%205%20%26%201%20%26%202%20%26%20-4%20%5Cend%7Bbmatrix%7D)

**(c)** Find a non-singular (non-trivial) vector of x that satisfy Ax = 0. Does x exist? What is the null space of A and the nullity of A? Please explain your answer. 

![](https://latex.codecogs.com/gif.latex?A%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%200%26%200%26%200%26%202%5C%5C%20-2%20%26%201%20%26%20-3%20%26%20-2%20%26%20-4%5C%5C%200%20%26%205%20%26%20-14%20%26%20-9%20%26%200%5C%5C%202%20%26%2010%20%26%20-28%20%26%20-18%20%26%204%20%5Cend%7Bbmatrix%7D)

**(d)** Find a non-singular (non-trivial) vector of x that satisfy Ax = 0. Does x exist? What is the null space of A and the nullity of A? Please explain your answer.
 
![](https://latex.codecogs.com/gif.latex?A%20%3D%20%5Cbegin%7Bbmatrix%7D%201%20%26%200%26%200%26%200%26%202%5C%5C%20-2%20%26%201%20%26%20-3%20%26%20-2%20%26%20-4%5C%5C%20%5Cend%7Bbmatrix%7D)

## Problem 5: Image Overlay (10 points)
|![](doc/my_office.png)|![](doc/award.png)|
|:-----:|:----:|
|(a) original image: *prob5_1.jpg*|(b) original image: *prob5_2.jpg*|

You are going to hang a good painting or image. Please find an image putting on the white board and award frame, and a digital clock (see *clock_wall.png*) is placed on the designated block (*marked as 'clock'*). Your images and the clock image are projected to the marked regions in (a) and (b). Write your own code to project your image. You need to find homography. 

Here is a sample demo for one image (`demo_problem5.m` in [**problem5**](problem5)).

[![](http://img.youtube.com/vi/5jer5NoX7cs/0.jpg)](https://www.youtube.com/watch?v=5jer5NoX7cs)

You can make your tool using the code provided or from the scratch. Note that you **should not** use `fitgeotrans` in MATLAB and `findhomography`, `getPerspectiveTransform` in Python. You need to write your own code to find homography (perspective transformation), meaning that you need to write your own `ComputeH`.  

You need to manually provide the coordinates of four corners of each region on the image where your images overaly. Please do not make an interactive code for picking the corner like the one in the demo. 

## Problem 6: Picture in Picture in Picture in Picture (20 points)

|![](doc/prob6.jpg)|![](doc/prob6_result.jpg)|
|:-----:|:----:|
|(a) original image: *prob6.jpg*|(b) final image: *prob6_result.jpg*|

You are going to overlay the given picture in the paper on the picture and repeat this process four times. Thus, this task is to make "picture in picture in picture in picture". Once you select the four corners of the paper, the result image in *prob6_result.jpg* should be automatically generated. Your code must generate the final photo at once. Please do not manually repeat this process. 

Here is a sample demo

[![](http://img.youtube.com/vi/kx3znk9mT_g/0.jpg)](https://youtu.be/kx3znk9mT_g)

First, you need to show that your code is working for the given image of *prob6.jpg*. You should include the resulting images in the report. Next, you also need to demonstrate the functionality of your code using your own image like the one in the demo videos. Please think about how or what to take images to show the functions of your code. You can capture the video (like demo video) and include it in your submission or the link of the video. 

## Problem 7: Build your 3D Planar Measurement Software (20 points)

You are going to make a 3D planar measurement tool using homography. 

Here is a sample demo.  

[![](http://img.youtube.com/vi/_1SB4L98NME/0.jpg)](https://www.youtube.com/watch?v=_1SB4L98NME)

A sample code is not provided in this problem because you will reuse the code in Problem 5 and 6. `drawpolyline` is useful for selecting the line for measurement. 

You need to demonstrate the functionality of your tool using your own image as well as physical measurements. Any size of a calibration paper can be used. Please provide at least two measurements on the plane that the calibration paper is placed. You can capture the video (like demo video) and include it in your submission or the link of the video. 

**Note that if you have done problems 5,6 and 7 using Python, you will receive extra 5 points.** 

## Submission of Your Work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* You should turn in a report to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task01_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five lower-case letter your **first + last** name. It should be lower case. (i.g Chul Min Yeum -> chulmi, Juan Park -> juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* Your report includes styled codes for all three problems (please check the Markdown tutorial for code styling). 
* The report must be written with Markdown script (GFM) and all other formats like .docx or .pptx are not permitted. 
* You should also include a report in pdf that is converted from your report in Markdown.  
* In your submission folder, you should include a report in the format of both .pdf and .md in a folder. And, it should be zipped before attaching it to your email. 
* The formats of the folder and files are 
	* Folder name: Task01_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guideline, your report may be returned. 

> For example, Juan Park is preparing for the submission. Juan need to submit his report to **uw.task@gmail.com** with an attachment of **Task01_juanp_BA_000000.zip**. In the folder, there are **at least** two files and code files: 
> * Rept_juanp_BA_000000.md
> * Rept_juanp_BA_000000.pdf

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleague, but do not copy the solutions.     
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  