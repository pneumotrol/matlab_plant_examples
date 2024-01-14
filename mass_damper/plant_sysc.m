function sysc = plant_sysc(param,~)
    m = param.m;
    d = param.d;

    % equilibrium point
    sysc.xe = [0;0];

    % coefficients of state eqiation
    sysc.A = [
        0, 1;
        0,-(d/m)
        ];

    sysc.B = [
        0;
        (1/m)];

    sysc.C = [
        1, 0;
        ];

    sysc.D = 0;
end