% Script to plot Accelerometer Data
% from RombergLab for iOS APP - https://apps.apple.com/us/app/romberglab/id1440287860?l=en 
% Originally developed by Jorge Rey-Martinez 2018
% Authors: Ariadna Valldeperes, Xabier Altuna, Jorge Rey Martinez 
% (C)2020

%Read CSV file NOT PORTED TO OCTAVE !!!!.

function [time,accelX,accelY,accelZ,gyrX,gyrY,gyrZ,timeAltitude,altitude,timeMagnet,magX,magY,magZ,cond] = read()
time = [];
timeRaw= [];
accelX = [];
accelY = [];
accelZ = [];
gyrX = [];
gyrY = [];
gyrZ = [];
timeAltitudeRaw = [];
timeAltitude = [];
altitude = [];
timeMagnetRaw = [];
timeMagnet = [];
magX = [];
magY = [];
magZ = [];

cond = [];
[file,directory] = uigetfile('.csv','Select "ASCII results File" to import');
if file == 0
    return
end
fullArchive = fullfile(directory,file);
rTable = csvread(fullArchive);
[nrows,ncols] = size(rTable);
iter = 1;
iter2 = 1;
warn = waitbar(0,'Reading file, please wait...');
while iter <= nrows
  if !isnan(rTable(iter,1)) && !isnan(rTable(iter,3))
    timeRaw = vertcat(timeRaw,rTable(iter,1));
    accelX = vertcat(accelX,rTable(iter,2));
    accelY = vertcat(accelY,rTable(iter,3));
    accelZ = vertcat(accelZ,rTable(iter,4));  
  end
  
  if isnan(rTable(iter,1)) && isnan(rTable(iter,3))
    cond = vertcat(cond,rTable(iter,2));
  end
  
  
##    if strcmp (rTable{iter,5},'Accelerometer')
##       timeRaw = vertcat(timeRaw,rTable{iter,1});
##       accelX = vertcat(accelX,rTable{iter,2});
##       accelY = vertcat(accelY,rTable{iter,3});
##       accelZ = vertcat(accelZ,rTable{iter,4});      
##    end
##    if strcmp (rTable{iter,5},'Gyroscope')
##       gyrX = vertcat(gyrX,rTable{iter,2});
##       gyrY = vertcat(gyrY,rTable{iter,3});
##       gyrZ = vertcat(gyrZ,rTable{iter,4});      
##    end
##    if strcmp (rTable{iter,5},'Magnetometer')
##       timeMagnetRaw = vertcat(timeMagnetRaw,rTable{iter,1});
##       magX = vertcat(magX,rTable{iter,2});
##       magY = vertcat(magY,rTable{iter,3});
##       magZ = vertcat(magZ,rTable{iter,4});      
##    end
##    if strcmp (rTable{iter,5},'Altitude')
##       timeAltitudeRaw = vertcat(timeAltitudeRaw,rTable{iter,1});
##       altitude = vertcat(altitude,rTable{iter,2});    
##    end
##    if strcmp (rTable{iter,5},'Condition(Accelerometer)')
##       cond = vertcat(cond,rTable{iter,2});    
##    end
if iter2 > 500
    iter2 = 0;
    waitbar(iter/nrows);
end
    iter = iter + 1;
    iter2 = iter2 +1;
end

close(warn)




%Time in Seconds
[records,~] = size(timeRaw);
iter = 1;
time = zeros(records,1);
while iter <= records
    if iter > 1
        time(iter) = time(iter-1)+timeRaw(iter)-timeRaw(iter-1); 
    end
    iter = iter +1;
end

%Accelerations in m/s2
accelX = 9.80665*accelX;
accelY = 9.80665*accelY;
accelZ = 9.80665*accelZ;







