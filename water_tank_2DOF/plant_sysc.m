function sysc = plant_sysc(param,option)
    g = param.g;
    A1 = param.A1;
    a1 = param.a1;
    c1 = param.c1;
    A2 = param.A2;
    a2 = param.a2;
    c2 = param.c2;

    % equilibrium point
    z2e = option.z2e;
    z1e = ((c2*a2)/(c1*a1))^2*z2e;
    sysc.xe = [z1e;z2e];
    sysc.ue = c1*a1*sqrt(2*g*z1e);

    % coefficients of state equation
    sysc.A = [
        -(c1*a1*sqrt(2*g))/(2*A1*sqrt(z1e)),0;
        (c1*a1*sqrt(2*g))/(2*A2*sqrt(z1e)),-(c2*a2*sqrt(2*g))/(2*A2*sqrt(z2e));
    ];

    sysc.B = [
        (1/A1);
        0;
        ];

    sysc.C = eye(2);

    sysc.D = zeros(2,1);
end
