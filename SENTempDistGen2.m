% TEMPERATURE DISTRIBUTION FOR A ARBITARY POINT (WITH MISSING NODES) TEMP. DIST. TEST
% By Sasha Sen
% (Code with sample data from Kiln Firing test)
% ====================================================

% Initial meshgrid is created to contain data.
% This will change depending on your test nodes and missing data

wgrid = (0:1:2);
lgrid = (0:1:6);
hgrid = (0:1:3);
[wmesh, lmesh, hmesh] = meshgrid(wgrid, lgrid, hgrid);
[vmesh] = meshgrid(wgrid, lgrid, hgrid); % vmesh holds temperature values
% Note that some temperature values are missing. We will use interpolation
% to fill these in.
% Change the following values 
% values on T1
vmesh(1,1,1) = 1242; % (0,0,0) pos 1
vmesh(1,2,1) = 1223; % (1,0,0)
vmesh(1,3,1) = 1248; % (2,0,0) #1 (left)
vmesh(2,1,1) = NaN; % pos 2
vmesh(2,2,1) = NaN;
vmesh(2,3,1) = NaN;
vmesh(3,1,1) = NaN; % pos 3
vmesh(3,2,1) = NaN;
vmesh(3,3,1) = NaN;
vmesh(4,1,1) = 1251; % pos 4
vmesh(4,2,1) = 1233;
vmesh(4,3,1) = 1251;
vmesh(5,1,1) = NaN; % pos 5
vmesh(5,2,1) = NaN;
vmesh(5,3,1) = NaN;
vmesh(6,1,1) = NaN; % pos 6
vmesh(6,2,1) = NaN;
vmesh(6,3,1) = NaN;
vmesh(7,1,1) = 1253; % pos 7
vmesh(7,2,1) = 1251;
vmesh(7,3,1) = 1253;
% values on T2
vmesh(1,1,2) = 1254; % pos 1
vmesh(1,2,2) = 1253;
vmesh(1,3,2) = 1256; % #1 (left)
vmesh(2,1,2) = NaN; % pos 2
vmesh(2,2,2) = NaN;
vmesh(2,3,2) = NaN;
vmesh(3,1,2) = NaN; % pos 3
vmesh(3,2,2) = NaN;
vmesh(3,3,2) = NaN;
vmesh(4,1,2) = 1252; % pos 4
vmesh(4,2,2) = 1250;
vmesh(4,3,2) = 1255;
vmesh(5,1,2) = NaN; % pos 5
vmesh(5,2,2) = NaN;
vmesh(5,3,2) = NaN;
vmesh(6,1,2) = NaN; % pos 6
vmesh(6,2,2) = NaN;
vmesh(6,3,2) = NaN;
vmesh(7,1,2) = 1254; % pos 7
vmesh(7,2,2) = 1252;
vmesh(7,3,2) = 1255;
% values on T3
vmesh(1,1,3) = NaN; % pos 1
vmesh(1,2,3) = NaN;
vmesh(1,3,3) = NaN; % #1 (left)
vmesh(2,1,3) = 1254; % pos 2
vmesh(2,2,3) = 1252;
vmesh(2,3,3) = 1255;
vmesh(3,1,3) = NaN; % pos 3
vmesh(3,2,3) = NaN;
vmesh(3,3,3) = NaN;
vmesh(4,1,3) = 1249; % pos 4
vmesh(4,2,3) = 1249;
vmesh(4,3,3) = 1255;
vmesh(5,1,3) = NaN; % pos 5
vmesh(5,2,3) = NaN;
vmesh(5,3,3) = NaN;
vmesh(6,1,3) = 1254; % pos 6
vmesh(6,2,3) = 1253;
vmesh(6,3,3) = 1261;
vmesh(7,1,3) = NaN; % pos 7
vmesh(7,2,3) = NaN;
vmesh(7,3,3) = NaN;
% values on T4
vmesh(1,1,4) = NaN; % pos 1
vmesh(1,2,4) = NaN;
vmesh(1,3,4) = NaN; % #1 (left)
vmesh(2,1,4) = NaN; % pos 2
vmesh(2,2,4) = NaN;
vmesh(2,3,4) = NaN;
vmesh(3,1,4) = NaN; % pos 3
vmesh(3,2,4) = NaN;
vmesh(3,3,4) = NaN;
vmesh(4,1,4) = NaN; % pos 4
vmesh(4,2,4) = NaN;
vmesh(4,3,4) = NaN;
vmesh(5,1,4) = 1253; % pos 5
vmesh(5,2,4) = NaN;
vmesh(5,3,4) = 1253;
vmesh(6,1,4) = NaN; % pos 6
vmesh(6,2,4) = NaN;
vmesh(6,3,4) = NaN;
vmesh(7,1,4) = NaN; % pos 7
vmesh(7,2,4) = NaN;
vmesh(7,3,4) = NaN;
% Min and Max temp. values obtained
min = 1233;
max = 1257;

figure(1); % view node positions
scatter3(wmesh(:), lmesh(:), hmesh(:), 200, vmesh(:), 'Filled'); %=> view your buller
colormap('jet');
title('Placement Positions');
view(87, 10);

% fill missing points with initial interpolation. We do this with INPAINTN
% Get it off Mathworks for free! (Many thanks to Damien Garcia). Link here:
% https://www.mathworks.com/matlabcentral/fileexchange/27994-inpaint-over-missing-data-in-1-d-2-d-3-d-nd-arrays?focused=8189785&tab=function
vpaint = inpaintn(vmesh);
% Take a look at the points that have been filled in
figure(2);
scatter3(wmesh(:), lmesh(:), hmesh(:), 200, vpaint(:), 'Filled');
colormap('jet');
title('Data Interpolated/Extrapolated');
view(87, 10);

% interpolate complete data (again) to a new, shorter interval mesh
figure (3);
colormap('jet');
[wq,lq,hq] = meshgrid(0:0.25:2,0:0.25:6,0:0.25:3);
vq = interp3(wmesh,lmesh,hmesh,vpaint,wq,lq,hq);
s2 = slice(wq,lq,hq,vq,[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2],[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.75 4 4.25 4.5 4.75 5 5.25 5.5 5.75 6],[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3]);
set(s2, 'FaceAlpha', 0.2, 'EdgeAlpha', 0.1);
caxis([min max]) % defining the color range (min to max value)
% label axis
title('Temp. Dist. View 1');
xlabel('BACK');
ylabel('RIGHT');


figure (4);
colormap('jet');
% interpolate data...
s4 = slice(wq,lq,hq,vq,[],[],[0 0.5 1 1.5]);
set(s4, 'FaceAlpha', 0.9, 'EdgeAlpha', 0.1);
caxis([min max]) % defining the color range (min to max value)
% label axis
title('K2 Temp. Dist. View 2 (CUT)');
xlabel('BACK');
ylabel('RIGHT');
view(-30,15)
