close_system(find_system);
close all;
clear;
clc;

examples = [
    "mass_damper_spring";
    "mass_damper";
    "pendulum";
    "mass_damper_spring_2DOF";
    "mass_damper_2DOF";
    "cart_pole";
    "water_tank";
    "water_tank_2DOF";
    "ball_beam";
    ];

for i = 1:length(examples)
    example = examples(i);
    addpath(genpath(example));

    ts = tic();
    disp("start example "+example);
    plot_impulse();
    plot_bode();
    disp("finish example "+example+" in "+toc(ts)+" seconds");

    rmpath(genpath(example));
    close_system(find_system);
end
