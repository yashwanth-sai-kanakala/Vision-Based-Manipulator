# Vision-Based-Manipulator

## BACKGROUND:
In many industrial applications, Manipulators are frequently used to perform repetitive missions such as pick-and-place tasks for packing and placing objects. The relationship between object images and 3D positions of objects and the relationship between object poses and object grasping methods are important research topics deserving more investigations. Precise positioning and control of industrial manipulator for positioned objects can be implemented by the closed-loop control system. The task here is the use of a vision sensor (camera), visual servoing is proposed to realize the task of control flexible manipulators with improved quality requirements. To enable robots to perform manipulation skills in real-world, unstructured environments, the implementation of skill programs must be robust to sources of uncertainties, such as sensor noise, variations in the objects and environmental conditions. Manipulation skills can be more robustly achieved using vision.

## OBJECTIVE:
An algorithm is created which extracts objects features such as area and position of the objects from the images. The control and trajectory planning of a 5-DOF serial manipulator is studied and implemented in this project, Such that the Manipulator will work more robustly without any third party manipulation.

## FLOWCHART: 
![image](https://user-images.githubusercontent.com/55993337/111867684-ab314080-899b-11eb-8858-9699bdace732.png)

         

## METHODOLOGY:
This project is divided into two phases which are:
i.	Machine vision
ii.	Manipulation

### Machine Vision:
Machine vision is the technology to replace or complement manual inspections and measurements with digital cameras and image processing. The technology is used in a variety of different industries to automate the production, increase production speed and yield, and to improve product quality. Machine vision in operation can be described by a six-steps flow:  
1.	Image Acquisition
2.	Image Subtraction
3.	Image Binarization
4.	Image filtering and Enhancement
5.	Image Segmentation and Analysis 
6.	Feature Extraction

#### Image Acquisition:
 IP WEBCAM is used to acquire the image from our mobile camera. IP WEBCAM  can import the image directly to MATLAB editor by interfacing it with MATLAB cam toolbox. The background (workspace without objects) image is taken as a reference to acquire foreground (workspace with object) directly from MATLAB.

#### Image Subtraction:
Noise is Unwanted information in both images, subtracting these 2 images can increase the Signal to noise ratio by eliminating noise. This noise-free image of the object is converted to useful data by applying feature extracting operations.

#### Image Binarization:
The binarized image gives us better results when feature extraction operation is applied, the subtracting images will be binarized by thresholding the intensities in the images

#### Image filtering and Enhancement:
This binarized Image has some noise left over and that will be eliminated by image enhancement techniques. The median filter is used to reduce salt and pepper noise in the image.
Median filtering is a specific case of order-statistic filtering, also known as rank filtering. This uses an m*n sized window, which takes averages of neighbourhood pixel value image.
Morphological operations such as imfill(), imopen(), imclose() operations are used to enhancing the image.

**imfill():** It is used to fill the edges with the neighbour pixels

**imopen():** It is used to open the region edges with neighbour pixels.

**imclose():** It is used to close the region edges with neighbour pixels

#### Image Segmentation and Analysis:
The tracked objects are labeled using VISLABELES(). labelling helps us to perform some operations by calling that particular labelled region.
Each pixel of the binary image is checked for high intensity from top left to bottom right, it labels the region which has high intensity. 

#### Feature Extraction:
Area, centroid and the diameter of the noise-free binarized image is extracted using **Region Properties**.

Considering the world frame in the image, one of the labelled images is selected as the reference and measured the distance to the other regions by simply shifting the centroid of each region with the centroid of the selected region. This will help to provide the position of object regions with respect to reference frame.


### Mapping from image frame to real world frame

**Calibration:** Mapping of the image frame to real frame, it can be achieved directly by mapping image pixels to real-world distance. Mapping can be performed in image pre-processing stage. 

**Step-1:** Region Properties are applied to the input image which is m*n sized, then the area of the reference object in pixels can be found.

**Step-2:** The diameter of the reference object will be calculated in pixels.

**Step-3:**  The diameter of the reference object can be calculated by calculating the perimeter of the object in centimeters.

**Step-4:** Now, compare and calculate the scaling factor along x-direction and y-direction.


### Manipulator:  
Manipulator is a device used to manipulate materials without direct contact. General 3R Articulated Robot which has 3DOF is taken with three revolute joints with joint angles theta1,theta2,theta3. These joint angles are calculated using forward and inverse kinematics.
 
 **3R ARTICULATED MANIPULATOR** 
 
 ![image](https://user-images.githubusercontent.com/55993337/111868466-f9e0d980-899f-11eb-9a18-28db1574b9c0.png)

 
 
#### Joint Parameters:
The joint parameters which consist of the angle made by the joint (theta) and the distance between two joints(d).


![image](https://user-images.githubusercontent.com/55993337/111868726-93f55180-89a1-11eb-985c-835f407156d7.png)


#### Link Parameters:
the link parameters which has offset link angle (alpha) and the link distance (a).

![image](https://user-images.githubusercontent.com/55993337/111868693-64dee000-89a1-11eb-9275-2f08edbcf48d.png)


#### End Effector:
In robotics, an end effector is a device or tool that’s connected to end of the robot arm. The end effector is a part of robotic arm which interacts with the environment. The structure of the end effector and the nature of the programming and hardware that drives it depend on the task the robot will be performing. In this project, magnetic end effector is used for the gripping of the objects. 

	
**Forward Kinematics:** Forward kinematics refers to the use of the kinematic equations of a robot to compute the position of the end-effector from specified values for the joint parameters.

**Inverse Kinematics:** Inverse kinematics makes use of the kinematics equations to determine the joint parameters which provide the desired position where the robot's end effector has to reach.
          
#### Manipulator Algorithm:
The programming of the manipulator is written in the MATLAB software with the help of Robot toolbox.
The L(1), L(2), L(3) which describes each joint of the manipulator. With the help of joint and link parameters, the values of the theta, distance(d) of the joint, angle offset between the axis of motion (alpha) and the distance between the links(a).

**Serial link:** Created links are connected serially and scripted as an object(ROB). this object is used to call the function which affects the pose of the end effector.

**fkine():** It is a function which accepts angles as an input and returns pose of an end effector. 

**ikine():** It is a function which accepts pose of an end effector as an input and returns angles to the corresponding joints.

**Home position:** the home position of the manipulator plays important role in the calibration of encoders (position sensors). The home position of the manipulator is calculated by considering Singularity conditions.

**Workspace:**  Workspace of the manipulator can be measured using link length of the manipulator. our manipulator is made to work only in the dexterous workspace and restricted the working in the reachable workspace.

**Workspace with constrained angles:** Avoiding singularities and working in the reachable workspace is achieved only by constraining angle, this constrained workspace can be measured using robot toolbox.


#### Trajectory planning:
The trajectory planning is defined as the planning of the desired movements of the manipulator. The trajectory planning is of two types:

i. Joint space trajectories 

ii. Cartesian space trajectories
