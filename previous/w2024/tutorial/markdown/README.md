# Writing with Markdown in GitHub
**Author:** Chul Min Yeum  
**Email:** cmyeum@uwaterloo.ca  

Last updated: 11/06/18  

## Table of Contents
- [Introduction](#introduction)
	- [Description](#description)
	- [Useful Links](#useful-links)
- [Markdown Syntax](#markdown-syntax)
	- [Headers](#headers)
	- [Emphasis](#emphasis)
	- [Ordered List](#ordered-list)
	- [Unordered List](#unordered-list)
	- [Link](#link)
	- [Images](#images)
	- [Tables](#tables)
- [Miscellaneous](#miscellaneous)
	- [Videos](#videos)
	- [Code and Syntax Highlighting](#code-and-syntax-highlighting)
	- [Emoji](#emoji)
	- [HTML](#html)
	- [LaTex Equations](#latex-equations)

## Introduction
### Description
[Markdown](https://en.wikipedia.org/wiki/Markdown) is a plain text formatting syntax. It is designed to easily style text and convert it to many other formats (e.g. HTML, PDF). GitHub currently supports [GitHub Flavored Markdown (GFM)](https://github.github.com/gfm/) for user content on GitHub.com, which include extra features on general Markdown syntax. With GFM, you can readily (1) format the word (e.g. bold, italic), (2) highlight a paragraph or code block, (3) link images, equations, or videos, (4) draw tables, and (5) use HTML syntax for additional formatting. This document provides a quick overview of useful GFM syntax and some extract components so that students can write organized and readable posts and comments in GitHub.

### Useful links
- [Markdown syntax in GitHub](https://help.github.com/articles/basic-writing-and-formatting-syntax/): Basic introduction of markdown syntax (also see [Markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet))
- [MarkdownPad](http://markdownpad.com): Best editor for markdown scripting (also see [rending GFM script in Markdownpad](http://forums.apricitysoftware.com/t/gfm-online-mode-ssl-tls-secure-channel-aborts/1313/7))
- [Markdown table generator](https://www.tablesgenerator.com/markdown_tables): Useful for generating large tables
- [EMOJI cheat sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/): Useful for using emoji in Markdown

## Markdown Syntax
**Here is an overview of general Markdown syntax**

### Headers
    	
	# H1
    ## H2
    ### H3
    #### H4
    ##### H5
    ###### H6

# H1
## H2
### H3
#### H4
##### H5
###### H6  


### Emphasis
	**bold**, *italic*, ***bold&italtic***, ~~strikethrough~~ 

**bold**, *italic*, ***bold&italtic***, ~~strikethrough~~

	>Blockquote

>Blockquote


Code block

	Code block


### Underline Style    
  
    Underline Style
    --------
    
Underline Style
--------

### Ordered List 
    1. one
   	  1.1 one.one
      1.2 one.two
      1.3 one.three
    2. Two
    3. Three
   

1. one  
  1.1 one.one  
  1.2 one.two  
  1.3 one.three  
2. Two  
3. Three  


### Unordered List 
    * List
      * List
      * List
    * List
    * List

* List
  * List
  * List
* List
* List
 
### Link
	[course website](https://github.com/chulminy/CIVE497-CIVE700) 	
[course website](https://github.com/chulminy/CIVE497-CIVE700) 	

	[**course website**](https://github.com/chulminy/CIVE497-CIVE700) 	
[**course website**](https://github.com/chulminy/CIVE497-CIVE700) 	

    [course website][1]

    [1]: https://github.com/chulminy/CIVE497-CIVE700

[course website][1]  

[1]: https://github.com/chulminy/CIVE497-CIVE700    

    [course website][Link1]

    [Link1]: https://github.com/chulminy/CIVE497-CIVE700
    
[course website][Link1]

[Link1]: https://github.com/chulminy/CIVE497-CIVE700  


### Images
    ![place holder](https://via.placeholder.com/900x150)
    
![place holder](https://via.placeholder.com/900x150)

    ![lena color](lena_color.gif)
![lena color](lena_color.gif)


### Tables
	|  Tables  |      Are      |  Cool |
	|----------|:--------------|------:|
	| col 1 is |  left-aligned | $1600 |
	| col 2 is |    centered   |   $12 |
	| col 3 is | right-aligned |    $1 |
    

|  Tables  |      Are      |  Cool |
|----------|:--------------|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |



	|  Lena  |    Lena   |  placeholder |  Lena  |
	|--------|:----------|------:|------|
	|![lena color](lena_color.gif)|![lena color](lena_color.gif)|![placeholder](https://via.placeholder.com/512)|![lena color](lena_color.gif)|


|  Lena  |    Lena   |  placeholder |  Lena  |
|--------|:----------|------:|------|
|![lena color](lena_color.gif)|![lena color](lena_color.gif)|![placeholder](https://via.placeholder.com/512)|![lena color](lena_color.gif)|


## Advanced Topics

### Videos

	FORMAT
	[![](http://img.youtube.com/vi/VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID)

**ROI Localization Technique**  

    [![](http://img.youtube.com/vi/6RitH-CY7bk/0.jpg)](https://www.youtube.com/watch?v=6RitH-CY7bk)

[![](http://img.youtube.com/vi/6RitH-CY7bk/0.jpg)](https://www.youtube.com/watch?v=6RitH-CY7bk)


**Automatic Reconnaissance Image Organizer (ARIO)**  
    
	[![](ARIO.png)](https://www.youtube.com/watch?v=zNwoogoYQ7o)
    
[![](ARIO.png)](https://www.youtube.com/watch?v=zNwoogoYQ7o)



### Code and Syntax Highlighting

**Python Code Styling**
```python
import numpy as np

a = np.array([1, 2, 3])   # Create a rank 1 array
print(type(a))            # Prints "<class 'numpy.ndarray'>"
print(a.shape)            # Prints "(3,)"
print(a[0], a[1], a[2])   # Prints "1 2 3"
a[0] = 5                  # Change an element of the array
print(a)                  # Prints "[5, 2, 3]"

```

**MATLAB Code Styling**
```matlab
% Array creation, combining, reshaping, rearranging, and indexing
% https://www.mathworks.com/help/matlab/matrices-and-arrays.html
logicStr = {'False', 'True'};
PrtEqual = @(M1Str, M1, M2Str, M2) fprintf('%s and %s are the same: %s', M1Str, M2Str, logicStr{isequal(M1, M2)+1});

% zeros and ones
M1 = zeros(5,5);
M2 = ones(5,5);
PrtEqual('M1', M1, 'M2-1', M2-1);
```

### Emoji
See this link: https://gist.github.com/rxaviers/7360908


	|  :one: |   :two:|  :zero: | :keycap_ten: |
	|----------|----------|----------|----------|
	| :smile: |  :laughing: | :confused: | :flushed: |
	| :+1: |:-1:   |   :clap: | :hand:|



|  :one: |   :two:|  :zero: | :keycap_ten: |
|----------|----------|----------|----------|
| :smile: |  :laughing: | :confused: | :flushed: |
| :+1: |    :-1:   |   :clap: | :hand: |


### HTML

	<img src="https://via.placeholder.com/500x150"> <img src="https://via.placeholder.com/500x150" width="300" height="150"> 

<img src="https://via.placeholder.com/500x150"> <img src="https://via.placeholder.com/500x150" width="300" height="150"> 

	a b
	a        b
	a&nbsp;&nbsp;&nbsp;&nbsp;b

a b  
a        b  
a&nbsp;&nbsp;&nbsp;&nbsp;b  

    abc1
    

    
    abc2
    
    abc3
    <br/>
    <br/>
    <br/>
	abc4
    
abc1



abc2

abc3
<br/>
<br/>
<br/>
abc4

### LaTex Equations
**Please watch the following video:**

[![](https://img.youtube.com/vi/dpVnmxpVdvg/0.jpg)](https://www.youtube.com/watch?v=dpVnmxpVdvg)

1. **Go to the** [**following website**](https://www.codecogs.com/latex/eqneditor.php)

2. **Type your equation in LaTex syntax**

```latex
P=
  \begin{bmatrix}
   f & 0 & p_x \\
   0 & f & p_x \\
   0 & 0 & 1 \\
  \end{bmatrix}

```
3. **Get the link of the equation**  

![](LaTex.png)

4. **Copy the link**

```
![](https://latex.codecogs.com/gif.latex?P%3D%20%5Cbegin%7Bbmatrix%7D%20f%20%26%200%20%26%20p_x%20%5C%5C%200%20%26%20f%20%26%20p_x%20%5C%5C%200%20%26%200%20%26%201%20%5C%5C%20%5Cend%7Bbmatrix%7D)
```    
   
![](https://latex.codecogs.com/gif.latex?P%3D%20%5Cbegin%7Bbmatrix%7D%20f%20%26%200%20%26%20p_x%20%5C%5C%200%20%26%20f%20%26%20p_x%20%5C%5C%200%20%26%200%20%26%201%20%5C%5C%20%5Cend%7Bbmatrix%7D)
