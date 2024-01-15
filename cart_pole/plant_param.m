function param = plant_param()
    % dimensions
    param.xdim = 4;
    param.udim = 1;

    % parameters
    param.g = 9.81; % gravity acceleration (m/s^2)
    param.M = 1; % mass of cart (kg)
    param.D = 0; % damping coefficent of cart (N.s/m)
    param.m = 1; % mass of pole (kg)
    param.J = 0.01; % moments of inertia of pole (kg.m^2)
    param.lg = 1; % length from joint to center of mass (m)
    param.d = 0.0; % damping coefficent of pole (N.s/m)
end