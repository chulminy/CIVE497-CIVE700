# Task5: Homography

**Announcement**: February 12, 2020        
**Due date**: March 01, 2020 (Sunday) before 11:59pm        

The main goal of this task is to understand the fundamental of the homogeneous coordinate and the homography relationship between points on two images of the same planar surface in space. Please answer all sub-questions in each problem. You should write your own code to solve these questions *if needed*. 

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

## Problem 5: Image Overlay (20 points)

|![](doc/my_office.png)|![](doc/award.png)|
|:-----:|:----:|
|(a) original image: *prob5_1.jpg*|(b) original image: *prob5_2.jpg*|

You are going to hang a good painting or image. Please find an image putting on the white board and award frame, and a digital clock (see *clock_wall.png*) is placed on the designated block (*marked as 'clock'*). Your images and the clock image are projected to the marked regions in (a) and (b). Write your own code to project your image. You need to find homography. 

Here is a sample demo for one image (`demo_problem5.m` in [**problem5**](problem5)).

[![](http://img.youtube.com/vi/5jer5NoX7cs/0.jpg)](https://www.youtube.com/watch?v=5jer5NoX7cs)

You can make your tool using the code provided or from the scratch. Note that you **should not** use `fitgeotrans` in MATLAB and `findhomography`, `getPerspectiveTransform` in Python. You need to write your own code to find homography (perspective transformation), meaning that you need to write your own `ComputeH`.  

You need to manually provide the coordinates of four corners of each region on the image where your images overaly. Please do not make an interactive code for picking the corner like the one in the demo. 

## Problem 6: Build your 3D Planar Measurement Software (30 points)

You are going to make a 3D planar measurement tool using homography. 

Here is a sample demo.  

[![](http://img.youtube.com/vi/_1SB4L98NME/0.jpg)](https://www.youtube.com/watch?v=_1SB4L98NME)

A sample code is not provided in this problem because you will implement a "very" similar code used in Problem 6. `drawpolyline` is useful for selecting the line for measurement. 

You need to demonstrate the functionality of your tool using your own image as well as physical measurements. Any size of a calibration paper can be used. Please provide at least two measurements on the plane that the calibration paper is placed. Note that you should not use `fitgeotrans` in MATLAB and `getPerspectiveTransform`in Python. You need to write your own code to find homography (perspective transformation).  


## Submission of Your Work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* You should turn in a report and codes to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task5_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> chulmi, Juan Park -> juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* For writing equations, I recommend the use of latex equations editors introduced in the Markdown tutorial and inserting equation links. However, I also accept for attaching an image of your handwritten equation (but not recommend). 
* Your report includes your answers and styled codes for questions in the problems.
* The formats of the folder and files are 
	* Folder name: Task5_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Code_`Your name` _ `Degree` _ `ID`.m or .py" for codes and "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* The report must be written with Markdown script (GFM) and all other formats like docx or pptx are not permitted. 
* You should also include a report in pdf that must be converted from your report in Markdown.
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guideline, your report will be returned and must be resubmitted. 
> For example, Juan Park is using MATLAB to complete the Task5. Juan needs to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task5_juanp_BA_000000.zip**. In the folder, there are at least three files: 
> * Code_juanp_BA_000000.m
> * Rept_juanp_BA_000000.md
> * Rept_juanp_BA_000000.pdf
* You may need to include all figures used for writing your report. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleague.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  