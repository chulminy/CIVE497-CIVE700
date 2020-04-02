# Task8: Neural Network

**Announcement**: April 02, 2020    
**Due date**: April 25, 2020 (Saturday) before 11:59 pm      

**NO MORE DELAY: Please submit your report earlier**   

The main goal of this task is to understand the fundamental of neural network through training your own models. Several sample examples are provided in the [**tutorial**](https://github.com/chulminy/CIVE497-CIVE700/tree/master/tutorial/neural_network/neural_network_code). I recommend reviewing the tutorial codes in the folder and making an effort to learn how the codes work.  
    
## Problem 1 (40 points)
**(a)** Try out a neural network playground in this link: [http://playground.tensorflow.org](http://playground.tensorflow.org). Run all four examples by changing features, # of hidden layers, # of neurons, activation function, and/or learning rate. Please watch a convergence speed of the loss depending on the parameter changes that you made. (You do not need to include your results in your report).

**(b)** Please run all demos in the [**tutorial**](https://github.com/chulminy/CIVE497-CIVE700/tree/master/tutorial/neural_network/neural_network_code). I recommend that you configure parameters to improve the results. Please watch my review video.  

[![](video.png)](https://www.youtube.com/watch?v=_T4svgLaaNw)
[**video download**](https://www.dropbox.com/s/ge762fye621hd2l/2020-04-01_22-28-54.mp4?dl=0)

(Sorry, I used a wrong microphone so the audio quality is not good).

In your report, **briefly** explain (1) an objective of each sample demo, (2) what change I made in default codes or you made (if you configure the network), and (3) a screenshot of the final plot. Basically, you introduce your model and its performance. The default parameters are the ones that I tuned but might not be the best. You can find better neural network architecture by changing # of neurons, activation functions, or loss function. You can also change the learning rate. If you achieve performance improvement, please introduce your network configuration. You can allow changing the code if you can improve the model performance.  

## Problem 2 (80 points) 
You are going to build your own model using neural network  

(a) Create your own dataset and build a classifier. Please do not create the dataset similar to the examples provided. Please be creative! You will get the idea from the several demos in the tutorial. For example, like the polynomial example, think about making a sample data from a known model. 

(b) Search for real-world dataset from [UCI Machine Learning data repository](https://archive.ics.uci.edu/ml/index.php) or other data repository. You can build either a regression or classification model. The performance of the model will not be evaluated but the model should be reasonable and acceptable. For instance, the accuracy of the binary classifier should not be less than 0.5. Please think about how to visualize your result that your model is learned from the actual data. If you download raw data from the web, you should pre-process or transform the data so that it become a trainable form. You will get some hints from the demos. You will get extra mark if you fully utilize the techniques that are implemented in the demos. Again, you can allow changing the code if you can improve the model performance.

## Python users
If students can write their own python scripts of neural network, the students will receive a full mark plus 20 extra marks. The neural network does not have to support multiple-hidden layers but let users control the number of neurons (nodes) in input, hidden and output layers, activation functions and loss functions for supporting regression or classification. Students need to validate their scripts using one of the dataset provided or new dataset from UCI. You can review to existing neural network ("from scratch") codes on the web (if they have) but, do not copy those codes for your report. 

## Submission of Your Work
* You should turn in a report and codes to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task8_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> Chulmi, Juan Park -> Juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* For writing equations, I recommend the use of latex equations editors introduced in the Markdown tutorial and inserting equation links. However, I also accept for attaching an image of your handwritten equation (but not recommend). 
* Your report includes your answers and styled codes for questions in the problems.
* The formats of the folder and files are 
	* Folder name: Task8_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Code_`Your name` _ `Degree` _ `ID`.m or .py" for codes and "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* The report must be written with Markdown script (GFM) and all other formats like docx or pptx are not permitted. 
* You should also include a report in pdf that must be converted from your report in Markdown.
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guideline, your report will be returned and must be resubmitted. 
> For example, Juan Park is using MATLAB to complete the Task8. Juan needs to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task8_Juanp_BA_000000.zip**. In the folder, there are at least three files: 
> * Code_Juanp_BA_000000.m
> * Rept_Juanp_BA_000000.md
> * Rept_Juanp_BA_000000.pdf
* You may need to include all figures used for writing your report. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleague.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  