clear 
clc
close all

%% Loading parameters

cd('..//Parameters');
load('params_aaa_elb.mat')
cd('..//FRICTION_v2');

L2 = 500;
L3 = -800;
L = [0; L2; L3];


%Observer eigenvalues:
%Aigmented A and C matrices are found. x1 = y1.  x2 = y1d. x3 = F_hat.
A = [0 1 0;
     0 0 -1/m;
     0 0 0];
C = [0 1 0];

disp('Eigenvalues of System Matrix: ');
disp(eig(A-L*C)); % All eigenvalues of observable states must på on the LHP and no imaginary part

%% Input
u10_sine = 3000; %Operating point for sine
sine_f = 0.5; % [Hz]
sine_A = 1000;

%% Tests

% Test 1
L2 = 500;
L3 = -800;


% Test 2

%% Loading signals

runIDs = Simulink.sdi.getAllRunIDs; % Get all run IDs
latestRunID = runIDs(end); % Get the latest run
latestRun = Simulink.sdi.getRun(latestRunID); % Get the run object

numSignals = latestRun.SignalCount; % Get the number of signals

for i = 1:numSignals
    sig = latestRun.getSignalByIndex(i); % Get each signal
    signalName = sig.Name; % Get the signal name
    
    % Extract time and data values
    time = sig.TimeValues;
    values = sig.DataValues;

    % Assign to workspace with the signal name (replacing spaces with underscores)
    varName = matlab.lang.makeValidName(signalName);
    assignin('base', varName, [time values]);

    % Display signal names
    fprintf('Signal %d: %s\n', i, signalName);
end
