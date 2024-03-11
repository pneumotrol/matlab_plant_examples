function sysc = plant_sysc(param,option)
    g = param.g;
    m = param.m;
    l = param.l;

    % equilibrium point
    q1e = option.q1e;
    sysc.xe = [q1e;0];
    sysc.ue = m*l*g*sin(q1e);

    % coefficients of state equation
    sysc.A = [
        0,1;
        -(g/l)*cos(q1e),0;
        ];

    sysc.B = [
        0;
        1/(m*l^2);
        ];

    sysc.C = eye(2);

    sysc.D = zeros(2,1);
end
