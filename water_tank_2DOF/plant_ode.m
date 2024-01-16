function dxdt = plant_ode(~,x,u,param)
    g = param.g;
    A1 = param.A1;
    a1 = param.a1;
    c1 = param.c1;
    A2 = param.A2;
    a2 = param.a2;
    c2 = param.c2;

    if x(1) < 0
        x(1) = 0;
    end

    if x(2) < 0
        x(2) = 0;
    end

    dxdt = [
        (-c1*a1*sqrt(2*g*x(1))+u(1))/A1;
        (c1*a1*sqrt(2*g*x(1))-c2*a2*sqrt(2*g*x(2)))/A2;
        ];
end
