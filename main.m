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
    ];

for i = 1:length(examples)
    close_system(find_system);
    example = examples(i);

    addpath(example);
    plotting();

    rmpath(example);
end