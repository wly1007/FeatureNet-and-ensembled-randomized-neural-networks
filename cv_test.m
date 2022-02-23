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
    for k=1:n
        test = (indices == k);
        train1 = ~test; 
        train_data=M(:,train1); 
        train_target=out(:,train1); 
        test_data=M(:,test);
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
