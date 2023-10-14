# CIVE497/700: Smart Structure Technology (Winter, 2024)

<span style="background-color: #FFFF00"> The instructor is currently updating this website in preparation for the upcoming course. To view the full syllabus, please refer to the course website from the previous year: [**LINK**](https://github.com/chulminy/CIVE497-CIVE700/tree/master/previous/w2022) </span>

![](intro_img.png)

**Instructor:** Chul Min Yeum (E2-2313)   
**Class:** <!-- Mon and Wed, 08:30AM to 9:50AM at E2-2350 -->    
**Email:** cmyeum@uwaterloo.ca   
**Office Hours:** <!-- Mon and Wed 10 to 11AM at E2-2313 -->  
**TA:**     

Last updated: 2022-04-04  

**Previous offerings of this course**
- [**Smart Structure Technology (Winter, 2022)**](previous/w2022)  
- [**Smart Structure Technology (Winter, 2021)**](previous/w2021)  
- [**Smart Structure Technology (Winter, 2020)**](previous/w2020)  
- [**Smart Structure Technology (Winter, 2019)**](previous/w2019)  

## Announcement
* **Jan 01, 2024:** Welcome to a Smart Structure System Course
   
## Table of Contents
- [**Course Description**](#course-description)
- [**Intended Learning Outcomes**](#intended-learning-outcomes)
- [**Prerequisite**](#prerequisite)
- [**Course Textbook**](#course-textbook)
- [**Course Outline**](#course-outline)
- [**Tasks**](#tasks)
- [**Communication**](#communication)
- [**Grading**](#grading)
- [**Note**](#note)

## Course Description
This course offers an introduction to the emerging **smart structure technologies** in civil engineering. Smart structures integrate sensing, actuation, data processing, analysis, and visualization, and control capabilities so that a structure can sense and respond to its changing external conditions in a rapid and automated manner. Among several topics in smart structure, this course focuses on [**structural assessment**](https://en.wikipedia.org/wiki/Structural_health_monitoring) using optical sensor data by implementing state-of-art image processing and computer vision techniques. As a special topic, basic concepts in **structure from motion**, **machine learning**, **neural networks**, and **neural radiance fields (NeRF)** are covered and relevant applications in civil engineering are introduced. An application-based learning approach is emphasized and tasks are designed in such a way that students can implement smart structure technology to address contemporary problems in civil engineering. 

This course is specially designed to suit the interest of **graduate students** and **senior undergraduate students who may pursue graduate studies**. You can see the course outline and task assignments in the previous year from [**w2021**](previous/w2021), [**w2020**](previous/w2020), [**w2019**](previous/w2019).  Note that all lectures were delivered through [**pre-recorded videos**](#lecture-video) in 2021. When you are absent from a class, you can watch the corresponding lecture video. However, students are highly encouraged to attend the classes. 

<span style="background-color: #FFFF00">
Based on past course surveys, students should anticipate dedicating at least 20 hours per week to study class materials, work on assignments, and undertake research projects. Additionally, a strong background in computer programming is expected of students. <b>If you are unsure about allocating this much time, please carefully reconsider enrolling.</b> For undergraduates, be aware that the instructor will not accommodate personal situations, like capstone projects, quizzes, midterms, or finals, that do not adhere to institutional policies and guidelines. 
</span>


## Intended Learning Outcomes
By the end of this course, students should be able to  
* Describe smart structure technology and its applications in civil engineering
* Explain the working principle of an accelerometer and digital camera, and their data acquisition process
* Interpret the concept of image processing techniques through signal processing theory 
* Develop Python programs to process and analyze 2D and 3D optical data for structural assessment
* Demonstrate how to implement machine learning algorithms in solving real-world problems 
* Explain the working principle of neural network and neural radiance fiel algorithms
* Devise innovative smart structure technology for civil engineering applications and research


## Prerequisite
For this course, students should have a foundational understanding of **linear algebra** and **probability**. Additionally, proficiency in **python programming** is essential. Students are also expected to be familiar with **Markdown** script and **Jupyter Notebook** for submitting homework assignments.

## Course Textbook 
This course is not based on any particular textbook. The instructor will provide relevant keywords (search by yourself), reading materials, and website links in each class.  

## Course Outline
The study load for each class is marked as the number of regular offline classes, which becomes a total of 24 classes. The expected time to finish (ETF) in each module is also provided to help students manage their time and keep up with lectures and assignments. The course material will be posted as a PDF.   

|Class|Topics (lecture slide)|Lecture|Notebook|Colab|Load|ETF|Homework|
|:----|:-----|:-----|:-----|:-----|:-----|:-----|:-----|
|C01|[**Introduction**](lecture/clss01_introduction)||||0.5|||
|C02|[**Data Acquisition**](lecture/clss03_data_aquisition)|<a href="(https://youtu.be/PAnChNF7JqU"><img src="icon/video.png" height=22.5></a>|<a href=""><img src="icon/jupyter.png" height=22.5></a>|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C03|[**Signal Processing I**](lecture/clss04_06_signal_processing)||<a href=""><img src="icon/jupyter.png" height=22.5></a>|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C04|[**Signal Processing II**](lecture/clss04_06_signal_processing)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C05|[**Signal Processing III**](lecture/clss04_06_signal_processing)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C06|[**Modal Analysis**](lecture/clss04_06_signal_processing)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C07|[**Digital Image**](lecture/clss07_digital_image)||[Notebook]()||0.5|||
|C08|[**Projective Geometry**](lecture/clss08_project_geometry)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1.5|||
|C09|[**Linear Filtering**](lecture/clss09_linear_filter)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C10|[**Image Morphology**](lecture/clss09_linear_filter)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C11|[**Edge Detection I**](lecture/clss10_11_edge_detection)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C12|[**Edge Detection II**](lecture/clss10_11_edge_detection)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C13|[**Feature**](lecture/clss12_feature)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1.5|||
|C14|[**RANSAC**](lecture/clss13_ransac)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C15|[**Camera Model**](lecture/clss14_camera_model)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C16|[**Two-view Geometry**](lecture/clss15_two_view_geometry)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1|||
|C17|[**Structure From Motion**](lecture/clss16_SfM)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C18|[**Intro. of Machine Learning**](lecture/clss17_ml_intro)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C19|[**Gradient Descent**](lecture/clss18_ml_gd)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C20|[**Training Linear Model**](lecture/clss19_ml_lg)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|0.5|||
|C21|[**Neural Network**](lecture/clss20_ml_nn)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1.5|||
|C22|[**Convolutional Neural Network**](lecture/clss20_ml_nn)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1.5|||
|C23|[**Neural Radian Field (NeRF)**](lecture/clss20_ml_nn)||[Notebook]()|<a href=""><img src="https://colab.research.google.com/assets/colab-badge.svg" height=22.5></a>|1.5|||

### Lecture Video
|Class|Topics|Video|
|:----|:-----|:----|
|Class 01|**Introduction**|[<img src="http://img.youtube.com/vi/p7QaQYuG-RM/0.jpg" height="150">](https://youtu.be/p7QaQYuG-RM)|
|Class 02|**Data Acquisition**|[<img src="http://img.youtube.com/vi/PAnChNF7JqU/0.jpg" height="150">])|
|Class 03|**Signal Processing I**|[<img src="http://img.youtube.com/vi/52p-7BWwQ1Y/0.jpg" height="150">](https://youtu.be/52p-7BWwQ1Y) [<img src="http://img.youtube.com/vi/-ypxsaf21ak/0.jpg" height="150">](https://youtu.be/-ypxsaf21ak)|
|Class 04|**Signal Processing II**|[<img src="http://img.youtube.com/vi/m2x6Wzc8Cf4/0.jpg" height="150">](https://youtu.be/m2x6Wzc8Cf4)|
|Class 05|**Signal Processing III**|[<img src="http://img.youtube.com/vi/moytbQU0Gt8/0.jpg" height="150">](https://youtu.be/moytbQU0Gt8) [<img src="http://img.youtube.com/vi/pBpAV5kH8nI/0.jpg" height="150">](https://youtu.be/pBpAV5kH8nI)|
|Class 06|**Digital Image**|[<img src="http://img.youtube.com/vi/QuwI0HjQUoI/0.jpg" height="150">](https://youtu.be/QuwI0HjQUoI)|
|Class 08|**Projective Geometry**|[<img src="http://img.youtube.com/vi/yXSRfpaXDYc/0.jpg" height="150">](https://youtu.be/yXSRfpaXDYc) [<img src="http://img.youtube.com/vi/_LOnmx1PqmY/0.jpg" height="150">](https://youtu.be/_LOnmx1PqmY)|
|Class 09|**Linear Filtering**|[<img src="http://img.youtube.com/vi/l2893AKrTAM/0.jpg" height="150">](https://youtu.be/l2893AKrTAM)|
|Class 10|**Edge Detection I**|[<img src="http://img.youtube.com/vi/IHwgR196PzM/0.jpg" height="150">](https://youtu.be/IHwgR196PzM)|
|Class 11|**Edge Detection II**|[<img src="http://img.youtube.com/vi/ZjlNvLv-jj0/0.jpg" height="150">](https://youtu.be/ZjlNvLv-jj0)|   
|Class 12|**Feature**|[<img src="http://img.youtube.com/vi/kLmCt43qafU/0.jpg" height="150">](https://youtu.be/kLmCt43qafU) [<img src="http://img.youtube.com/vi/BZsU2BvS8_M/0.jpg" height="150">](https://youtu.be/BZsU2BvS8_M)|
|Class 13|**RANSAC**|[<img src="http://img.youtube.com/vi/afZg68R4b9M/0.jpg" height="150">](https://youtu.be/afZg68R4b9M)|  
|Class 14|**Camera Model**|[<img src="http://img.youtube.com/vi/6_PJj7GrkL8/0.jpg" height="150">](https://youtu.be/6_PJj7GrkL8)|
|Class 15|**Two-view Geometry**|[<img src="http://img.youtube.com/vi/5_rez7tvg8I/0.jpg" height="150">](https://youtu.be/5_rez7tvg8I)|
|Class 16|**Structure From Motion**|[<img src="http://img.youtube.com/vi/DFuQd2xw0ek/0.jpg" height="150">](https://youtu.be/DFuQd2xw0ek)|
|Class 17|**Introduction of Machine Learning**|[<img src="http://img.youtube.com/vi/PdZ0cbddxfI/0.jpg" height="150">](https://youtu.be/PdZ0cbddxfI) [<img src="http://img.youtube.com/vi/FHZIJgLVXBw/0.jpg" height="150">](https://youtu.be/FHZIJgLVXBw)|
|Class 18|**Gradient Descent**|[<img src="http://img.youtube.com/vi/mZVHNXxdAys/0.jpg" height="150">](https://youtu.be/mZVHNXxdAys)|
|Class 19|**Training Linear Model**|[<img src="http://img.youtube.com/vi/31CSIqymnWY/0.jpg" height="150">](https://youtu.be/31CSIqymnWY)|
|Class 20|**Neural Network**|[<img src="http://img.youtube.com/vi/pZLQywcd2Lw/0.jpg" height="150">](https://youtu.be/pZLQywcd2Lw) [<img src="http://img.youtube.com/vi/lIjEW38i75g/0.jpg" height="150">](https://youtu.be/lIjEW38i75g)|

## Tasks
There will be **9 tasks** and they will be posted on this course website weekly or bi-weekly. **The instructor encourage students to work in groups through collaborative learning, but to submit their assignments individually.** The task will have programming components or photography components, where students will use their own camera to capture and process their own images and discuss the results. Students are supposed to complete all tasks and turn their works in by the due date. You can access the best reports for the assignments in previous years from [**w2022**](previous/w2022#tasks), [**w2021**](previous/w2021#tasks), [**w2020**](previous/w2020#tasks), and [**w2019**](previous/w2019#tasks). The problems will be similar to the ones in the previous assignments. However, **the students must not copy and paste the codes or texts in those reports.** Also, some answers in the model report are not correct.     

The late submission policy allows students to have a **maximum one-week** delay for **three among the first eight assignments** (You must submit the last assignment on time). **If the number of delays is more than three, the fourth delayed homework will be zero.** Students must pay close attention to deadlines. No further late submission will not be accepted unless accompanied by a valid excuse and some marks might be deducted depending upon the circumstances.  

Your final grade for this course is determined by the scores you achieve on these assignments. Please check the mark in the table below. Therefore, **failing to submit homework can greatly impact your overall grade. If you encounter challenges with the assignments, please reach out to the instructor or TA for assistance.**

Please carefully review the submission instruction: [**Submission instruction of your work**](#submission-instruction-of-your-work)

|Task|Topics|Mark|Announcement|1st Due|2nd Due|
|:----|:-----|:----|:----|:-----|:-----|
|Task01|[**Basic Image Professing**]()|5||||
|Task02|[**Signal Processing I**]()|10||||
|Task03|[**Signal Processing II**]()|10||||
|Task04|[**Homography**]()|15||||
|Task05|[**Image Professing**]()|10||||
|Task06|[**Feature Matching & RANSAC**]()|10||||
|Task07|[**Multiview Geometry**]()|15||||
|Task08|[**Neural Network**]()|15||||
|Task09|[**Neural Radiance Field**]()|10||||


## Communication  
**All communication will be made through [this course website](https://github.com/chulminy/CIVE497-CIVE700)**, especially for this web page. The instructor will make a note in the ["Announcement"](#announcement) section if there is an update on the web page. Students can configure email notification for by ["watching"](https://help.github.com/articles/watching-and-unwatching-repositories/) this course website or use a version control system for tracking its changes. Thus, **students are responsible for checking the website regularly** for any relevant course information or announcements. 

In this course, both the instructor and the students are encouraged to engage in online discussions to create and facilitate a collaborative learning experience. Students are invited to ask questions and answer them, and share their knowledge and resources. **Please direct your communication to a** [***Discussion***](https://github.com/chulminy/CIVE497-CIVE700/discussions) **board (tab) on this website.** However, if there is a good reason not to use the discussion forum (e.g. personal matters, a question that might reveal your solution of your report, etc.), please directly contact the instructor via email (cmyeum@uwaterloo.ca). Or, you can feel free to send messages the instructor or TA through Microsoft TEAM. You can check out this [website](https://uwaterloo.ca/office-365/about/apps-you-have-access/teams). If possible, the instructor and TA prefer to use the discussion forum because questions and responses can be shared to the other students.    

[**Discussion forum instruction**](#discussion-forum-instruction)

## Grading  
The final grade will be based on the total marks earned during the semester. Each task will be graded on the basis of 100 points and will contribute the final grade with **different weights**. 

## Note

### Fair Contingencies for Emergency Remote Teaching
We are facing unusual and challenging times. The course outline presents the instructor’s intentions for course assessments, their weights, and due dates in Winter 2022. As best as possible, we will keep to the specified assessments, weights, and dates. To provide contingency for unforeseen circumstances, **the instructor reserves the right to modify course topics and/or assessments and/or weight and/or deadlines with due and fair notice to students.** In the event of such challenges, the instructor will work with the Department/Faculty to find reasonable and fair solutions that respect rights and workloads of students, staff, and faculty. 

### Academic integrity
In order to maintain a culture of academic integrity, members of the University of Waterloo community are expected to promote honesty, trust, fairness, respect and responsibility. [Check <a href="https://uwaterloo.ca/academic-integrity/">the Office of Academic Integrity</a> for more information.]</p>

### Grievance 
A student who believes that a decision affecting some aspect of his/her university life has been unfair or unreasonable may have grounds for initiating a grievance. Read <a href="/secretariat-general-counsel/node/100">Policy 70, Student Petitions and Grievances, Section 4</a>. When in doubt, please be certain to contact the department’s administrative assistant who will provide further assistance.</p>

### Discipline
A student is expected to know what constitutes academic integrity to avoid committing an academic offence, and to take responsibility for his/her actions. [Check <a href="https://uwaterloo.ca/academic-integrity/">the Office of Academic Integrity</a> for more information.] A student who is unsure whether an action constitutes an offence, or who needs help in learning how to avoid offences (e.g., plagiarism, cheating) or about “rules” for group work/collaboration should seek guidance from the course instructor, academic advisor, or the undergraduate associate dean. For information on categories of offences and types of penalties, students should refer to <a href="/secretariat-general-counsel/node/97">Policy 71, Student Discipline</a>. For typical penalties, check <a href="/secretariat-general-counsel/node/131">Guidelines for the Assessment of Penalties</a>.</p>

### Appeals
A decision made or penalty imposed under <a href="/secretariat-general-counsel/node/100">Policy 70, Student Petitions and Grievances</a> (other than a petition) or <a href="/secretariat-general-counsel/node/97">Policy 71, Student Discipline</a> may be appealed if there is a ground. A student who believes he/she has a ground for an appeal should refer to <a href="/secretariat-general-counsel/node/99">Policy 72, Student Appeals</a>.</p>

### Note for students with disabilities 
<a href="https://uwaterloo.ca/disability-services/">AccessAbility Services</a>, located in Needles Hall, Room 1401, collaborates with all academic departments to arrange appropriate accommodations for students with disabilities without compromising the academic integrity of the curriculum. If you require academic accommodations to lessen the impact of your disability, please register with AccessAbility Services at the beginning of each academic term.</p>

### Turnitin.com
Text matching software (Turnitin®) may be used to screen assignments in this course. Turnitin® is used to verify that all materials and sources in assignments are documented. Students' submissions are stored on a U.S. server, therefore students must be given an alternative (e.g., scaffolded assignment or annotated bibliography), if they are concerned about their privacy and/or security. Students will be given due notice, in the first week of the term and/or at the time assignment details are provided, about arrangements and alternatives for the use of Turnitin in this course.</p>

<p>It is the responsibility of the student to notify the instructor if they, in the first week of term or at the time assignment details are provided, wish to submit alternate assignment.</p>

## Supplement

### Discussion forum instruction
- Students are allowed to use either their own GitHub account or new account for this class if you want anonymity. They do not have to make a new account using their university email accounts. 
- Please be respectful of your peers, instructor, and others in your posts and comments.
- Asking good questions is another way of learning by summarizing and explaining what you know and do not know. Thoughtful questions and answers will help all students in this class. Before posting a question, please ask yourself whether you are truly stuck (meaning that the answers can be readily found on the web) and your question are complete and legible. 
- In addition, please check if the same question was asked before.   
- Inappropriate posts and comments are immediately deleted and closed without a notice. 

### Submission instruction of your work
Students must **electronically** turn in both their source code (with data) and report. The report must be written with **Markdown script (GFM)** first and is converted to a PDF format. All other formats like docx, or pptx, or in hardcopy **are not permitted**.  However, if you are a Python user, you can use a Jupyter notebook instead of a Markdown. When you submit your homework, you should submit both .IPyhone and .pdf. A submission guideline will be varied depending on the tasks and provided with each task. Remember that the instructor will grade your pdf report, not markdown file or files attached so please carefully review your pdf report to see if all figures are texts are included.  

Students choose either a **MATLAB** or **Python** to complete the tasks. The source code needs to be neatly organized and include detailed comments. The instructor and TA may run your codes in the instructor's Window computer where MATLAB 2020a and Python above 3.4 are installed. All sample codes for tutorials or assignments will be delivered in MATLAB. Thus, working with MATLAB is easier to complete the assignments. 

However, the instructor and TA will also encourage to use Python as well. If the students complete the assignments using Python, extra points might be given depending on the task assignments (up to 5 points). Pillow and OpenCV for computer vision programming and some basic python packages (e.g. Pandas, NumPy, matplotlib, sklearn, etc) will be installed on the TA's computer. It is recommended that any external code library should not be used unless explicitly mentioned in tasks. **The instructor is not able to install every different libraries on the computer.** Note that OS (platform)-dependent functions, scripts or libraries are not permitted. The students must check their report in a Windows computer before its submission.   

Marked reports will be distributed via email, and sample solutions for the tasks may be reviewed in class with the instructor. A couple of the best reports in each task will be posted on the class web page with the consent of the corresponding students. 
