function sysc = plant_sysc(param,option)
    g = param.g;
    A = param.A;
    a = param.a;
    c = param.c;

    switch option.mode
        case {"output"} % linearize around output
            % equilibrium point
            sysc.xe = option.xe;
            sysc.ue = c*a*sqrt(2*g*sysc.xe);
        case {"input"} % linearize around input
            % equilibrium point
            sysc.ue = option.ue;
            sysc.xe = (sysc.ue^2)/(2*g*(c*a)^2);
    end

    % coefficients of state equation
    sysc.A = -(c*a*sqrt(2*g))/(2*A*sqrt(sysc.xe));

    sysc.B = (1/A);

    sysc.C = eye(1);

    sysc.D = zeros(1,1);
end