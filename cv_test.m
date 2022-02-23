% M=[trainx,testx];
out=[trainy;testy]';
M=trainx;
% out=trainy';

out=single(out);
N_length=length(out);
N=800;
n=5;
sen=zeros(1,n);
spe=zeros(1,n);
acc=zeros(1,n);
tic
    indices=crossvalind('Kfold',N_length,n);
    for k=1:n %交叉验证k=10，10个包轮流作为测试集
        test = (indices == k); %获得test集元素在数据集中对应的单元编号
        train1 = ~test; %train集元素的编号为非test元素的编号
        train_data=M(:,train1); %从数据集中划分出train样本的数据
        train_target=out(:,train1); %获得样本集的测试目标
        test_data=M(:,test); %test样本集
        test_target=out(:,test);
%      [ind,TTest,acc(k),testtime]=CBAtest(train_data,train_target',test_data,test_target',N);
      [ind,TTest]=entest(N,train_data,train_target',test_data,test_target');
        [m,order] = confusionmat(TTest,single(ind));
    acc(k)=(m(1,1)+m(2,2))/sum(sum(m));
%     figure
%     cm = confusionchart(TTest,single(ind), ...
%     'Title','My Title', ...
%     'RowSummary','row-normalized', ...
%     'ColumnSummary','column-normalized');

    end
    mean_acc=mean(acc)