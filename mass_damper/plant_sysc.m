function sysc = plant_sysc(param,~)
    m = param.m;
    d = param.d;

    % equilibrium point
    sysc.xe = [0;0];
    sysc.ue = 0;

    % coefficients of state equation
    sysc.A = [
        0,1;
        0,-(d/m);
        ];

    sysc.B = [
        0;
        (1/m);
        ];

    sysc.C = eye(2);

    sysc.D = zeros(2,1);
end
