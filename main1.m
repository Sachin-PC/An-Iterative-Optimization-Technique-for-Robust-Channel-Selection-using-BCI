clear
load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')
load('/home/HDUSER/Downloads/true_labels_aa.mat')
class = mrk.y(:,1:168)';
 test_class = true_y(:,169:280);
 best_acc = 0;
 best_refch = 1;
 
 

for j = 1:168
    fprintf("trial = %d\n",j);
        for k = 1:118
                AllTrialBeta(j,k) = find_beta(k,j);
        end
end
 
 
 
for refch = 1:118
    fprintf("Algorithm for Reference Channel %d is running\n",refch);
    reference_channel = refch;
    x_refch = nfo.xpos(reference_channel);
    y_refch = nfo.ypos(reference_channel);
    for i=1:118
        if( i ~= reference_channel) 
            x_i = nfo.xpos(i);
            y_i = nfo.ypos(i);
            eucd_dist(i) = sqrt((x_i-x_refch)*(x_i-x_refch) + (y_i-y_refch)*(y_i-y_refch));
            channel_weight(i) = 1/eucd_dist(i);
        end
    end

    for j = 1:168
        for k = 1:118
            if( k ~= reference_channel)
                beta(k) = AllTrialBeta(j,k);
            end
        end

        for k =1:118
            if( k ~= reference_channel)
                 phi(k) = find_phi(k, channel_weight, beta);
                 channel_weight(k) = channel_weight(k) + phi(k);
            end
        end
    end

    channel_weight;

    [best_channel_weights,best_channels] = maxk(channel_weight,10);



    pm = zeros(4,4);
    [training_signal_data, projectionMatr] = FreqDecompLatest(1, 168, 1, pm, best_channels);
    %training_signal_data
    testing_signal_data = FreqDecompLatest(169, 280, 2, projectionMatr, best_channels);
    testing_signal_data;
    SVMModel = fitcsvm(training_signal_data,class);
    [label,score] = predict(SVMModel,testing_signal_data);
    count = 0;
    for i=1:112
        if(label(i) == test_class(i));
            count = count+1;
        end
    end
    count;
    acc = count/112*100;
    fprintf("Accuracy given by reference channel %d is %f\n",refch,acc)
    if(acc > best_acc)
        best_acc = acc;
        best_refch = refch;
    end
end

fprintf("Best reference channel is %d givig best accuracy of %d\n",best_refch, best_acc); 