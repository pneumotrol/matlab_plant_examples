function param = plant_param()
    % dimensions
    param.xdim = 1;
    param.udim = 1;

    % parameters
    param.g = 9.81; % gravity acceleration (m/s^2)
    param.A = 1; % area of tank (m^2)
    param.a = 0.1; % area of outflow (m^2)
end
