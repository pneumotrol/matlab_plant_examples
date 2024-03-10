function plot_impulse()
    assignin("base","x0",[0;0]);
    assignin("base","option",struct("qe",0));

    simIn = Simulink.SimulationInput("simulation_impulse");
    simOut = sim(simIn);

    figure("Name","pendulum impulse response"); hold on;
    p1=plot(simOut.logsout.getElement("x_simscape").Values,"-r");
    p2=plot(simOut.logsout.getElement("x_ode").Values,"--b");
    p3=plot(simOut.logsout.getElement("x_sysc").Values,":g");

    ax = gca; ax.FontSize = 12;
    xlabel("time (s)");
    ylabel("state");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);
end
