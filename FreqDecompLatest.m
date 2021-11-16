function[signal_data, projectionMat] = FreqDecompLatest(start_trial, end_trial, option, pm, channels)
load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')
%sig_val(c)= double(cnt(i),channel_no));
Fs =1000;
Ts=1/Fs;
duration = 0:Ts:2.5-Fs;
%channels_original = [33,37,49,50,51,52,54,55,56,57];



[featureVector(:,1:4), projectionMat] = FeatureVectorCalc(3, channels,start_trial, end_trial, option, pm); 
featureVector(:,5:8) = FeatureVectorCalc(7, channels,start_trial, end_trial, option, pm); 
featureVector(:,9:12) = FeatureVectorCalc(11, channels,start_trial, end_trial, option, pm); 
featureVector(:,13:16) = FeatureVectorCalc(15, channels,start_trial, end_trial, option, pm); 
featureVector(:,17:20) = FeatureVectorCalc(19, channels,start_trial, end_trial, option, pm);
featureVector(:,21:24) = FeatureVectorCalc(23, channels,start_trial, end_trial, option, pm);
featureVector(:,25:28) = FeatureVectorCalc(27, channels,start_trial, end_trial, option, pm);
featureVector(:,29:32) = FeatureVectorCalc(31, channels,start_trial, end_trial, option, pm);
featureVector(:,33:36) = FeatureVectorCalc(35, channels,start_trial, end_trial, option, pm);

%featureVector
s=1;
k=1;
for i=start_trial:end_trial
  sig = featureVector(s:s+2499,:);
  feat_sumofvar = 0;
  for j=1:36
  feat_sumofvar = feat_sumofvar + var(sig(:,j));
  end
  for j=1:36
      vf = var(sig(:,j));
      x = log(vf/feat_sumofvar);
      signal_data(k,j) = x;
  end
  k = k+1;
  s =s+2500;
end

% signal_data
% class = mrk.y(:,1:168)'
% 
% 
% 
% SVMModel = fitcsvm(signal_data,class)
% 
% CVSVMModel = crossval(SVMModel);
% SVMKFoldLoss = kfoldLoss(CVSVMModel)
% 
% KnnModel = fitcknn(signal_data,class,'NumNeighbors',5);
% %KnnTrainingloss = resubLoss(KnnModel)
% CVKnnMdl = crossval(KnnModel);
% knnK_Foldloss = kfoldLoss(CVKnnMdl)
% 
% 
% KnnOld = knn_classification(signal_data, class, 168)