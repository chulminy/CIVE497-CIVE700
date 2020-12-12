# Task2: Signal Processing I
<span style="color:darkblue">**Name**: Chul Min Yeum</span>  
<span style="color:darkblue">**Degree**: BA</span>  
<span style="color:darkblue">**ID**: 20002200 </span>

The main goal of this task is to understand the fundamental of data acquisition system and signal processing. You must study the tutorial to solve corresponding problems. Please answer all sub-questions in each problem. You should write your own code to solve these questions.

## Problem 1: Sampling (10 points)

**(a)** What is the difference between a continuous (or analogue) and discrete (or digital) signals?

<span style="color:darkblue">A continuous (or analouge) wave occurs only in the natural environment ....... </span>

**(b)** Plot a 6 Hz sine wave with high sampling rate (nearly analog signal). Please connect sampled points and plot only four cycles of the wave.

```python
import warnings
import math
import matplotlib.pyplot as plt # For ploting
import numpy as np # to work with numerical data efficiently
warnings.simplefilter('ignore')

fs = 200 # sample frequency - per second, high to achieve nearly analog singal
f = 6 # the frequency of the signal, 6 hz

p = 1/f # period
num_c = 4 # need to plot 4 cycles

x = np.arange(0,num_c*p, 1/fs) #the points on the x axis for plotting

# compute the value (amplitude) of the sin wave at the for each sample
y = np.sin(2*np.pi*f*x)

# showing the exact location of the samples
plt.figure(figsize=(15,6))
plt.plot(x, y, '-o',label='Digital')
plt.legend(loc='upper right')
plt.grid(True)
plt.title('6Hz Sine Wave with High Sampling Frequency')
plt.xlabel('Time(sec)')
plt.ylabel('Amplitude')
plt.show()
```
