function sysc = plant_sysc(param,option)
    g = param.g;
    m = param.m;
    J = param.J;
    r = param.r;
    l = param.l;
    a = param.a;

    % equilibrium point
    qe = option.qe;
    sysc.xe = [qe;0;0;0];
    sysc.ue = a*m*g*qe/l;

    % coefficients of state equation
    sysc.A = [
        0,0,1,0;
        0,0,0,1;
        0,(-m*g)/(m+J/(r^2)),0,0;
        -g/(qe^2),0,0,0;
        ];

    sysc.B = [
        0;
        0;
        0;
        l/(a*m*qe^2);
        ];

    sysc.C = eye(4);

    sysc.D = zeros(4,1);
end
