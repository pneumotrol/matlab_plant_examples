function sysc = plant_sysc(param,option)
    g = param.g;
    A1 = param.A1;
    a1 = param.a1;
    c1 = param.c1;
    A2 = param.A2;
    a2 = param.a2;
    c2 = param.c2;

    % equilibrium point
    sysc.xe = option.xe;
    sysc.ue = [
        c1*a1*sqrt(2*g*sysc.xe(1));
        c2*a2*sqrt(2*g*sysc.xe(2))-c1*a1*sqrt(2*g*sysc.xe(1));
        ];

    % coefficients of state equation
    sysc.A = [
        -(c1*a1*sqrt(2*g))/(2*A1*sqrt(sysc.xe(1))),0;
        (c1*a1*sqrt(2*g))/(2*A2*sqrt(sysc.xe(1))),-(c2*a2*sqrt(2*g))/(2*A2*sqrt(sysc.xe(2)));
    ];

    sysc.B = [
        (1/A1),0;
        0,(1/A2);
        ];

    sysc.C = eye(2);

    sysc.D = zeros(2,2);
end