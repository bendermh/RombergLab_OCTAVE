function [pX,pY,pZ] = getPosition(t,ax,ay,az,test)
    if nargin == 4
        test = 'Unknown';
    end
    % PostPorcessing
    % Design High Pass Filter
    fs = 100; % Sampling Rate (100 gyro 50 magnetometer)
    fc = 0.0095; % Cut off Frequency (normalized freq = freq/(sampling*0.5)
    order = 2; % 2ND Order Filter
    % Filter Acceleration Signals
    [b1, a1] = butter(order,fc,'high');
    X1F=filtfilt(b1,a1,ax);
    Y1F=filtfilt(b1,a1,ay);
    Z1F=filtfilt(b1,a1,az);
    %Second acceleration filter
    fc = 0.02;
    [b2, a2] = butter(order,fc,'low');
    X1F=filtfilt(b2,a2,X1F);
    Y1F=filtfilt(b2,a2,Y1F);
    Z1F=filtfilt(b2,a2,Z1F);
    vX = cumtrapz(t,X1F);
    vY = cumtrapz(t,Y1F);
    vZ = cumtrapz(t,Z1F);
    % Design High Pass Filter
    %fs = 100; % Sampling Rate (100 gyro 50 magnetometer)
    fc = 0.0075; % 0.0006 o tambi?n 0.0013 ?
    order = 2; % 2ND Order Filter
    %Filter Velocity Signals
    [b1, a1] = butter(order,fc,'high');
    vX1F=filtfilt(b1,a1,vX);
    vY1F=filtfilt(b1,a1,vY);
    vZ1F=filtfilt(b1,a1,vZ);
    pX = cumtrapz(t,vX1F);
    pY = cumtrapz(t,vY1F);
    pZ = cumtrapz(t,vZ1F);
    pX = pX * sqrt(2431.5);
    pY = pY * sqrt(2431.5);
    pZ = pZ * sqrt(2431.5);
    %GET 90% CEA
    area = cea2d(pX,pY,0.1);
    strArea = [' (Area 2D: ' num2str(area) ')'];
    display (strArea);
    %Plot scale in meters
    limit = 1;
    limita = 0.45;
    limitv = 0.075;
    figure;
    subplot(2,2,1);
    plot(t,X1F,t,Y1F,t,Z1F),legend('acX','acY','acZ'),ylim([-limita limita]);
    title(['Acceleration in: ', test]);
    subplot(2,2,2);
    plot(t,vX1F,t,vY1F,t,vZ1F),legend('vX','vY','vZ'),ylim([-limitv limitv]);
    title(['Velocity in: ', test]);
    subplot(2,2,3);
    plot(t,pX,t,pY,t,pZ),legend('pX','pY','pZ'),ylim([-limit limit]);
    title(['Position in: ', test]);
    subplot(2,2,4);
    plot3(pX,pY,pZ,'LineWidth',2),ylim([-limit limit]),xlim([-limit limit]),zlim([-limit limit]),grid on;
    title(['Spatial position in: ', test,strArea]);
end