function sysc = plant_sysc(param,option)
    g = param.g;
    m = param.m;
    l = param.l;

    % equilibrium point
    qe = option.qe;
    sysc.xe = [qe;0];
    sysc.ue = m*l*g*sin(qe);

    % coefficients of state equation
    sysc.A = [
        0, 1;
        -(g/l)*cos(qe),0;
        ];

    sysc.B = [
        0;
        (1/(m*l^2))];

    sysc.C = eye(2);

    sysc.D = zeros(2,1);
end
