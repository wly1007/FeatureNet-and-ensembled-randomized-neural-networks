function [ind,TTest,TestingAccuracy,testtime]=CBAtest(trainx,trainy,testx,testy,N)
% clear;
% 
% load('testx.mat');
% load('testy.mat');
% load('trainx.mat');
% load('trainy.mat');

XTrain = trainx;
XTest = testx;

TTrain = single(trainy);
% TTrain = TTrain;
TTest = single(testy);
% TTest =YTest;

nsen=sum(TTest==2);
nspe=sum(TTest==1);

M1=[TTrain,XTrain'];
M2=[TTest,XTest'];
tic
% [TY,NumberofTestingData,TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy]=ELM_BA(M1,...
%     M2,1,500);%FP sensitivity, FN specificity
% [ww,FP,FN,NumberofTestingData,TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY]=snn_cba(M1,...
%     M2,1,400);%FP sensitivity, FN specificity
% 
% [FP,FN,NumberofTestingData,TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY]=RVFL_cba(XTrain',...
%     TTrain,XTest',TTest);%FP sensitivity, FN specificity
[TY,FP,FN,TrainingTime, testtime, TrainingAccuracy, TestingAccuracy] = elm(M1,...
    M2, 1, N, 'sig');
% [TY,FP,FN,TrainingTime, testtime, TrainingAccuracy, TestingAccuracy] = snn(M1,...
%     M2, 1, N, 'sig');
% option.ActivationFunction='sigmoid';option.N=N;option.mode=1;
% [train_accuracy,TestingAccuracy,TY,testtime]=RVFL_train_val(XTrain',...
%     TTrain,XTest',TTest,option);
% res=sum(abs(TY-TTest))
% ind=TY;
toc
TY=TY';
[b,ind]=max(TY,[],2);


