# CIVE 497/700 Task 7 - Scan Registration
**Announcement:** March 24, 2019

**1st due date:** April 8, 2019

**2nd due date:** April 15, 2019

The goal of this task is to get familiar with scan registration. You will get to use the tools available in matlab to perform ICP on real point cloud data from one of the robots in the SDIC lab (http://www.civil.uwaterloo.ca/snarasim/). You are also allowed to solve this using Python, however, no code has been written in Python to help. The assignment has been structured to require minimal programming experience. The outline of the code has been included in main.m, you simply need to go through and add all the correct inputs to all the functions (you will need to refer to Matlab's docs to understand what the inputs mean).

## Problem Statement

You have been hired by the University of Waterloo to measure the size of the whiteboard in the SDIC lab (E2-2342A). Luckily, you have an autonomous rover that can drive around the university, take 3D scans and images of the classes/labs. You have decided to use this data to make the measurements. This rover, named RobEn (Robot Engineer), is shown in the Figure below. The lab setup is also shown below.

![RobEn](https://github.com/nickcharron/CIVE_497_700_Task_7/blob/master/RobEn.jpg)
![RobEn](https://github.com/nickcharron/CIVE_497_700_Task_7/blob/master/labSetup.jpg)

RoBen is equipped with a Velodyne VLP-16 lidar and a Point Grey Ladybug5+ 360 degree camera. The lidar is mounted (vertically) to a shaft which rotates 360 degrees thanks to a servo motor with precise absolute optical encoders. The device driver combines the scans from the lidar as it rotates using the encoder information. This results in a very detailed scan for each scan location. Furthermore, 5 images are captured with the Ladybug at each scan location. All of the cameras have been calibrated intrinsically and extrinsically. We have access to the intrinsics (K matrices) for the each camera, as well as the extrinsics (T matrices) between each of the 5 camera frames and the lidar frame. Since we have all the calibrations, we can use these images to colour the point cloud.

Unfortunately, some nosy bystander was standing in front of the robot while it was trying to scan the whiteboard. As a result, you will need to combine two scan together in order to measure the whiteboard. We have provided you the code outline to complete this task, please use this to measure the whiteboard once the two scans have been combined.

The code to complete this assignment is on the course github. You will also need to download the scans which were not uploaded to github due to the max file size limit of 100MB with Github. Download the scans here: https://drive.google.com/open?id=1arQKEaDZ2MzgPpIuPIah7e9ru6ViMHcG

## Questions:

1. As discussed in the lectures, the most important part of scan registration is having some initial estimation of the transformation between the two scans you are registering. Luckily, the robot has wheel encoders and an IMU and ran an extended kalman filter (EKF) to estimate its motion between the two scans. This EKF outputted a displacement from location C to location D of -3.76m in the x direction, -0.5m in the y direction, and 135 degrees about the z-axis. Use this for your initial guess, and refine it using ICP. Add the following plots to your report:

	* i) scanC and scanD after all your pre-processing (cropping, denoising, downsampling) - use 2 subfigures
	* ii) scanD + your esimated transform applied to scan C (use downsampled cloud) - subfigure 1,  scanD + your final transform from ICP applied to scan C (use downsampled cloud) - subfigure 2
	* iii) same as ii but with only the whiteboard area showing - similar to the figure below (crop out the surroundings) 		 

2. Now assume your research supervisor "cheaped out" and didn't buy you an IMU for your robot. This means your robot could only estimate its change in position using the wheel encoders. Unfortunately, wheel encoders are not good for tracking rotation due to the wheel slippage that can't be accounted for. Change your initial estimate to 110 degree rotation about the z-axis. Provide the same plots as in Q1. Did ICP converge this time? If, not why? Can you tune your parameters and pre-processing to get this to converge? If so, what did you do and why do you think that work?

3. Let's assume we need to use your code to perform robot localization online (while the robot is moving). To complete this, we need to get these scan registration measurements at 1Hz meaning your ICP code has to run in under one second (ignore the time to load and pre-process the scans, let's assume you can parallelize your code to perform that in the background). What parameters can you tune to help increase computation time? Are you able to achieve this rate? If so, what parameters did you use? (I understand that this is depended on your computer, so if you can't achieve this then just explain what you tried). Use the initial estimate from Q1.

4. Based on your best registration results, measure the following in your combined point cloud: (use the cropped version that only shows the white board area)

		* i) whiteboard width
		* ii) whiteboard height
		* iii) length of the blue arrow on the whiteboard

		* NOTE: To measure (iii) you will need to combine the image data with your combined scan. Uncomment the code at the bottom of your script and this should run the colourization for you. Make sure you use the combined scans cropped to only show the whiteboard area (use crop boundaries: [-3.5, 0.5; -5, -1; -1, 10]). You can measure points on the cloud using any method of your choice. Some options include (1) eyeballing based on the grid from the matlab plots, (2) saving the point cloud and opening in a point cloud editor such as CloudCompare or MeshLab (free software), (3) using built in functionality of Matlab.

5. If you have done all the step correctly, your coloured scan should look similar to the image below. This scan was made by projecting the xyz points onto to image plane for the camera. After projecting each point into the image plane, the colour associated with the pixel that the point projected onto can be assigned to that point in the cloud. This was performed with the combined scan (2 scans) and just one image. Notice that the colour on the board is repeated on multiple locations. This is not a calibration issue. What do you think caused this? How would you fix this?

![colouredScan](https://github.com/nickcharron/CIVE_497_700_Task_7/blob/master/colouredScan.jpg)

6. BONUS: Implement an automated fix to solve the problem shown in Q5. You can use any procedure that you want. I have included the image that was taken at scan location C, along with the calibration results in case you want to use this image. By "automated fix" I mean something that can work for any general scan, do not manually remove the colours for those points. Explain your solution.

## Notes on submission of your work
* **YOU MUST INCLUDE YOUR RESULTING GRAPHS OR IMAGES INTO YOUR REPORT**
* **FOR THIS ASSIGNMEND ONLY, PLEASE ALSO INCLUDE A .ZIP FILE WITH YOUR CODE**
* You should turn in a report and codes to uw.task@gmail.com **AND ncharron@uwaterloo.ca**. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task6_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> Chulmi, Juan Park -> Juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* For writing equations, I recommend the use of latex equations editors introduced in the Markdown tutorial and inserting equation links. However, I also accept for attaching an image of your handwritten equation (but not recommend).
* Your report includes your answers and styled codes for questions in the problems.
* The formats of the folder and files are
	* Folder name: Task6_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Code_`Your name` _ `Degree` _ `ID`.m or .py" for codes and "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* The report must be written with Markdown script (GFM) and all other formats like docx or pptx are not permitted.
* You should also include a report in pdf that must be converted from your report in Markdown.
* Please review the general submission instruction in the course syllabus.
* When you violate these submission guideline, your report will be returned and must be resubmitted.
> For example, Juan Park is using MATLAB to complete the Task6. Juan needs to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task6_Juanp_BA_000000.zip**. In the folder, there are at least three files:
> * Code_Juanp_BA_000000.m
> * Rept_Juanp_BA_000000.md
> * Rept_Juanp_BA_000000.pdf
* You may need to include all figures used for writing your report.

## Other Notes
* The sample code has been tested on Matlab 2016a and up. You will have to uncomment some notes in there if you are on 2016. If you are missing functions, you may need to upgrade your Matlab. Come see the professor or TA if this is the case.
* Please post a question if you need to help understand the problem and/or tutorials.
* You are permitted to discuss the task with your **colleagues**.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  
