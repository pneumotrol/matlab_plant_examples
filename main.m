close all;
clear;
clc;

examples = [
    "mass_damper_spring";
    "mass_damper";
    ];

for i = 1:length(examples)
    close_system(find_system);
    example = examples(i);

    addpath(example);
    plotting();

    rmpath(example);
end