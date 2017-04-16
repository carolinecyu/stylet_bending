clc; 

s = serial('/dev/cu.usbmodemFD141', ...
                  'BaudRate', 9600, ...
                  'Parity', 'none', ...
                  'DataBits', 8, ...
                  'StopBits', 1); 
fopen(s);

data = zeros(1,40); 
for ii = 1:1:40
    f = fgetl(s);
    data(ii) = str2num(fgetl(s));
end

fclose(s);

% This script opens the serial port that the Arduino is connected to.
% It then grabs data from the serial connection until it reaches a
% whitespace (e.g. R1). It grabs the next line, which is the value of the
% resistance (e.g. 300), converts it from a character to a number. 40
% resistance numerical values are stored in the matrix. 
% The Arduino is programmed to send alternating lines of the resistor name
% (R1, R2, R3, R4) and the corresponding resistance. 