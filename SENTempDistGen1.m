% TEMPERATURE DISTRIBUTION FOR A 3X3X3 (=27) TEMP. DIST. TEST
% By Sasha Sen
% (Code with sample data from Kiln Firing test)
% ====================================================

% initial meshgrid to contain data
wgrid = (0:1:2);
lgrid = (0:1:2);
hgrid = (0:1:2);
[wmesh, lmesh, hmesh] = meshgrid(wgrid, lgrid, hgrid);
[vmesh] = meshgrid(wgrid, lgrid, hgrid); % vmesh holds temperature values
% values on T1 (layer 1)
vmesh(1,1,1) = 1237; % pos 1
vmesh(1,2,1) = 1243;
vmesh(1,3,1) = 1237; 
vmesh(2,1,1) = 1244; % pos 2
vmesh(2,2,1) = 1235;
vmesh(2,3,1) = 1231;
vmesh(3,1,1) = 1247; % pos 3
vmesh(3,2,1) = 1244;
vmesh(3,3,1) = 1236;
% values on T2 (layer 2)
vmesh(1,1,2) = 1249; % pos 1
vmesh(1,2,2) = 1247;
vmesh(1,3,2) = 1246;
vmesh(2,1,2) = 1249; % pos 2
vmesh(2,2,2) = 1246;
vmesh(2,3,2) = 1245;
vmesh(3,1,2) = 1251; % pos 3
vmesh(3,2,2) = 1249;
vmesh(3,3,2) = 1244;
% values on T3 (layer 3)
vmesh(1,1,3) = 1243; % pos 1
vmesh(1,2,3) = 1243;
vmesh(1,3,3) = 1247;
vmesh(2,1,3) = 1242; % pos 2
vmesh(2,2,3) = 1241;
vmesh(2,3,3) = 1246;
vmesh(3,1,3) = 1244; % pos 3
vmesh(3,2,3) = 1242;
vmesh(3,3,3) = 1244;
% Min and Max temp. values obtained
min = 1231;
max = 1251;

figure(1);
% see the ring/ thermocouple placement positions
scatter3(wmesh(:), lmesh(:), hmesh(:), 200, vmesh(:), 'Filled');
title('Placement Positions');
colormap('jet');
view(70,10)
figure (2);
colormap('jet');
s1 = slice(wmesh,lmesh,hmesh,vmesh,[0 1 2],[0 1 2],[0 1 2]);
set(s1, 'FaceAlpha', 0.2, 'EdgeAlpha', 0.3);
caxis([min max]) % defining the color range (min to max value)
title('Origional Data');

figure (3);
colormap('jet');
% interpolate data to a new and more accurate mesh
[wq,lq,hq] = meshgrid(0:0.25:2,0:0.25:2,0:0.25:2);
vq = interp3(wmesh,lmesh,hmesh,vmesh,wq,lq,hq);
s2 = slice(wq,lq,hq,vq,[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2],[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2],[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
set(s2, 'FaceAlpha', 0.2, 'EdgeAlpha', 0.1);
caxis([min max]) % defining the color range (min to max value)
% label axis
title('Temp. Dist. View 1');
xlabel('LEFT');
ylabel('BACK');

figure (4);
colormap('jet');
% interpolate data...
[wq,lq,hq] = meshgrid(0:0.25:2,0:0.25:2,0:0.25:2);
vq = interp3(wmesh,lmesh,hmesh,vmesh,wq,lq,hq);
s3 = slice(wq,lq,hq,vq,[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2],[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2],[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
set(s3, 'FaceAlpha', 0.2, 'EdgeAlpha', 0.1);
caxis([min max]) % defining the color range (min to max value)
% label axis
title('Temp. Dist. View 2');
xlabel('RIGHT');
ylabel('FRONT');
rotate(s3,[0 0 1],180) % change view to see other side of dist. cube

figure (5);
colormap('jet');
% interpolate data...
[wq,lq,hq] = meshgrid(0:0.25:2,0:0.25:2,0:0.25:2);
vq = interp3(wmesh,lmesh,hmesh,vmesh,wq,lq,hq);
s4 = slice(wq,lq,hq,vq,[],[],[0 0.5 1 1.5]);
%shading flat
set(s4, 'FaceAlpha', 0.9, 'EdgeAlpha', 0.1);
caxis([min max]) % defining the color range (min to max value)
% label axis
title('Temp. Dist. View 3 (CUT)');
xlabel('RIGHT');
ylabel('FRONT');
rotate(s4,[0 0 1],180)
view(-30,15)
