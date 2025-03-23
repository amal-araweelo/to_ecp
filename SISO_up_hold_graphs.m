%% Clear workspace
clc;
clear;
close all;

%% Load upper hold data

load("sim_up.mat");
load("sim_up_hat.mat");
y2_cal = find(simdata_upper_hold, "Name", "y2_cal");
y2_cal = y2_cal{1}.Values;
y2_hat = find(simdata_upper_hold_hat{1}, "Name", "y2_hat");
y2_hat = y2_hat{1}.Values;
r2 = find(simdata_upper_hold, "Name", "ref");
r2 = r2{1}.Values;
e2 = find(simdata_upper_hold, "Name", "e2");
e2 = e2{1}.Values;
