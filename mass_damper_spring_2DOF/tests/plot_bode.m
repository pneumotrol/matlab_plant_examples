function plot_bode()
    param = plant_param();
    sysc = plant_sysc(param);

    % frequency response of linear model
    [mag_sysc,phase_sysc,w_vec] = bode(ss(sysc.A,sysc.B,sysc.C,sysc.D));

    % frequency response of simscape and ode model
    mag_simscape = zeros(length(w_vec),2);
    phase_simscape = zeros(length(w_vec),2);
    mag_ode = zeros(length(w_vec),2);
    phase_ode = zeros(length(w_vec),2);
    for i = 1:length(w_vec)
        w = w_vec(i);

        % FFT settings
        N = 2048; % number of points (-)
        Ts = (2*pi)/(100*w);
        t_end = (N-1)*Ts; % simulation time (s)
        w_tmp = (2*pi*((1:N/2)-1)/(N*Ts))'; % angular frequency vector (Hz)

        simIn = Simulink.SimulationInput("simulation_sine");
        simIn = simIn.setVariable("x0",sysc.xe).setVariable("t_end",t_end).setVariable("Ts",Ts).setVariable("w",w);
        simOut = sim(simIn);

        for j = 1:2
            % frequency response of simscape
            [mag_simscape(i,j),phase_simscape(i,j)] = calc_frequency_response( ...
                simOut.logsout.getElement("w").Values.Data, ...
                simOut.logsout.getElement("x_simscape").Values.Data(:,j) ...
                ,N,w,w_tmp);

            % frequency response of ode
            [mag_ode(i,j),phase_ode(i,j)] = calc_frequency_response( ...
                simOut.logsout.getElement("w").Values.Data, ...
                simOut.logsout.getElement("x_ode").Values.Data(:,j), ...
                N,w,w_tmp);
        end
    end

    figure("Name","mass_damper_spring_2DOF bode plot (from f1 to q1)");

    % magnitude
    subplot(2,1,1); hold on;
    p1=plot(w_vec,20*log10(mag_simscape(:,1)),"-r");
    p2=plot(w_vec,20*log10(mag_ode(:,1)),"--b");
    p3=plot(w_vec,20*log10(squeeze(mag_sysc(1,1,:))),":g");

    ax = gca; ax.FontSize = 12; ax.XScale = "log";
    xlabel("frequency (rad/s)");
    ylabel("magnitude (dB)");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);

    % phase
    subplot(2,1,2); hold on;
    p1=plot(w_vec,unwrap(phase_simscape(:,1))*180/pi,"-r");
    p2=plot(w_vec,unwrap(phase_ode(:,1))*180/pi,"--b");
    p3=plot(w_vec,squeeze(phase_sysc(1,1,:)),":g");

    ax = gca; ax.FontSize = 12; ax.XScale = "log";
    xlabel("frequency (rad/s)");
    ylabel("phase (deg)");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);


    figure("Name","mass_damper_spring_2DOF bode plot (from f1 to q2)");

    % magnitude
    subplot(2,1,1); hold on;
    p1=plot(w_vec,20*log10(mag_simscape(:,2)),"-r");
    p2=plot(w_vec,20*log10(mag_ode(:,2)),"--b");
    p3=plot(w_vec,20*log10(squeeze(mag_sysc(2,1,:))),":g");

    ax = gca; ax.FontSize = 12; ax.XScale = "log";
    xlabel("frequency (rad/s)");
    ylabel("magnitude (dB)");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);

    % phase
    subplot(2,1,2); hold on;
    p1=plot(w_vec,unwrap(phase_simscape(:,2))*180/pi,"-r");
    p2=plot(w_vec,unwrap(phase_ode(:,2))*180/pi,"--b");
    p3=plot(w_vec,squeeze(phase_sysc(2,1,:)),":g");

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
