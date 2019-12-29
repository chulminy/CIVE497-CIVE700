# Task1: Signal Processing I

**Announcement**: ND  
**Due Date**: ND    

The main goal of this task is to understand the fundamental of data acquisition system and signal processing. You must study the tutorial to solve corresponding problems. Please answer all sub-questions in each problem. You should write your own code to solve these questions. 

## Problem 1: Sampling (10 points)
**(a)** What is the difference between a continuous (or analogue) and discrete (or digital) signals? 

**(b)** Plot a 6 Hz sine wave with high sampling rate (nearly analog signal). Please connect sampled points and plot only four cycles of the wave.     

**(c)** Plot the 3 Hz sine wave after sampling with 10 Hz. Please do not connect sampled points and plot the sampled data for four cycles of the wave.

**(d)** Plot the 6 Hz sine wave after sampling with 12 Hz. Please do not connect sampled points  and plot only four cycles of the wave. Do you think that you can measure this wave if you add a phase angle (&phi;) on this sine wave? for example, the wave is sin(2&pi;ft + &phi;).

## Problem 2: Aliasing (10 points)
We learned when aliasing occurs and how it is related to the sampling frequency of the data acquisition system.   
**(a)** A 6 Hz sine wave is sampled at 8 Hz. Compute the alias frequency that can be represented in the resulting sampled signal. Plot the wave and sampled points.

**(b)** A 15 Hz sine wave is sampled at 15 Hz. Compute the alias frequency that can be represented in the resulting sampled signal. Plot the wave and sampled points.

**(c)** Assume that the measured signal has a combination of periodic signals:  

![](https://latex.codecogs.com/gif.latex?y%28t%29%20%3D%20A1%20sin%202%5Cpi%20%2825%29t%20&plus;%20A2%20sin%202%5Cpi%20%2875%29t%20&plus;%20A3%20sin%202%5Cpi%20%28125%29t)

If the signal is sampled at 100 Hz, determine the frequency content of the resulting discrete response signal.

**(d)** Assume that the measured signal has a combination of periodic signals:  

![](https://latex.codecogs.com/gif.latex?y%28t%29%20%3D%20A1%20sin%202%5Cpi%20%2825%29t%20&plus;%20A2%20sin%202%5Cpi%20%2875%29t%20&plus;%20A3%20sin%202%5Cpi%20%28125%29t)

If the signal is sampled at 150 Hz, determine the frequency content of the resulting discrete response signal.

## Problem 3: Issues in Sampling (20 points)
**(a)** Please explain a quantization error. When do they occur? How to avoid?

**(b)** Please explain a clipping error. When do they occur? How to avoid?  

**(c)** Please explain an oversampling issue. When do they occur? What are the consequence of the oversampling? 

**(d)** Assume that a building vibrates with a 5 Hz sine wave: 

![](https://latex.codecogs.com/gif.latex?y%3Dsin%282%5Cpi%20f_0%20t%29%20%5Chspace%7B1cm%7D%20f_0%3D5)

and you measured this vibration using your accelerometer and DAQ system. Please write a code to create three different sampled signals that are damaged by aliasing, quantization error and clipping error, respectively. Also, generate a signal having an oversampling issue. You should understand the topics of *Aliasing*, *Quantization*, *Clipping*, and *Oversampling* in `data_cquisition_V3.mlx` to solve this problem. You need to explain why your sampled signals contain each of these errors/issue. You can assume any sampling rate, output range, or ADC resolution to generate these signals. Your code should plot these three signals.     

## Problem 4: Fourier Series 1 (15 points)
**(a)** Plot a **wave1** sampled with a 50 Hz sampling rate. The **wave1** is 

![](https://latex.codecogs.com/gif.latex?y%20%3D%20sin%20%282%20%5Cpi%20f_0%20t%20%29%20%5Ccdot%20sin%20%282%20%5Cpi%20f_0%20t%20%29)

where f<sub>0</sub> = 10. Please connect sampled points and plot only ten cycles of the wave.  

**(b)** Derive a Fourier series (general form) of analytic **wave1**. You should find analytic equations for coefficients of a<sub>0</sub>, a<sub>n</sub>, and b<sub>n</sub>. 

**(c)** Derive a Fourier series (complex form) of analytic **wave1**.You should find  an analytic equations for a coefficient of c<sub>n</sub>. 

**(d)** Derive a Fourier series (general form) of analytic **wave2**: 

![](https://latex.codecogs.com/gif.latex?y%20%3D%20sin%20%282%20%5Cpi%20f_0%20t%20%29%20%5Ccdot%20sin%20%282%20%5Cpi%20f_0%20t%20%29%20&plus;%205)

You should find analytic equations for coefficients of a<sub>0</sub>, a<sub>n</sub>, and b<sub>n</sub>. 

**(e)** Please compare the results of (b) and (d) and explain their difference.

## Problem 5: Fourier Series 2 (15 points)
Sawtooth wave: [https://en.wikipedia.org/wiki/Sawtooth_wave](https://en.wikipedia.org/wiki/Sawtooth_wave) 

*See Sampling in `signal_processing_V4.mlx`*

**(a)** Plot only ten cycles of a sawtooth wave:  

![](https://latex.codecogs.com/gif.latex?x%28t%29%20%3D%20t%20-%20floor%28t%29)  

**(b)** Derive a Fourier series (general form) for a sawtooth wave: 

![](https://latex.codecogs.com/gif.latex?x%28t%29%20%3D%20t%20-%20floor%28t%29)  
 
Please check the wikipedia [link](https://en.wikipedia.org/wiki/Sawtooth_wave). You should find analytic equations for coefficients of a<sub>0</sub>, a<sub>n</sub>, and b<sub>n</sub>. 

**(c)** Derive a Fourier series (complex form) for the same sawtooth wave.You should find  an analytic equation for a coefficient of c<sub>n</sub>. 

**(d)** Write a code to create and plot approximated sawtooth waves (# of coeffcients (n) = 8)  using the derived Fourier series in the general and complex forms. You should compare the waves from the general and complex forms.   

**(e)** Write a code to find numerical Fourier coefficients in the general and complex forms and compare them with the analytic Fourier coefficients found in (b) and (c).  

## Problem 6: Fourier Transformation 1 (15 points)
Compute the Fourier transformation (integral) of the following functions and show the derivation process in detail. 

**(a)** sine wave

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%282%20%5Cpi%20p_0%20t%29)

**(b)** sine wave + dc (direct current) wave

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%282%20%5Cpi%20p_0%20t%29%20&plus;%20d)

**(c)** Gaussian function

![](https://latex.codecogs.com/gif.latex?y%20%3D%20%5Cfrac%7B1%7D%7B%7B%5Csigma%20%5Csqrt%20%7B2%5Cpi%20%7D%20%7D%7De%5E%7B%7B%7B%20-%20%5Cleft%28%20x%20%5Cright%29%5E2%20%7D%20%5Cmathord%7B%5Cleft/%20%7B%5Cvphantom%20%7B%7B%20-%20%5Cleft%28%20%7Bx-%20%5Cmu%20%7D%20%5Cright%29%5E2%20%7D%20%7B2%5Csigma%20%5E2%20%7D%7D%7D%20%5Cright.%20%5Ckern-%5Cnulldelimiterspace%7D%20%7B2%5Csigma%20%5E2%20%7D%7D%7D)

## Problem 7: Fourier Transformation 2 (15 points)

**(a)** Compute the Fourier transformation (integral) of the following function

![](https://latex.codecogs.com/gif.latex?y%28t%29%20%3D%20e%5E%7B-a%5Cleft%20%7C%20t%20%5Cright%20%7C%7D%28b%5Ccdot%20cos2%5Cpi%20f_1t%20&plus;%20c%5Ccdot%20cos2%5Cpi%20f_2t%29)


**(b)** Plot y in time domain and frequency domain, where a = 1, b = 2, c= 6, f<sub>1</sub> = 3, and f<sub>2</sub> = 6 


**(c)** Plot y in time domain and frequency domain, where a = 0.5, b = 2, c= 6, f<sub>1</sub> = 3, and f<sub>2</sub> = 6 


## Submission of Your Work
* You should turn in a report and codes to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task1_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five letter your first + last name. The first letter is uppercase and the rest of them are lowercase (i.g Chul Min Yeum -> Chulmi, Juan Park -> Juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* For writing equations, I recommend the use of latex equations editors introduced in the Markdown tutorial and inserting equation links. However, I also accept for attaching an image of your handwritten equation (but not recommend). 
* Your report includes your answers and styled codes for questions in the problems.
* **You also submit a single code file that includes the codes for all problems.**
* Please see the sample report format [**here**](Task1_Juanp_BA_000000). 
* The formats of the folder and files are 
	* Folder name: Task1_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Code_`Your name` _ `Degree` _ `ID`.m or .py" for codes and "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* The report must be written with Markdown script (GFM) and all other formats like docx or pptx are not permitted. 
* You should also include a report in pdf that must be converted from your report in Markdown.
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guideline, your report will be returned and must be resubmitted. 
> For example, Juan Park is using MATLAB to complete the Task1. Juan need to submit his report and codes to **uw.task@gmail.com** with an attachment of **Task1_Juanp_BA_000000.zip**. In the folder, there are at least three files: 
> * Code_Juanp_BA_000000.m
> * Rept_Juanp_BA_000000.md
> * Rept_Juanp_BA_000000.pdf

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleague.   
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  