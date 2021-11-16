function Power = periodogram_calculation(channel, trial, signal_strat_time, signal_end_time)

    load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')
    start_time = mrk.pos(trial);
    pwrsig_strt_tym = start_time+signal_strat_time;
    pwrsig_end_tym = start_time+signal_end_time;
    %pwrsig2_strt_tym = start_time+2000;
    %pwrsig2_end_tym = start_time+2500;
    c=1;
    for i=pwrsig_strt_tym:pwrsig_end_tym
        signal(c)= double(cnt(i,channel));
        c =c+1;
    end
    
    n =pwrsig_end_tym - pwrsig_strt_tym;
    Power = 0;
    omega = 1.5;
    for f=1:9
        c=0;
        P=0;
        omega = omega+4;
        for i=pwrsig_strt_tym:pwrsig_end_tym
            wr_i = 0.54 + (0.46*cos(2*pi*c/n-1));
            z(c+1) = wr_i * signal(c+1) * abs(exp(-1*1j*omega*c));
            P = P + (wr_i * signal(c+1) * abs(exp(-1*1j*omega*c)));
            c= c+1;    
        end
        Power = (Power + P)/f;
    end

end