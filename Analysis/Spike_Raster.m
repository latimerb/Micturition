close all; clear all;

load Mict_data;

X_axis = Mict_data(:,2);

Y_axis = Mict_data(:,1);

plot(Y_axis, X_axis, '.');

