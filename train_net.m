function [net,confMat,trainx,trainy,testx,testy,YTest]=train_net(XTrain,TTrain,XTest,TTest)

n=41; t=13031;
ker=5;
% XTrain = Input(:,:,:,1:nut);
% XTest = Input(:,:,:,nut+1:t);
% TTrain = categorical(Target(:,1:nut));
% TTrain = TTrain';
% YTest = categorical(Target(:,nut+1:t));
% TTest =YTest'; 

% XTrain = Input(:,:,:,1:t);
% TTrain = categorical(Target(:,1:t));
% TTrain = TTrain';


  layers = [imageInputLayer([n n 1],'Normalization','zerocenter')
          convolution2dLayer(ker,64,'Padding',2)
          batchNormalizationLayer('Name','BN1')
          reluLayer()
          maxPooling2dLayer(2,'Stride',1)
          convolution2dLayer(ker,128,'Padding',2)
          batchNormalizationLayer('Name','BN2')
          reluLayer()
          maxPooling2dLayer(2,'Stride',1)
          fullyConnectedLayer(128,'Name','fc1')
          reluLayer('Name','relu')
          dropoutLayer(0.5)
          fullyConnectedLayer(2,'Name','fc2')
          softmaxLayer('Name','softmax')
          classificationLayer()];
options = trainingOptions('adam', ...
    'MiniBatchSize',200, ...
    'MaxEpochs',1, ...
    'InitialLearnRate',1e-4, ...
    'L2Regularization',0.001,...
    'ExecutionEnvironment','gpu',...
    'Verbose',false, ...
    'ValidationData',{XTest,TTest},...
    'ValidationFrequency',20,...
    'Plots','training-progress');        
net = trainNetwork(XTrain,TTrain,layers,options);
tic      
YTest = classify(net,XTest);
toc
confMat = confusionmat(TTest, YTest)
accuracy = sum(YTest == TTest)/numel(TTest)
%     figure
%     cm = confusionchart(TTest,YTest, ...
%     'Title','My Title net', ...
%     'RowSummary','row-normalized', ...
%     'ColumnSummary','column-normalized');

% YTrain = classify(net,XTrain);
% confMat = confusionmat(TTrain, YTrain)
% accuracy = sum(YTrain == TTrain)/numel(TTrain)

featureLayer='fc1';
tic 
trainx = activations(net, XTrain, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');
toc
trainy=TTrain;
testx=activations(net, XTest, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');
testy=TTest;

