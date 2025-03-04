clear 
clc
close all

%% Loading parameters

% cd('..//Parameters');
load('params_aaa_elb.mat')
% cd('..//FRICTION_v2');

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


SIM_TIME = 12;
STEP_SIZE = Ts/10;
%% Tests

% Test 1
%L2 = 500;
%L3 = -800;
%RMSE = 0.0090

% Test 2
%L2 = 5000;
%L3 = -8000;
%RMSE = 0.0091

% Test 3
%L2 = 50000;
%L3 = -80000;
%RMSE = 0.0090

%% Loading signals
load('test1_fricest.mat');

v1_time_series = get(data,'v1');
v1_hat_time_series = get(data,'v1_hat');
F_hat_time_series = get(data,'F_hat');

time = v1_time_series.Values.Time;
v1 = v1_time_series.Values.Data;
v1_hat = v1_hat_time_series.Values.Data;
F_hat = F_hat_time_series.Values.Data;

%% Plotting friction vs velocity

% Median filtering
medfiltord = 40;
F_hat_filt = medfilt1(F_hat,medfiltord);
v1_filt = medfilt1(v1,medfiltord);

figure(2);
grid on;
plot(v1_filt,F_hat_filt,'black.','MarkerSize',3);
xlabel('Velocity [m/s]','Interpreter','latex');
ylabel('Estimated Friction [N]','Interpreter','latex');
xlim([-0.05 0.05]);
ylim([-0.2 0.2]);
hold off;

%% quick sanity check !

figure(1);
plot(time,[v1,v1_hat]);
e_v1 = v1-v1_hat;
loss = e_v1 .^ 2;
acc_loss = sum(loss);
rmse = sqrt(1/length(time) * acc_loss);
