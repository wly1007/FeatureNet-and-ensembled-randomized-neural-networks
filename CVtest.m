load('Dataset_41_13031.mat');
new=zeros(41,41,1,13031);
new(:,:,1,:)=Input;
Input=new;
% load('dataset.mat');
Target=categorical(Target);

N_length=length(Target);
N=800;
n=5;
acc=zeros(1,n);
nconfm=zeros(2,2,n);
m=zeros(2,2,n);
% X=zeros(2606,5);
% Y=zeros(2606,5);
% Xelm=zeros(2606,5);
% Yelm=zeros(2606,5);
% Xsnn=zeros(2606,5);
% Ysnn=zeros(2606,5);
% Xrvfl=zeros(2606,5);
% Yrvfl=zeros(2606,5);

tic
    indices=crossvalind('Kfold',N_length,n);
    for k=1:n %交叉验证k=10，10个包轮流作为测试集
        test = (indices == k); %获得test集元素在数据集中对应的单元编号
        train1 = ~test; %train集元素的编号为非test元素的编号
        XTrain=Input(:,:,:,train1); %从数据集中划分出train样本的数据
        TTrain=Target(:,train1)'; %获得样本集的测试目标
        XTest=Input(:,:,:,test); %test样本集
        TTest=Target(:,test)';
       [net,nconfm(:,:,k),trainx,trainy,testx,testy,YTest]=train_net(XTrain,TTrain,XTest,TTest);
       [sensitivity_net(k),specificity_net(k),accuracy_net(k),precision_net(k),F1_net(k)]=getindexes(nconfm(:,:,k));
       [X(:,k),Y(:,k),auc(k)]=plot_roc(single(YTest)-1,single(testy)-1);
       display(auc);
%      [ind,TTest,acc(k),testtime]=CBAtest(trainx,trainy,testx,testy,N);
       [yelm,ysnn,yrvfl,cfmelm(:,:,k),cfmsnn(:,:,k),cfmrvfl(:,:,k),cfmen(:,:,k),ta,TTest]=entest(N,trainx,trainy,testx,testy);
       [Xelm(:,k),Yelm(:,k),aucelm(k)]=plot_roc(single(yelm)-1,single(testy)-1);
       [Xsnn(:,k),Ysnn(:,k),aucsnn(k)]=plot_roc(single(ysnn)-1,single(testy)-1);
       [Xrvfl(:,k),Yrvfl(:,k),aucrvfl(k)]=plot_roc(single(yrvfl)-1,single(testy)-1);
       
       [sensitivity_elm(k),specificity_elm(k),accuracy_elm(k),precision_elm(k),F1_elm(k)]=getindexes(cfmelm(:,:,k));
       [sensitivity_snn(k),specificity_snn(k),accuracy_snn(k),precision_snn(k),F1_snn(k)]=getindexes(cfmsnn(:,:,k));
       [sensitivity_rvfl(k),specificity_rvfl(k),accuracy_rvfl(k),precision_rvfl(k),F1_rvfl(k)]=getindexes(cfmrvfl(:,:,k));
       [sensitivity_en(k),specificity_en(k),accuracy_en(k),precision_en(k),F1_en(k)]=getindexes(cfmen(:,:,k));
      
%         [m(:,:,k),order] = confusionmat(TTest,single(ind));
%     acc(k)=(m(1,1,k)+m(2,2,k))/sum(sum(m(:,:,k)));
%     figure
%     cm = confusionchart(TTest,single(ind), ...
%     'Title','My Title en', ...
%     'RowSummary','row-normalized', ...
%     'ColumnSummary','column-normalized');

% [X,Y,T,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(TTest,single(ind),2);
% figure,plot(X,Y)
% xlabel('False positive rate') 
% ylabel('True positive rate')
% title('ROC for Classification')
    end
%     ntot=nconfm(:,:,1)+nconfm(:,:,2)+nconfm(:,:,3)+nconfm(:,:,4)+nconfm(:,:,5)
%     tot=m(:,:,1)+m(:,:,2)+m(:,:,3)+m(:,:,4)+m(:,:,5)
%     mean_acc=mean(acc)