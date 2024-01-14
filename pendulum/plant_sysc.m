function sysc = plant_sysc(param,mode)
    g = param.g;
    m = param.m;
    l = param.l;

    switch mode
        case {1,"bottom"}
            % equilibrium point
            sysc.xe = [0;0];
        
            % coefficients of state eqiation
            sysc.A = [
                0, 1;
                (g/l),0;
                ];
        
            sysc.B = [
                0;
                (1/(m*l^2))];
        
            sysc.C = [
                1, 0;
                ];
        
            sysc.D = 0;
        case {2,"top"}
    end
end