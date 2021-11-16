start_time = mrk.pos(5)
cnt(start_time+500,5)
pwrsig1_strt_tym = start_time+500
pwrsig1_end_tym = start_time+2000
pwrsig2_strt_tym = start_time+2000
pwrsig2_end_tym = start_time+2500
c=1
for i=pwrsig1_strt_tym:pwrsig1_end_tym
    t(c)= double(cnt(i,5));
    c =c+1;
end
double(t);
class(t)
% pxx = periodogram(t)
