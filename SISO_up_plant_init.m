%% Clear workspace
clear;
clc;
close all;      % closes all figures

%% Initialize
s = tf('s');
load("params_aaa_elb.mat");     % initialize parameters


%% Test 2 (Set 1 works on real system, set # works on sim)

% Initialize simulation
x3_init = -.03;
sim_time = 30;
STEP_SIZE = Ts;
SIM_TIME = 10;           

gm = 90;
Ni = 4.5; 
al = 0.2;

% Values found using findpid.m in SISO_up_PI_LEAD_init.m
Kp = 6.4782e+05;
ti = 0.13622;
td = 0.067687;

Kp1 =  275470;
ti1 = 0.14705;
td1 = 0.0767;
al1 = 0.2;

% PI transfer function
CPI = (1 + 1 / (ti * s));
[num_CPI, den_CPI] = tfdata(CPI,'v');

CPI1 = (1 + 1 / (ti1 * s));
[num_CPI1, den_CPI1] = tfdata(CPI1,'v');

% Lead part transfer function
CD = (td * s + 1) / (al * td * s + 1);
[num_CD, den_CD] = tfdata(CD,'v');

CD1 = (td1 * s + 1) / (al1 * td1 * s + 1);
[num_CD1, den_CD1] = tfdata(CD1,'v');

%% Inputs 

% Step
ref = -0.02;

% Sine
bias = -0.02;
A = 0.01; % Amplitude
freq = 1; 

open('SISO_up_plant_PI_LEAD_2019a_v2.slx');
%% Plotting
% % Taken from oscilation_compensation_feedback_3graphing.m
% % 
% % After running simulation, go to Simulation Data Inspector and choose
% % export. Choose the following:
% % Export: Work area, excluding archive
% % To: Base workspace - save as simdata
% % Then run the code in this section.
% % 
% % Close all previous plots to prevent overlap
% % close all;
% % 
% % Save data for future reference
% % save 'sim_up_hat' simdata_upper_hold_hat


