clc;
clear;
close all;

%% Load upper oscillation data

load("sim_osc.mat");
load("sim_osc_hat.mat");
y2_cal = find(simdata_upper_osc{1}, "Name", "y2_cal");
y2_cal = y2_cal{1}.Values;
y2_hat = find(simdata_upper_osc_hat{1}, "Name", "y2_hat");
y2_hat = y2_hat{1}.Values;
r2 = simdata_upper_osc{1};
r2 = r2{9}.Values;
e2 = find(simdata_upper_osc_hat{1}, "Name", "e2");
e2 = e2{1}.Values;

