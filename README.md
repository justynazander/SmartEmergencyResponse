========================================
   Smart Emergency Response System  
========================================
Smart Emergency Response System (SERS) prototype was built in the SmartAmerica Challenge 2013-2014, a US government initiative. SERS has been created by a team of nine organizations led by MathWorks. The project was featured at the White House in June 2014 and described by Todd Park (U.S. Chief Technology Officer) as an exemplary achievement.

The SmartAmerica initiative challenges the participants to build cyber-physical systems as a glimpse of the future to save lives, create jobs, foster businesses, and improv​e the economy. SERS primarily saves lives.

- SERS on YouTube: https://www.youtube.com/watch?v=oofHMaEWwP8
- SERS news and logistics updates are here: https://sites.google.com/site/justynazander/sers
- SERS documentation: https://github.com/justynazander/SmartEmergencyResponse/tree/master/SmartEmergencyResponseSystem/doc 

===============================
   SERS with MATLAB/Simulink
===============================

The SERS system provides the survivors and the emergency personnel with information to locate and assist each other during a disaster. SERS allows to submit help requests to a MATLAB-based mission center connecting first responders, apps, search-and-rescue dogs, a 6-feet-tall humanoid, robots, drones, and autonomous aircraft and ground vehicles. The command and control center optimizes the available resources to serve every incoming requests and generates an action plan for the mission. The Wi-Fi network is created on the fly by the drones equipped with antennas. In addition, the autonomous rotorcrafts, planes, and ground vehicles are simulated with Simulink and visualized in a 3D environment (Google Earth) to unlock the ability to observe the operations on a mass scale.

SERS is intended for open collaboration.
Required software: MATLAB® (R2014a). 

<hr> MathWorks products used in SERS: 

1. MATLAB®.

2. Simulink® for simulation of the fleet of vehicles and for communication.

3. Stateflow® for some fleet simulation parts.

4. Aerospace Blockset™​​ used in coordinate transformations in the mission planning phase and for visualizing the vehicle orientation during design and test.

5. Real-Time Windows Target™​​ used for real time control of the AR.Drone directly from Simulink.

6. Optimization Toolbox™​​ used for the emergency response mission optimization and for determining the waypoints for the fleet of vehicles.

7. Bioinformatics Toolbox™​​ used for dynamic optimization. 

8. Mapping Toolbox™​​ used for reading the map shapefiles and pulling in the satellite images.

9. Image Acquisition Toolbox™​​ used for face detection of the videostream from the AR.Drone.


<hr> Prerequisites: 
===========================================
     Google Earth™​​. 
     MATLAB version 2014a, 32 bits.
     
     Optional: 
     Android™​
     Google Glass™ 
===========================================

 

<hr> 
SERS team member organizations: 
<hr> 
- MathWorks - Team Lead,
- BluHaptics,
- Boeing (St. Louis and Seattle),
- Massachusetts Institute of Technology Media Lab,
- National Instruments,
- North Carolina State University,
- University of North Texas, 
- University of Washington,
- Worcester Polytechnic Institute.
 

<hr> 
SERS MathWorks development foundations: 
<hr> 
Enes Bilgin (static optimization),
David Escobar Sanabria (dynamic simulation),
Kun Zhang (GEarth, Kinec​t, gadgets, and apps),
Aubrey da Cunha (dynamic optimization),
Poornima Kaniarasu (standalone GEarth interface),
Srikanth Parupati (analysis of the videostream of the AR. Drone),
Pieter J. Mosterman,
Justyna Zander.

<hr> 
Related technical papers, posters, talks, and books: 
<hr> 

===========================================
     Justyna Zander, Smart Emergency Response System - Eye in the Sky, 
     Plenary talk, SCS Summer Simulation Multi-Conference, July 2014.

     Pieter J. Mosterman, Justyna Zander, Ascension Vizinho-Coutry, 
     Virtual and Physical Integration of Autonomous Vehicles for an Automated Humanitarian Mission, Poster at Complex Systems Design & Management Conference, 2014.

     Pieter J. Mosterman, David Escobar Sanabria, Enes Bilgin, Kun Zhang, Justyna Zander, 
     A Heterogeneous Fleet of Vehicles for Automated Humanitarian Missions, Computing in Science and Engineering, vol. 16, no. 3, pp. 90-95, May-June, 2014.

     Justyna Zander and Pieter J. Mosterman, 
     From Internet of Things through Computation of Things to a Prediction Engine - SmartAmerica Challenge 2013 Workshop at White House, Washington DC, Dec. 2013 (with Peter Norvig).

     Pieter J. Mosterman, Enes Bilgin, David Escobar Sanabria, Kun Zhang, Justyna Zander, 
     Autonomous Vehicles on a Humanitarian Mission - SmartAmerica Challenge 2013 Workshop at White House, Washington DC, Dec. 2013.

     Justyna Zander and Pieter J. Mosterman, 
     Computation for Humanity—Information Technology to Advance Society, ISBN-10:1439883270, CRC Press/Taylor & Francis, Oct. 2013.
===========================================

How to run SERS using the apps?
===========================================
- Open MATLAB.
- Retrieve the repository from GitHub.
- Install four MATLAB apps using the *.mlappinstall files from the main folder of the retrieved repository.
- Open two additional MATLABs.
- Go to APPS tab in MATLAB in each of the MATLAB sessions​. 
- Click the icons: 

     'SERS server' app in the first MATLAB session.
     'SERS optimization' app in the second MATLAB session.  
     'SERS requests' app in the third MATLAB session.  
     'SERS stop' app cleans up when you stop SERS functionalities in your MATLABs.

@article{Justyna:13978,
      author        = "Justyna Zander",
      title         = "{SmartEmergencyResponse: SERS on ZENODO}",
      month         = "Jan",
      year          = "2015",
      doi           = "{10.5281/zenodo.13978}",
      url           = "{http://dx.doi.org/10.5281/zenodo.13978}",
}

===========================================
Copyright (c) 2014, The MathWorks, Inc. 
===========================================
Copyright notice: "Copyright (c) 2014, The MathWorks, Inc. All rights reserved."

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

- Neither the name of the {organization} nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


