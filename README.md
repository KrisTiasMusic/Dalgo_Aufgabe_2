#Wavefield simulation

Author: Christoph Eike, Johannes Lühring, Max Zimmermann
##Introduction

This program simulates the propagation of waves including the resulting interferences.
It has been written in Matlab R2014a.
The user is able to set one or multiple sources, by clicking inside the figure. 
The maximum value of sources is six. Its possible to change the sources frequency, 
amplitude and phase by click inside the respective edit window and enter the wanted values. 
The default values are: frequency = 5, amplitude = 1 and phase = 0.
For each new wave you will get these three edit windows.
The figure also includes a line plot, which shows the amplitude of the wavefield 
at one choosen point (it's position is changeable by clicking inside the figure) over time.

##Data

###animate_wave.m:
Matlab-script to start a GUI that shows the interaction of wave-forms in
a plane. It is possible to adjust the amplitude, frequency and phase and to
show the amplitude over time at a certain point.
###new_amp.m:
Matlab-script to change amplitude of wave as written in GUI
###new_click.m:
Matlab-Function to create new wave sources by clicking
###new_freq.m:
Matlab-script to change frequency of wave as written in GUI
###new_phi.m:
Matlab-script to change phase of wave as written in GUI
###new_wave.m:
Matlab-Function to define new position of stationary wave plot by clicking
###plot_wave.m:
Matlab-Function to plot a field of waves and plot of stationary amplitude
##Testing

There are no tests included.
##Known Issues

If the program displays the error "error delete (invalid or deleted object)"
restart Matlab.
##Install

To use this program you need to download the files: 
animate_wave.m, new_amp.m, new_click.m, new_freq.m, new_phi.m, new_wave.m and plot_wave.m.
To open and execute these files you also need Matlab.
To run the program just execute animate_wave.m.
Attention: All the files have to be in the same directory.
##About

This program was developed by Christoph Eike, Johannes Lühring and Max Zimmermann 
as part of a study assignment. 
The task was: 
Write a GUI-program, which simulates the propagation of multiple sinusoidal waves.
This wavefield has to show the propagation of the sinusoidal waves and their 
interferences. Also a line plot should be included, which presents the compound amplitude
of all sinusoidal waves. This line plot has to be able to display the local amplitude 
of any point in the figure.

####Oldenburg, 16.06.2015
#END