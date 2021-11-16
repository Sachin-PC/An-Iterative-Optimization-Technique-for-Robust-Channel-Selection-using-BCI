function[channels_signal] = FrequencyDecomposition(frequency, channels, start_trial, end_trial)

load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')
%sig_val(c)= double(cnt(i),channel_no));
Fs =1000;
Ts=1/Fs;
duration = 0:Ts:2.5-Fs;


start_freq = frequency;
end_freq = frequency + 5;

sig_val = [];
channels_signal= [];
freq_signal = [];
for i=1:10
    channel_no = channels(i);
    channel_no;
    for j=start_trial:end_trial
        start_time = mrk.pos(j);
        pwrsig1_strt_tym = start_time;
        pwrsig1_end_tym = start_time+2499;
        c=1;
        for p=pwrsig1_strt_tym:pwrsig1_end_tym
            sig_val(c)= double(cnt(p,channel_no));
            %time(c)=c;
            c=c+1;
        end 
        ybp = filter1('bp',sig_val,'fc',[start_freq end_freq],'fs',Fs);
        freq_signal = [freq_signal,ybp];
    end
    channels_signal(:,i) = freq_signal;
    freq_signal =[];
    sig_val = [];
end

end