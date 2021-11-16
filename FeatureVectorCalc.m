function[featVec, projectionMatrix] = FeatureVectorCalc(frequency, channels, start_trial, end_trial, x, pm)

bciSig = FrequencyDecomposition(frequency, channels, start_trial, end_trial);
if( x == 1)
    projectionMatrix = CSP(bciSig);
end
if( x == 2)
    projectionMatrix = pm;
end
cspFeatures = projectionMatrix * bciSig';
featureVec = cspFeatures';
featVec(:,1:2) = featureVec(:,1:2);
featVec(:,3:4) = featureVec(:, 3:4);