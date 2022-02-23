% X=xen;
% Y=yen;
figure,
hold on
plot(X(:,1),Y(:,1),'-ro','LineWidth',1,'MarkerSize',1);  
plot(X(:,2),Y(:,2),'-bo','LineWidth',1,'MarkerSize',1);  
plot(X(:,3),Y(:,3),'-co','LineWidth',1,'MarkerSize',1);  
plot(X(:,4),Y(:,4),'-ko','LineWidth',1,'MarkerSize',1);  
plot(X(:,5),Y(:,5),'-yo','LineWidth',1,'MarkerSize',1);  
legend('F=1','F=2','F=3','F=4','F=5');
axis([0 1 0 1]);
hold off
% xlabel('虚报概率');  
% ylabel('击中概率');  
% title('ROC曲线图');  
