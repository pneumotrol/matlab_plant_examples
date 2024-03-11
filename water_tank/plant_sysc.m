function sysc = plant_sysc(param,option)
    g = param.g;
    A = param.A;
    a = param.a;
    c = param.c;

    % equilibrium point
    ze = option.ze;
    sysc.xe = ze;
    sysc.ue = c*a*sqrt(2*g*ze);

    % coefficients of state equation
    sysc.A = -(c*a*sqrt(2*g))/(2*A*sqrt(ze));

    sysc.B = (1/A);

    sysc.C = eye(1);

    sysc.D = zeros(1,1);
end
