# Task02: Signal Processing I

**Announcement**: January 20, 2021        
**1st due date**: January 29, 2021 before 11:59pm  
**2nd due date**: February 05, 2021 before 11:59pm       

The main goal of this task is to understand the fundamental of the data acquisition system and signal processing. You must study all the tutorial to solve the corresponding problems. Please answer all sub-questions in each problem. You might need to write your own code to solve these questions. 

## Problem 1: Sampling (10 points)
**(a)** What is the difference between continuous (or analogue) and discrete (or digital) signals? 

**(b)** Plot a 10 Hz cosine wave with a high sampling rate (nearly analog signal). Please connect the sampled points and plot only four cycles of the wave.     

**(c)** Plot the 10 Hz cosine wave after sampling with 40 Hz. Please plot the sampled data for four cycles of the wave (**do not connect** the sampled points).

**(d)** Plot the 10 Hz cosine wave after sampling with 15 Hz. Please plot only four cycles of the wave (**connect** the sampled points). Do you think that you can get a true frequency of the wave after sampling? 

**(e)** Do you think that you can measure the frequency of the sampled wave in (d) if you add a phase angle to the original wave? For example, the original wave is cos(2&pi;ft + &phi;). Explain your answer. 

**(f)** Do you think that you can measure the frequency of the sampled wave in (d) if you add a dc signal to the original wave? For example, the original wave is cos(2&pi;ft) + d. Explain your answer. 

**(g)** What sampling rate do we use to measure the 10 Hz cosine wave?  

## Problem 2: Aliasing (20 points)

>Aliasing is the phenomenon that the high frequency contents will be ***falsely*** represented by a low frequency and this false frequency is called **alias frequency**. 

**(a)** A 8 Hz sine wave is sampled at 10 Hz. Compute the alias frequency that results from the sampling of the original wave. Plot 12 cycles of the original wave, and overlay the sampled points and connect the points (with a different colour). Please confirm that the sampled signal appears as oscillating with the alias frequency that you found.

**(b)** A 8 Hz sine wave is sampled at 24 Hz. Compute the alias frequency that results from the sampling of the original wave. Plot 12 cycles of the original wave, and overlay the sampled points and connect the points (with a different colour). Please confirm that the sampled signal appears as oscillating with the alias frequency that you found.

**(c)** Assume that the measured signal has a combination of threeperiodic signals:  

![](https://latex.codecogs.com/gif.latex?y%28t%29%3D%20A1cos2%5Cpi%2815%29t%20&plus;%20A2cos2%5Cpi%2845%29t%20&plus;%20A3cos2%5Cpi%2875%29t)

<!--
y(t)= A1cos2\pi(15)t + A2cos2\pi(45)t + A3cos2\pi(75)t
-->

If the signal is sampled at 120 Hz, determine the frequency content of the sampled signal. 

**(d)** Assume that the measured signal has a combination of periodic signals:  

![](https://latex.codecogs.com/gif.latex?y%28t%29%3D%20A1cos2%5Cpi%2815%29t%20&plus;%20A2cos2%5Cpi%2845%29t%20&plus;%20A3cos2%5Cpi%2875%29t)

If the signal is sampled at 160 Hz, determine the frequency content of the sampled signal. 

## Problem 3: Issues in Sampling (15 points)
**(a)** Please explain aliasing. When do they occur? How to avoid them?

**(b)** Please explain quantification errors. When do they occur? How to avoid them?

**(c)** Please explain clipping errors. When do they occur? How to avoid them?  

**(d)** Please explain oversampling issues. When do they occur? What are the consequence of the oversampling? 

**(e)** Assume that a building vibrates with a 5 Hz sine wave: 

![](https://latex.codecogs.com/gif.latex?y%3Dcos%282%5Cpi%20f_0%20t%29%20%5Chspace%7B1cm%7D%20f_0%3D5)

and you measured this vibration using your accelerometer and DAQ system. Please write a code to create three different sampled signals that are damaged by (1) aliasing, (2)  quantization error, and (3) clipping error, respectively. Also, generate a signal having an oversampling issue. You should understand the topics of *Aliasing*, *Quantization*, *Clipping*, and *Oversampling* in `data_aquisition_W21_v1.mlx` to solve this problem. You need to explain why your sampled signals contain each of these errors/issues. You can assume any sampling rate, output range, or ADC resolution to generate these signals. Your code should plot these four signals.     

## Problem 4: Fourier Series 1 (10 points)
**(a)** Plot a **wave1**.  The **wave1** is 

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%20%282%20%5Cpi%20f_0%20t%20%29%20%5Ccdot%20cos%20%282%20%5Cpi%20f_0%20t%20%29)

where f<sub>0</sub> = 15. Please connect sampled points and plot only ten cycles of the wave (You can choose any sampling rate).  

**(b)** Derive a Fourier series (general form) of analytic **wave1**. You should find an analytic equation for coefficients of a<sub>0</sub>, a<sub>n</sub>, and b<sub>n</sub>. 

**(c)** Derive a Fourier series (complex form) of analytic **wave1**. You should find   an analytic equation for a coefficient of c<sub>n</sub>. 

**(d)** Derive a Fourier series (general form) of analytic **wave2**: 

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%20%282%20%5Cpi%20f_0%20t%20%29%20%5Ccdot%20cos%20%282%20%5Cpi%20f_0%20t%20%29%20&plus;%205)

You should find analytic equations for coefficients of a<sub>0</sub>, a<sub>n</sub>, and b<sub>n</sub>. 

**(e)** Please compare the results of (b) and (d) and explain their difference.

## Problem 5: Fourier Series 2 (20 points)
Sawtooth wave: [https://en.wikipedia.org/wiki/Sawtooth_wave](https://en.wikipedia.org/wiki/Sawtooth_wave) 

**(a)** Plot only ten cycles of a reverse sawtooth wave:  

![](https://latex.codecogs.com/gif.latex?x%28t%29%20%3D%20-t%20&plus;%20floor%28t%29)  

**(b)** Derive a Fourier series (general form) for a reverse sawtooth wave: 

![](https://latex.codecogs.com/gif.latex?x%28t%29%20%3D%20-t%20&plus;%20floor%28t%29)  
 
Please check the wikipedia [link](https://en.wikipedia.org/wiki/Sawtooth_wave). You should find an analytic equation for coefficients of a<sub>0</sub>, a<sub>n</sub>, and b<sub>n</sub>. 

**(c)** Derive a Fourier series (complex form) for the same reverse sawtooth wave. You should find an analytic equation for a coefficient of c<sub>n</sub>. 

**(d)** Write a code to create and plot approximated sawtooth waves (# of coefficients (n) = 8)  using the derived Fourier series in the general and complex forms. You should compare the waves from the general and complex forms.   

**(e)** Write a code to find numerical Fourier coefficients in the general and complex forms and compare them with the analytic Fourier coefficients found in (b) and (c).  

*Please explain your answer and findings.* 
*Please study tutorial codes.*

## Problem 6: Fourier Transformation 1 (15 points)
Compute the Fourier transformation (integral) of the following functions and show the derivation process in detail:  

**(a)** cosine wave

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%282%20%5Cpi%20p_0%20t%29)

**(b)** cosine wave + dc (direct current) wave

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%282%20%5Cpi%20p_0%20t%29%20&plus;%20d)

**(c)** two cosine waves

![](https://latex.codecogs.com/gif.latex?y%20%3D%20cos%282%5Cpi%20p_0%20t%29%20&plus;%20cos%282%5Cpi%20p_1%20t%29)

<!-- y = cos(2\pi p_0 t) + cos(2\pi p_1 t)  -->

## Problem 7: Fourier Transformation 2 (10 points)

![](https://latex.codecogs.com/gif.latex?y%28t%29%20%3D%20e%5E%7B-a%5Cleft%20%7C%20t%20%5Cright%20%7C%7D%28b%5Ccdot%20cos2%5Cpi%20f_1t%20&plus;%20c%5Ccdot%20cos2%5Cpi%20f_2t%29)

**(a)** Compute the Fourier transformation (integral) of the above function

**(b)** Plot y in time domain and frequency domain, where a = 1, b = 2, c= 6, f<sub>1</sub> = 3, and f<sub>2</sub> = 6 

**(c)** Plot y in time domain and frequency domain, where a = 0.5, b = 2, c= 6, f<sub>1</sub> = 3, and f<sub>2</sub> = 6 

**(d)** Compare the graphs in (b) and (c)

**Submission of Your Work**
* You should turn in a report to uw.task@gmail.com. When you send your email, please cc your email for future reference.  
* A subject of your email must be the format of "Task02_`Your name` _ `Degree` _ `ID`"
	* `Your name`: first five lower-case letter your **first + last** name. It should be lower case. (i.g Chul Min Yeum -> chulmi, Juan Park -> juanp)   
	* `Degree`: pick your degree among BA, ME, MA, and PH (BA=Undergraduate, ME=MEng, MA=MASc, and PH=PhD)  
	* `ID`: your school ID
	* Please do not include any other text except this subject line.    
* Your report includes styled codes for all three problems (please check the Markdown tutorial for code styling). 
* The report must be written with Markdown script (GFM) and all other formats like .docx or .pptx are not permitted. 
* You should also include a report in pdf that is converted from your report in Markdown.  
* In your submission folder, you should include a report in the format of both .pdf and .md in a folder. And, it should be zipped before attaching it to your email. 
* The formats of the folder and files are 
	* Folder name: Task02_`Your name` _ `Degree` _ `ID` (same with the subject of your email)  
	* File names: "Rept_`Your name` _ `Degree` _ `ID`.md and .pdf".   
* Please review the general submission instruction in the course syllabus. 
* When you violate these submission guidelines, your report may be returned. 

## Note
* Please post a question if you need to help understand the problem and/or tutorials. 
* You are permitted to discuss the task with your colleagues, but do not copy the solutions.     
* Your grade depends on the completeness and clarity of your work.  
* You should include clear and concise comments in your codes.  