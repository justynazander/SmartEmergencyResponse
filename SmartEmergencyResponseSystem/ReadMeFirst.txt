******************************************************************************
* Smart Emergency Response System (SERS) prototype was built 		     *
* in the SmartAmerica Challenge 2013-2014, a US government initiative. 	     *
* SERS has been created by a team of nine organizations led by MathWorks.    *
* The project was featured at the White House in June 2014 and described     *
* by Todd Park (U.S. Chief Technology Officer) as an exemplary achievement.  *
* The SmartAmerica initiative challenges the participants to build 	     *
* cyber-physical systems as a glimpse of the future to save lives, 	     *
* create jobs, foster businesses, and improve the economy. 	     	     *
* SERS primarily saves lives.	     					     *
* The system provides the survivors and the emergency personnel with 	     *
* information to locate and assist each other during a disaster. 	     *
* SERS allows to submit help requests to a MATLAB-based mission center 	     *
* connecting first responders, apps, search-and-rescue dogs, 	     	     *
* a 6-feet-tall humanoid, robots, drones, and autonomous aircraft 	     *
* and ground vehicles. The command and control center optimizes 	     *
* the available resources to serve every incoming requests and 	             *
* generates an action plan for the mission. The Wi-Fi network 	             *
* is created on the fly by the drones equipped with antennas. 	     	     *
* In addition, the autonomous rotorcrafts, planes, and ground vehicles	     * 
* are simulated with Simulink and visualized in a 3D environment 	     *
* to unlock the ability to observe the operations.  	     		     *
* 	     								     *
* SERS MANUAL. July 2014. 						     *
* Contact: 							             *
* Justyna Zander (justyna.zander@gmail.com) 	     			     *
* Pieter Mosterman (pieter.mosterman@mathworks.com)			     *
******************************************************************************
Copyright (c) 2014, The MathWorks, Inc. All rights reserved.
******************************************************************************
 
How to run SERS in a loop mode. 
*******************************


Open 4 MATLAB sessions (32 bits, with “matlab.exe -hgVersion 2”). In each of them: 
- Command window: addpath(genpath(pwd))
- Go to SERS folder 
 
MATLAB session 1: 
Command window: y = QuadrotorOptimizationReceiptAdaptor('127.0.0.1',10020,10030)
 
MATLAB session 2:
Command window: GE = GeManager
 
MATLAB session 3:
Command window: demoMission
Alternatively:  demoMissionKinematics or demoMissionDynamics, or runMission
 
MATLAB session 4: 
Go to: [pwd '\requests'] 
Command window: fakeShAir
