function plot_bode()
    param = plant_param();
    option = struct("thetae",0);
    sysc = plant_sysc(param,option);

    % frequency response of linear model
    [mag_sysc,phase_sysc,w_vec] = bode(ss(sysc.A,sysc.B,sysc.C,sysc.D));

    % frequency response of simscape and ode model
    mag_simscape = zeros(length(w_vec),1);
    phase_simscape = zeros(length(w_vec),1);
    mag_ode = zeros(length(w_vec),1);
    phase_ode = zeros(length(w_vec),1);
    for i = 1:length(w_vec)
        w = w_vec(i);

        % FFT settings
        N = 2048; % number of points (-)
        Ts = (2*pi)/(100*w);
        t_end = (N-1)*Ts; % simulation time (s)
        w_tmp = (2*pi*((1:N/2)-1)/(N*Ts))'; % angular frequency vector (Hz)

        simIn = Simulink.SimulationInput("simulation_sine");
        simIn = simIn.setVariable("x0",sysc.xe).setVariable("option",option).setVariable("t_end",t_end).setVariable("Ts",Ts).setVariable("w",w);
        simOut = sim(simIn);

        % frequency response of simscape
        [mag_simscape(i),phase_simscape(i)] = calc_frequency_response( ...
            simOut.logsout.getElement("w").Values.Data, ...
            simOut.logsout.getElement("x_simscape").Values.Data(:,1) ...
            ,N,w,w_tmp);

        % frequency response of ode
        [mag_ode(i),phase_ode(i)] = calc_frequency_response( ...
            simOut.logsout.getElement("w").Values.Data, ...
            simOut.logsout.getElement("x_ode").Values.Data(:,1), ...
            N,w,w_tmp);
    end

    figure("Name","pendulum bode plot");

    % magnitude
    subplot(2,1,1); hold on;
    p1=plot(w_vec,20*log10(mag_simscape),"-r");
    p2=plot(w_vec,20*log10(mag_ode),"--b");
    p3=plot(w_vec,20*log10(mag_sysc(1,:)),":g");

    ax = gca; ax.FontSize = 12; ax.XScale = "log";
    xlabel("frequency (rad/s)");
    ylabel("magnitude (dB)");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);

    % phase
    subplot(2,1,2); hold on;
    p1=plot(w_vec,unwrap(phase_simscape)*180/pi,"-r");
    p2=plot(w_vec,unwrap(phase_ode)*180/pi,"--b");
    p3=plot(w_vec,phase_sysc(1,:),":g");

    ax = gca; ax.FontSize = 12; ax.XScale = "log";
    xlabel("frequency (rad/s)");
    ylabel("phase (deg)");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);
end

function [mag,phase] = calc_frequency_response(u,y,N,w,w_tmp)
    Puu = fft(u,N);
    Pyy = fft(y,N);
    Puy = (Pyy.*conj(Puu))./(Puu.*conj(Puu));
    Puy = Puy(1:N/2);
    Guy = interp1(w_tmp,Puy,w);

    mag = abs(Guy);
    phase = angle(Guy);
end