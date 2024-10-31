% plot impulse response
function fig = plot_impulse()
    param = plant_param();
    option = struct("Pe",(param.Pa+param.Ps)/2);
    sysc = plant_sysc(param,option);
    x0 = 0;
    dt = 1e-4;
    t_end = 0.1;

    % set parameters
    simIn = Simulink.SimulationInput("plant_test");
    simIn = simIn.setVariable("input_signal_type","impulse");
    simIn = simIn.setVariable("param",param).setVariable("sysc",sysc);
    simIn = simIn.setVariable("x0",x0 + sysc.xe);
    simIn = simIn.setVariable("ue",sysc.ue).setVariable("xe",sysc.xe);
    simIn = simIn.setVariable("dt",dt).setVariable("t_end",t_end);

    % impulse response of simscape model
    simIn = simIn.setVariable("plant_model_type","simscape");
    simOut_simscape = sim(simIn);

    % impulse response of ode model
    simIn = simIn.setVariable("plant_model_type","ode");
    simOut_ode = sim(simIn);

    % impulse response of linear model
    [~,t_sysc,x_sysc] = impulse(ss(sysc.A,sysc.B,sysc.C,sysc.D),t_end);

    % plotting
    fig = figure("Name","pneumatic_chamber impulse response (from mu to all states)"); hold on;
        p1 = plot(simOut_simscape.logsout.getElement("x").Values*diag(1e-3),"-r","LineWidth",1);
        p2 = plot(simOut_ode.logsout.getElement("x").Values*diag(1e-3),"--b","LineWidth",1);
        p3 = plot(t_sysc,x_sysc(:,:,1)/1e6*diag(1e-3),"-.k","LineWidth",1);

    ax = gca; ax.FontSize = 12;
    xlabel("time (s)");
    ylabel("state");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);
end