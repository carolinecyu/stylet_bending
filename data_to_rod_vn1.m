% Variables
thickness = 0.127 + 0.000065+0.00075 + 0.11 + 2.7; 
% [mm] (PDMS, ch/au, parylene,tape,rod)

% Read in base resistance
R0_1 = 100;
R0_2 = 100;
R0_3 = 100;
R0_4 = 100;

R0 = [R0_1 R0_2 R0_3 R0_4];

% Read in current resistance
R1 = 99; 
R2 = 99; 
R3 = 102; 
R4 = 102;
R = [R1 R2 R3 R4]; 

% Gauge Factor - Bending/Compression
if R0_1 <= R1
    GF1 = 3.1;
else
    GF1 = -2;
end

if R0_2 <= R2
    GF2 = 3.1;
else
    GF2 = -2;
end

if R0_3 <= R3
    GF3 = 3.1;
else
    GF3 = -2;
end

if R0_4 <= R4
    GF4 = 3.1;
else
    GF4 = -2;
end
GF = [GF1 GF2 GF3 GF4];

% Calculate change in resistance
deltaR = R - R0; 
strain = deltaR./R./GF; 
% have to take into account if bending or compression later 

% Beam variables
E = 200e9;               % Young's Modulus [Pa]
d = 1.295;               % Diameter of rod [mm]
z = pi*d^3/32;           % Section Modulus of rod
l = 304.8;               % Length of rod [mm]
I = pi*d^4/64;           % Moment of inertia of rod 
force = E*strain*z/l;    % [N]

y = -force*l^3/3/E/I;    % Displacement of rod end wrt origin [mm]


%radius = thickness./2./strain;