function[result] = CSP(frequency_signal)
load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')

right = zeros(10,10);
foot = zeros(10,10);
st=1;
et=1;
count_rghtcls=0;
count_footcls=0;
for i=1:168
    start_time(i) = st;
    end_time(i) = st + 2499;
    st = st +2500;
    start_time(i);
    end_time(i);
    no_of_val = end_time(i) - start_time(i);
    no_of_val+1;
    R_trans = double(frequency_signal(start_time(i):end_time(i),1:10));
    R = R_trans';
    class_val = mrk.y(i);
    isnan(class_val);
    if(isnan(class_val))
        fprintf("Class value is Nan")
    elseif( class_val == 1)
       right = [right,R];
        count_rghtcls =count_rghtcls +1;
    elseif(class_val == 2)
         foot = [foot,R];
         count_footcls =count_footcls+1;
    end     
end

result = f_CSP(right,foot);
