clear
load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')
channel_no =3
start_time = mrk.pos(channel_no)
cnt(start_time+500,channel_no)
pwrsig1_strt_tym = start_time
pwrsig1_end_tym = start_time+15499;
c=1
for i=pwrsig1_strt_tym:pwrsig1_end_tym
    sig_val(c)= double(cnt(i,channel_no));
    time(c)=c;
    c=c+1;
end
plot(time,sig_val)
