# CIVE497/700: Smart Structure Technology (Winter, 2022)

![](intro_img.png)

**Instructor:** Chul Min Yeum (E2-2313)   
**Class:** Mon and Wed, 08:30AM to 9:50AM       
**Email:** cmyeum@uwaterloo.ca   
**Office Hours:** Mon and Wed 10 to 11AM at E2-2313 (You can also email me for an appointment)   
**TA:** Zaid Al-Sabbag (zaalsabbag@uwaterloo.ca)     

Last updated: 2021-11-17

**Previous offerings of this course**
- [**Smart Structure Technology (Winter, 2021)**](previous/w2021)  
- [**Smart Structure Technology (Winter, 2020)**](previous/w2020)  
- [**Smart Structure Technology (Winter, 2019)**](previous/w2019)  

## Announcement
* **Nov 17, 2021:** The CEE guidelines for the minimum requirements for audit (AUD) are (1) attend at least 10 weeks of class and (2) complete the equivalent of a t lest of the graded items (assignments, project, midterm) with an overall grade of at least 70%. However, the instructor does not recommend auditing this course because unless students does homework assignment in this course, they will not learn much. Since the lectures were already uploaded in the [**course website**](previous/w2021#lecture-video), please watch these videos rather than auditing.   
* **Nov 17, 2021:** The first class will start at Jan 05, 2022.     


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
This course offers an introduction to the emerging **smart structure technologies** in civil engineering. Smart structures integrate sensing, actuation, data processing, analysis, and visualization, and control capabilities so that a structure can sense and respond to its changing external conditions in a rapid and automated manner. Among several topics in smart structure, this course focuses on [**structural assessment**](https://en.wikipedia.org/wiki/Structural_health_monitoring) using optical sensor data by implementing state-of-art image processing and computer vision techniques. As a special topic, basic concepts in **structure from motion**, **machine learning**, and **neural networks** are covered and relevant applications in civil engineering are introduced. An application-based learning approach is emphasized and tasks are designed in such a way that students can implement smart structure technology to address contemporary problems in civil engineering. In addition, for graduate students, students can **opt to** perform a research project, in which students will have an opportunity to design a technique with a potential application to smart structures and advance their research works. 

This course is specially designed to suit the interest of **graduate students** and **senior undergraduate students who may pursue graduate studies**. Based on the feedback received from the courses offered in previous years, you are expected to spend 12 hours or more per week studying class materials as well as working on task assignments and research project. You can see the course outline and task assignments in the previous year from [**w2021**](previous/w2021), [**w2020**](previous/w2020), [**w2019**](previous/w2019). Note that all lectures were delivered using [**pre-recorded videos**](previous/w2021#lecture-video) in 2021. When you are absent from a class, you can watch the corresponding lecture video. However, students are highly encouraged to attend the classes. 


## Intended Learning Outcomes
By the end of this course, students should be able to  

* Describe smart structure technology and its applications in civil engineering
* Explain the working principle of an accelerometer and digital camera, and their data acquisition process
* Interpret the concept of image processing techniques through signal processing theory 
* Develop programs (MATLAB or Python) to process and analyze 2D and 3D optical data for structural assessment
* Demonstrate how to implement machine learning algorithms in solving real-world problems 
* Devise innovative smart structure technology for civil engineering applications and research

## Prerequisite
This course requires basic knowledge in **linear algebra** and **probability** and skills at ***a sufficient level of a non-trivial computer programming*** (with **MATLAB** or  **Python**). Students also need to know how to use **Markdown**. If you are not familiar with or would revisit these topics, students should complete the following tutorials and questions inside:

**MATLAB tutorials**
* [**AE/ENVE/GEOE121: Computational Method**](https://github.com/chulminy/AE_ENVE_GEOE_121)
* [**How to download and install MATLAB in your computer?**](tutorial/matlab_install)
* [**Matrices & Arrays**](tutorial/matlab_tutorial): copy this folder in your computer and run `matrices_arrays.mlx` in MATLAB 
* [**Operations and Elementary Operations**](tutorial/matlab_tutorial): copy this folder in your computer and run `operators_elem_operations.mlx` in MATLAB

**Topics**
* [**Digital Image Processing**](tutorial/image_proc): copy this folder in your computer and run `digital_image_processing.mlx` in MATLAB (Note: If you do not find the sample images, you can download them from [**here**](https://www.dropbox.com/s/xgznul2u1l16iaw/sample_images.zip?dl=0))   
* [**Markdown**](tutorial/markdown)

## Course Textbook 
This course is not based on any particular textbook. The instructor will provide relevant keywords (search by yourself), reading materials, and website links in each class.  

## Course Outline
Slides and tutorials will be updated on a regular basis. The study load for each class is marked as the number of regular offline classes, which becomes a total of 24 classes. The expected time to finish (ETF) in each module is also provided to help students manage their time and keep up with lectures and assignments. The course material will be posted as a PDF.   

|Class|Topics|Slides|Tutorial|Load|ETF|Homework|
|:----|:-----|:----|:-----|:-----|:-----|:-----|
|Class 01|**Introduction**|[slide](lecture/clss01_introduction)||0.5|Jan 5||
|Class 02|**MATLAB Tutorial**|[slide](lecture/clss02_matlab)|[tutorial](tutorial/matlab_tutorial)|1|Jan 10|**Task01**|
|Class 03|**Data Acquisition**|[slide](lecture/clss03_data_aquisition)|[tutorial](tutorial/data_aquisition)|1|Jan 12||
|Class 04|**Signal Processing I**|[slide](lecture/clss04_06_signal_processing)|[tutorial](tutorial/signal_processing)|1|Jan 17|**Task02**|
|Class 05|**Signal Processing II**|[slide](lecture/clss04_06_signal_processing)|[tutorial](tutorial/signal_processing)|1|Jan 19||
|Class 06|**Signal Processing III**|[slide](lecture/clss04_06_signal_processing)|[tutorial](tutorial/signal_processing)|2|Jan 26|**Task03**|
|Class 07|**Digital Image**|[slide](lecture/clss07_digital_image)|1|Jan 31|**Task04**|
|Class 08|**Projective Geometry**|[slide](lecture/clss08_project_geometry)|[tutorial](tutorial/projective_geometry)|3|Feb 09|**Task05**|
|Class 09|**Linear Filtering**|[slide](lecture/clss09_linear_filter)|[tutorial](tutorial/linear_filter)|1|Feb 14| |
|Class 10|**Edge Detection I**|[slide](lecture/clss10_11_edge_detection)|[tutorial](tutorial/edge_detection)|1|Feb 16||
|Class 11|**Edge Detection II**|[slide](lecture/clss10_11_edge_detection)|[tutorial](tutorial/edge_detection)|1|Feb 28|**Task06**|   
|Class 12|**Feature**|[slide](lecture/clss12_feature)|[tutorial](tutorial/feature)|2|Mar 07||
|Class 13|**RANSAC**|[slide](lecture/clss13_ransac)|[tutorial](tutorial/ransac)|1|Mar 09|**Task07**|  
|Class 14|**Camera Model**|[slide](lecture/clss14_camera_model)||1|Mar 14||
|Class 15|**Two-view Geometry**|[slide](lecture/clss15_two_view_geometry)|[tutorial](tutorial/two_view_geometry)|1.5|Mar 16||
|Class 16|**Structure From Motion**|[slide](lecture/clss16_SfM)|[tutorial](tutorial/sfm)|0.5|Mar 21|**Task08**|
|Class 17|**Introduction of Machine Learning**|[slide](lecture/clss17_ml_intro)||0.5|Mar 23||
|Class 18|**Gradient Descent**|[slide](lecture/clss18_ml_gd)|[tutorial](tutorial/ml_gd)|1|Mar 28||
|Class 19|**Training Linear Model**|[slide](lecture/clss19_ml_lg)|[tutorial](tutorial/ml_linear_model)|1|Apr 30||
|Class 20|**Neural Network**|[slide](lecture/clss20_ml_nn)|[tutorial](tutorial/neural_network)|2|Apr 04|**Task09**|

## Tasks
There will be **9 tasks** and they will be posted on this course website weekly or bi-weekly. **The instructor encourage students to work in groups through collaborative learning, but to submit their assignments individually.** The task will have programming components or photography components, where students will use their own camera to capture and process their own images and discuss the results. Students are supposed to complete all tasks and turn their works in by the due date. You can access the best reports for the assignments in previous years from [**w2021**](previous/w2021#tasks), [**w2020**](previous/w2020#tasks), and [**w2019**](previous/w2019#tasks). The problems will be similar to the ones in the previous assignments. However, the students must not copy and paste the codes or texts in those reports. Also, some answers in the model report are not correct.     

The late submission policy allows students to have a **maximum one-week** delay for **three among the first eight assignments** (You must submit the last assignment on time). TAs will just count the number of delays in your homework assignments. TAs will inform the students when they delay their submission three times. If the number of delays is more than three, the fourth delayed homework will be zero. Students must pay close attention to deadlines. No further late submission will not be accepted unless accompanied by a valid excuse and some marks might be deducted depending upon the circumstances.  

When you decide to delay your homework assignments, please carefully consider all schedules and milestones for your other courses. Usually, students get busier when they prepare exams (or quizzes) or the due date for their capstone projects is approaching.   

This course grades your final mark based on the marks earned from these assignments. Thus, not submitting homework assignments is a really bad idea and your final score will significantly drop. If you have difficulty in doing the assignments, please speak to the instructor or TA.    

Please carefully review the submission instruction: 
[**Submission instruction of your work**](#submission-instruction-of-your-work)

|Task|Topics|Announcement|1st Due|2nd Due|
|:----|:-----|:----|:-----|:-----|
|Task01|**Programming**||||
|Task02|**Signal Processing 1**||||
|Task03|**Signal Processing 2**||||
|Task04|**Digital Image**||||
|Task05|**Homography**||||
|Task06|**Image Processing**||||
|Task07|**Feature Matching & RANSAC**||||
|Task08|**Multiview Geometry (SfM)**||||
|Task09|**Neural Network**||||

## Communication  
**All communication will be made through [this course website](https://github.com/chulminy/CIVE497-CIVE700)**, especially for this web page. The instructor will make a note in the ["Announcement"](#announcement) section if there is an update on the web page. Students can configure email notification for by ["watching"](https://help.github.com/articles/watching-and-unwatching-repositories/) this course website or use a version control system for tracking its changes. Thus, **students are responsible for checking the website regularly** for any relevant course information or announcements. 

In this course, both the instructor and the students are encouraged to engage in online discussions to create and facilitate a collaborative learning experience. Students are invited to ask questions and answer them, and share their knowledge and resources. **Please direct your communication to a** [***Discussion***](https://github.com/chulminy/CIVE497-CIVE700/discussions) **board (tab) on this website.** However, if there is a good reason not to use the discussion forum (e.g. personal matters, a question that might reveal your solution of your report, etc.), please directly contact the instructor via email (cmyeum@uwaterloo.ca). Or, you can feel free to send messages the instructor or TA through Microsoft TEAM. You can check out this [website](https://uwaterloo.ca/office-365/about/apps-you-have-access/teams). If possible, the instructor and TA prefer to use the discussion forum because questions and responses can be shared to the other students.    

[**Discussion forum instruction**](#discussion-forum-instruction)

## Grading  
The final grade will be based on the total marks earned during the semester. Each task will be graded on the basis of 100 points and will contribute the final grade with **different weights**. Note that undergraduate and graduate students are marked using different evaluation metrics.

If you are a graduate student, you can opt in conducting a research project. Students can bring their own problems related to their thesis, research projects or potential research in civil engineering that they plan to pursue near future. This course gives special attention to exploring theory and potential techniques in the field of smart structure to address real problems that students are exposed to or involved in. Thus, students need to devise feasible project topics that are achievable within your current or future graduate study. For the students who conduct their research projects, the final grade metric becomes Tasks (70%) and Project (30%).

[**Guideline for the project**](#guideline-for-the-project)

## Note
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
Students must **electronically** turn in both their source code (with data) and report. The report must be written with **Markdown script (GFM)** first and is converted to a PDF format. All other formats like docx, or pptx, or in hardcopy **are not permitted**.  However, if you are a Python user, you can use a Jupyter notebook instead of a Markdown. When you submit your homework, you should submit both .IPyhone and .pdf. A submission guideline will be varied depending on the tasks and provided with each task. Remember that the instructor will grade your pdf report, not other markdown file so please carefully review your pdf report to see if all figures are texts are included.  

Students choose either a **MATLAB** or **Python** to complete the tasks. The source code needs to be neatly organized and include detailed comments. The instructor and TA may run your codes in the instructor's Window computer where MATLAB 2020a and Python above 3.4 are installed. All sample codes for tutorials or assignments will be delivered in MATLAB. Thus, working with MATLAB is easier to complete the assignments. 

However, the instructor and TA will also encourage to use Python as well. If the students complete the assignments using Python, extra points might be given depending on the task assignments (up to 5 points). Pillow and OpenCV for computer vision programming and some basic python packages (e.g. Pandas, NumPy, matplotlib, sklearn, etc) will be installed on the TA's computer. It is recommended that any external code library should not be used unless explicitly mentioned in tasks. **The instructor is not able to install every different libraries on the computer.** Note that OS (platform)-dependent functions, scripts or libraries are not permitted. The students must check their report in a Windows computer before its submission.   

Marked reports will be distributed via email, and sample solutions for the tasks may be reviewed in class with the instructor. A couple of the best reports in each task will be posted on the class web page with the consent of the corresponding students. 

### Guideline for the project
Individuals/teams should clearly identify the challenges of existing applications, procedures, and research in civil engineering and then consider how smart structure technology contributes to addressing them. The project does not have to be big, fancy and innovative if your project outcomes can marginally improve existing problems or advance practices. For example, it could be proposing a modification to existing processes, applying image processing and computer vision technology to streamline analysis and documentation processes, applying a new signal or image processing techniques to improve the accuracy of your technique. The possibilities are very open and diverse if they are attainable. However, for instance, the following two examples are not acceptable because they are not attainable: *"we will build a robot to automatically and rapidly construct a building"* or *"we will develop a new vision sensor that can measure 3D volume"*. 

The project can be done either individually or in teams of two or three students. If students choose to work in a team, they need to justify the need for a teamwork and define the scope of works in individual members. For the completion of the project, each group must reach the following **milestones**:  

- **Individual/team meeting (3 or 4th week)**: Individuals or teams need to schedule a separate meeting with the instructor so that the project ideas are refined together. The instructor encourages the individual/team preparing and bringing relevant slides or reading materials to the meeting. In the case of the team project, all members must agree on the direction and scope of their project before having a meeting with the instructor. They also can take advantage of office hours or separate meetings if further discussion is needed.  

- **Abstract submission (7 or 8th week)**: Individuals or teams will submit a 1-page abstract that can summarize your project. The abstract should include (1) project title, (2) motivation, problem or challenge, (3)objective, (4) implemented/developed method(s), and (5) validation/demonstration plan(s). In addition, one representative figure (graphical abstract) must be included. It should have a self-explanatory image to illustrate motivation and expected outcome, summarize a procedure of the methods implemented/developed, or describe updated processes or outcomes that benefit from your technique or algorithm designed in the project. The abstract should not exceed 600 words. **The evaluation of the abstract contributes 30% of the project grade.** 

- **10-minute final presentation (at Class 24)**: A 10-minute presentation will be given at the final class. Individuals/teams should strive to give a comprehensive and understandable presentation that the other students recognize the value of your project. Similar to the 3-minute presentation, time limits will be strictly enforced. **The evaluation of the final presentation contributes 50% of the project grade** and the detailed evaluation criteria will be announced after the abstract submission. 