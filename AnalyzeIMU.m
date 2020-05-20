% Script to plot Accelerometer Data
% from RombergLab for iOS APP - https://apps.apple.com/us/app/romberglab/id1440287860?l=en 
% Originally developed by Jorge Rey-Martinez 2018
% Authors: Ariadna Valldeperes, Xabier Altuna, Jorge Rey Martinez 
% (C)2020


% Load OCTAVE required Packages
pkg load signal
pkg load statistics

[T,X,Y,Z,gX,gY,gZ,Talt,alt,Tmag,mX,mY,mZ,C] = read();
if size(T) < 1 
    display('No data was loaded !')
    return
end
%Modos Niños
index1 = find(C == 1);
index2 = find(C == 2);
index3 = find(C == 3);
%Modo Libre
index4 = find(C == 4);
%Modos Posturografia
index11 = find(C == 11);
index12 = find(C == 12);
index13 = find(C == 13);
index14 = find(C == 14);
if ~isempty(index1)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index1);
    X1 = Y(index1);
    Y1 = -Z(index1);
    Z1 = -X(index1);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition C1');
end
if ~isempty(index2)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index2);
    X1 = Y(index2);
    Y1 = -Z(index2);
    Z1 = -X(index2);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition C2');
end
if ~isempty(index3)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index3);
    X1 = Y(index3);
    Y1 = -Z(index3);
    Z1 = -X(index3);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition C3');
end
if ~isempty(index4)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index4);
    X1 = Y(index4);
    Y1 = -Z(index4);
    Z1 = -X(index4);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition F');
end
if ~isempty(index11)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index11);
    X1 = Y(index11);
    Y1 = -Z(index11);
    Z1 = -X(index11);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition P1');
end
if ~isempty(index12)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index12);
    X1 = Y(index12);
    Y1 = -Z(index12);
    Z1 = -X(index12);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition P2');
end
if ~isempty(index13)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index13);
    X1 = Y(index13);
    Y1 = -Z(index13);
    Z1 = -X(index13);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition P3');
end
if ~isempty(index14)
    %Change axis to match with device orientation Buton & ligt right, buton
    %top to light, both looking to observer eyes
    T1 = T(index14);
    X1 = Y(index14);
    Y1 = -Z(index14);
    Z1 = -X(index14);
    [pX,pY,pZ] = getPosition(T1,X1,Y1,Z1,'Condition P4');
end
