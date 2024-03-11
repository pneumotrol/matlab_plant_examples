function plot_impulse()
    param = plant_param();
    option = struct("mode","bottom");
    sysc = plant_sysc(param,option);

    assignin("base","x0",sysc.xe);
    assignin("base","option",option);
    simIn = Simulink.SimulationInput("simulation_impulse");
    simOut = sim(simIn);

    figure("Name","cart_pole impulse response"); hold on;
    p1=plot(simOut.logsout.getElement("x_simscape").Values,"-r");
    p2=plot(simOut.logsout.getElement("x_ode").Values,"--b");
    p3=plot(simOut.logsout.getElement("x_sysc").Values,":g");

    ax = gca; ax.FontSize = 12;
    xlabel("time (s)");
    ylabel("state");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);
end
