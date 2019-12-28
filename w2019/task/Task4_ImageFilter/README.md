# Task4: Image Filter & Edge Detection

**Announcement**: March 01, 2019  
**1st due date**: March 11, 2019 (Monday) before 11:59 pm  
**2nd due date**: March 18, 2019 (Monday) before 11:59 pm  

The main goal of this task is to understand the fundamental of the linear filter, edge detection, and Hough transform. You must study the following three tutorials (`linear_filtering.mlx`, `edge_detection_V2.mlx`, `hough_transformation.mlx`) to solve the corresponding problems. Please answer all sub-questions in each problem. You should write your own code to solve these questions *if needed*. 

**PLEASE INCLUDE YOUR RESULTING IMAGES OR GRAPHS IN THE REPORT**

## Problem 1: 2D Convolution (25 points)

The general expression of a 2D convolution is
 
![](https://latex.codecogs.com/gif.latex?G%5Bi%2Cj%5D%3D%5Csum_%7Bu%3D-k%7D%5E%7Bk%7D%20%5Csum_%7Bv%3D-k%7D%5E%7Bk%7D%20H%5Bu%2Cv%5D%20F%5Bi-u%2C%20j-v%5D)

where G is the filtered image, F is the original image, and H is the kernel.  

You first take a color picture or download any color image on the web. The image is resized to have 200 pixel in the shortest side. For example, if your image 5000 x 4000 pixel, it becomes 250x200 pixel. Then, please do the convolution of the resized image and the kernel H:

![](https://latex.codecogs.com/gif.latex?h%20%3D%20%5Cbegin%7Bbmatrix%7D%200%20%261%20%260%20%5C%5C%201%20%26%20-4%20%26%201%5C%5C%200%26%201%26%200%20%5Cend%7Bbmatrix%7D)

(a) Please compute G using `conv2`. In the shape option, you set `same`. 

(b) Please compute G using your own code (use of a for-loop structure).

Note that answers for (a) and (b) must be the same. 


## Problem 2: Different Kernels (20 points)

You are going to filter your image using the following kernels. Please conduct convolution of your image (used in Problem 1) and the kernel H1, H2, H3, H4 respectively. Then, you need to explain the effect of filtering with the each kernel. 

![](https://latex.codecogs.com/gif.latex?H_1%20%3D%20%5Cfrac%7B1%7D%7B9%7D%5Cbegin%7Bbmatrix%7D%201%20%26%201%20%26%201%5C%5C%201%20%26%201%20%26%201%5C%5C%201%20%26%201%20%26%201%20%5Cend%7Bbmatrix%7D%2C%5C%2C%5C%2C%20H_2%20%3D%20%5Cbegin%7Bbmatrix%7D%200%20%26%201%20%26%200%5C%5C%201%20%26%20-4%20%26%201%5C%5C%200%20%26%201%20%26%200%20%5Cend%7Bbmatrix%7D%20%2C%20%5C%2C%5C%2C%20H_3%20%3D%20%5Cbegin%7Bbmatrix%7D%20-0.55%20%26%20-0.55%20%26%20-0.55%5C%5C%20-0.55%20%26%205.40%20%26%20-0.55%5C%5C%20-0.55%20%26%20-0.55%20%26%20-0.55%20%5Cend%7Bbmatrix%7D%20%2C)
</br>
![](https://latex.codecogs.com/gif.latex?H_4%20%3D%20%5Cbegin%7Bbmatrix%7D%200.0030%20%26%200.0133%20%26%200.0219%20%26%200.0133%20%26%200.0030%20%5C%5C%200.0133%20%26%200.0596%20%26%200.0983%20%26%200.0596%20%26%200.0133%20%5C%5C%200.0219%20%26%200.0983%20%26%200.1621%20%26%200.0983%20%26%200.0219%20%5C%5C%200.0133%20%26%200.0596%20%26%200.0983%20%26%200.0596%20%26%200.0133%20%5C%5C%200.0030%20%26%200.0133%20%26%200.0219%20%26%200.0133%20%26%200.0030%20%5Cend%7Bbmatrix%7D)

## Problem 3: Gaussian Kernel (25 points)
See `linear_filtering.mlx`  
(a) Write a code to create the following Gaussian kernel h without using `fspecial`. 

```matlab
h = fspecial('gaussian', 5, 2);
```
You need to use theoretical Gaussian curve to get the value of each element in h. Your code produces the kernel close to h obtained from the `fspecial` function.   

(b) What is the difference between the kernel h1 and h2 in terms of the effect on the filtered images with these kernels?  

```matlab    
h1 = fspecial('gaussian', 20, 2);
h2 = fspecial('gaussian', 20, 3);
```

(c) What is the difference between the kernel h2 and h3 in terms of filtered images with these kernels? Are they different? 

```matlab   
h2 = fspecial('gaussian', 20, 3);
h3 = fspecial('gaussian', 50, 3);
```

(d) What is the difference between the kernel h2 and h4 in terms of filtered images with these kernels? Are they different? 

```matlab   
h2 = fspecial('gaussian', 20, 3);
h4 = fspecial('gaussian', 20, 20);
```

Please **ignore** the boundary effect. You can do either zero-padding (`same` option in `conv2` in MATLAB) or get the valid area (`valid` option in `conv2` in MATLAB).  

## Problem 4: Hough Transform (30 points)
This problem is to write your own program that extracts a booklet image from each image provided and remove its projective distortion in an automated way.  

Here is a sample demo.  

[![](http://img.youtube.com/vi/wi4LXCr3xfs/0.jpg)](https://youtu.be/wi4LXCr3xfs)

A sample code is provided. You need to write your own code for extracting four corners of the booklet using edge detection and hough transform. In other word, you need to write your own `FindCorner` function. In addition, you need to reuse your `ComputeH`, which was used in Task 3.  

Hint: I used functions of `edge`, `imgaussfilt`, `houghpeaks`, `hough`, `cross`, `norm` in MATLAB to write the `FindCorner`.  However, you can use any functions in OpenCV or MATLAB.  You can use `fitgeotrans` in MATLAB and `getPerspectiveTransform` in Python. 


## Submission of Your Work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* You should turn in a report and codes to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task4_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> Chulmi, Juan Park -> Juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* For writing equations, I recommend the use of latex equations editors introduced in the Markdown tutorial and inserting equation links. However, I also accept for attaching an image of your handwritten equation (but not recommend). 
* Your report includes your answers and styled codes for questions in the problems.
* The formats of the folder and files are 
	* Folder name: Task4_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Code_`Your name` _ `Degree` _ `ID`.m or .py" for codes and "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* The report must be written with Markdown script (GFM) and all other formats like docx or pptx are not permitted. 
* You should also include a report in pdf that must be converted from your report in Markdown.
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guideline, your report will be returned and must be resubmitted. 
> For example, Juan Park is using MATLAB to complete the Task4. Juan needs to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task4_Juanp_BA_000000.zip**. In the folder, there are at least three files: 
> * Code_Juanp_BA_000000.m
> * Rept_Juanp_BA_000000.md
> * Rept_Juanp_BA_000000.pdf
* You may need to include all figures used for writing your report. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleague.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  