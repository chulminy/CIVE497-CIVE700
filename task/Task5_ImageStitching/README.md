# Task5: Image Stitching & RANSAC

**Announcement**: March 08, 2019  
**1st due date**: March 19, 2019 (Tuesday) before 11:59 pm  
**2nd due date**: March 24, 2019 (Sunday) before 11:59 pm  

The main goal of this task is to understand the fundamental of a feature extraction and matching method (Scale-invariant feature transform (SIFT)) and a Random sample consensus (RANSAC) method to estimate model parameters. You must study the relevant tutorials to solve the corresponding problems. Please answer all sub-questions in each problem. You should write your own code to solve these questions *if needed*. 

* The quality of tools and results will be evaluated in this task. You need to clearly draw points and lines on your results (similar to the samples provided).
* You need to include all your results in the report. 

## Problem 1: Separable Filter (10 points)
Please answer these questions **in detail**.

**(a)** What is a separability of the Gaussian kernel? When do we use this separability and why does this characteristic reduce the computing cost?  
**(b)** What is the Laplacian of Gaussian (LoG)? When do we use LoG? 
**(c)** Is LoG separable? 
**(d)** What is a difference of the Guassian (DoG)? When do we use and what is DoG advantageous compared to LoG?

Hint: [**Link1**](https://blogs.mathworks.com/steve/2006/10/04/separable-convolution/), [**Link2**](http://songho.ca/dsp/convolution/convolution.html)

## Problem 2: Least Squares (20 points)

**(a)** Explain the approach 1 and approach 2 for least squares line fitting in your words. Please refer the course slide and tutorials. 

A response y<sub>i</sub> is measured from a linear system when an input is x<sub>i</sub>. The measurement data is provided (`prob2_data1.mat`). A model of your system can be approximated as y<sub>i</sub> = mx<sub>i</sub> + b. Please find m and b using the following methods. 

**(b)** Least squares (approach 1) 

**(c)** Least squares (approach 2)

Here is another measurement data (`prob2_data2.mat`). Please find m and b using the following methods. 

**(d)** Least squares (either approach 1 or approach 2)

**(e)** Use of RANSAC. You need to have your own RANSAC implementation without using existing functions in MATLAB (Do not use `ransac` or any other relevant functions)

**(f)** When do we use either least squares or RANSAC? What are the pros and cons in each technique? 

## Problem 3: Fitting using RANSAC (30 points)

**(a)** Fit an ellipse to the given data (`prob3_ellipse.mat`) using RANSAC

**(b)** Fit a fourth degree polynomials to the given data (`prob3_polynomial.mat`) using RANSAC 

Note that you need to write your own code for implementing RANSAC similar to Problem 2.

</br>

:star: :star: **You need to install** [**vl_feat**]() **to solve the following problems 4, 5, and 6.**  

## Problem 4: Improved 3D Planar Measurement Tool (30 points)

You are going to build an improved 3D planar measurement tool. This application is designed to measure a 3D distance on a plane **without picking the corners of the booklet in advance**. Users will take a photo in a planar surface where a calibrate paper (here, booklet) is placed and simply click two points on the image for measurement. This reduces a step for picking the corners of your calibration paper.  

Here is a demo video:

[![](http://img.youtube.com/vi/dDCpKbBqDj0/0.jpg)](https://www.youtube.com/watch?v=dDCpKbBqDj0)

**(a)** Build your own measurement tool and evaluate your measurement using the images provided (see the folder of `prob4_img`). You may need to estimate homography based on SIFT feature matching. The exact size of the booklet is **24 cm x 31.5** cm and use `cover.jpg` to solve this problem.

**(b)** Prepare your own calibration paper and take photos similar to the ones in (a). Then, evaluate your tool. 

**(c)** Compare measurements using this new tool and the one developed in Task 3.  

Note that you should not do hard cording. This means the corner points of the booklet on your **test image** is completely unknown.  

## Problem 5: Book Classification using SIFT (30 points)
You are going to categorize books on images. Here are the input images and expected outcomes. 

|Test image|Result|
|:----:|:-----:|
|![](IMG_0219.JPG)|![](IMG_0219_out.jpg)|
|![](IMG_0223.JPG)|![](IMG_0223_out.jpg)|

Your code needs to automatically compute the outlines (boundary) of each book and its identity (book name). There are 17 images (see the folder of `prob5_img`) and in each image, four books are placed on a desk. Your code should not fail to identify a book or estimate its boundary more than 5 books among all books (85 = 17 images x 5 books). Note that you should not do hard cording as well. 

Hint: You can reuse the code that you are developing in Problem 4. Like `cover.jpg`, you need to prepare cover images and name them. Note this problem **cannot** be solved using Hough transform. 

## Problem 6: Image Stitching (30 points)

First, go to an [**image stitching tutorial**](https://www.mathworks.com/help/vision/examples/feature-based-panoramic-image-stitching.html) and thoroughly review the code. You have to fully understand its process. 

Second, you are going to update this code. Your code must satisfy the following conditions:
* Do not use `imageDatastore` and related functions that call this object in MATLAB. 
* Use SIFT feature extractor and descriptor rather than `SURF`. You can use `vl_sift` for MATLAB and opencv for Python. 
* Do not use `estimateGeometricTransform` and replace it using your own homography estimator that you may developed in problem 4. You need to use RANSAC for robust matching. 
 
Third, test your code using the building dataset (the image set used in the tutorial) in MATLAB. For Python users, you can find those images `prob6_building_img`.

Fourth, **take your own image set** from a scenic place and stitch them to create a nice panorama image. You **should not** download images on the web or use my images and should not share your images with your colleagues. Please take your images using your cameras. 

If your resulting panorama is not a good quality, you need to explain what makes drop its quality. 

## Submission of Your Work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* You should turn in a report and codes to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task5_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> Chulmi, Juan Park -> Juanp)   
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
> For example, Juan Park is using MATLAB to complete the Task5. Juan needs to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task5_Juanp_BA_000000.zip**. In the folder, there are at least three files: 
> * Code_Juanp_BA_000000.m
> * Rept_Juanp_BA_000000.md
> * Rept_Juanp_BA_000000.pdf
* You may need to include all figures used for writing your report. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your **colleagues**.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  