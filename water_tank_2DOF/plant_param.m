function param = plant_param()
    % dimensions
    param.xdim = 2;
    param.udim = 1;

    % parameters
    param.g = 9.81; % gravity acceleration (m/s^2)
    param.A1 = 1; % area of tank (m^2)
    param.a1 = 0.1; % area of outflow (m^2)
    param.c1 = 1; % flow coefficient of outflow (-)
    param.A2 = 1; % area of tank (m^2)
    param.a2 = 0.1; % area of outflow (m^2)
    param.c2 = 1; % flow coefficient of outflow (-)
end