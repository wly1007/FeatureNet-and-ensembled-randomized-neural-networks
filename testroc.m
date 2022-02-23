% % X=xen;
% % Y=yen;
% axnet=mean(xnet,2);
% aynet=mean(ynet,2);
% axen=mean(xen,2);
% ayen=mean(yen,2);
% axrvfl=mean(Xelm,2);
% ayrvfl=mean(Yelm,2);
% axelm=mean(Xrvfl,2);
% ayelm=mean(Yrvfl,2);
% axsnn=mean(Xsnn,2);
% aysnn=mean(Ysnn,2);
% 
% figure,
% hold on
% plot(axen,ayen,'-ro','LineWidth',1,'MarkerSize',1);  
% plot(axnet,aynet,'-bo','LineWidth',1,'MarkerSize',1);  
% plot(axelm,ayelm,'-co','LineWidth',1,'MarkerSize',1);  
% plot(axsnn,aysnn,'-ko','LineWidth',1,'MarkerSize',1);  
% plot(axrvfl,ayrvfl,'-yo','LineWidth',1,'MarkerSize',1);  
% legend('FeatureNet-EN','FeatureNet','FeatureNet-ELM','FeatureNet-SNN','FeatureNet-RVFL');
% axis([0 1 0 1]);
% hold off

% axen=mean(xen,2);
% ayen=mean(yen,2);
% ax5=mean(x5,2);
% ay5=mean(y5,2);
% ax7=mean(x7,2);
% ay7=mean(y7,2);
% ax9=mean(x9,2);
% ay9=mean(y9,2);
% ax11=mean(x11,2);
% ay11=mean(y11,2);
% 
% figure,
% hold on
% plot(axen,ayen,'-ro','LineWidth',1,'MarkerSize',1);  
% plot(ax5,ay5,'-bo','LineWidth',1,'MarkerSize',1);  
% plot(ax7,ay7,'-co','LineWidth',1,'MarkerSize',1);  
% plot(ax9,ay9,'-ko','LineWidth',1,'MarkerSize',1);  
% plot(ax11,ay11,'-yo','LineWidth',1,'MarkerSize',1);  
% legend('3×3','5×5','7×7','9×9','11×11');
% axis([0 1 0 1]);
% hold off

axen=mean(xen,2);
ayen=mean(yen,2);
axsgdm=mean(xsgdm,2);
aysgdm=mean(ysgdm,2);
axadam=mean(xadam,2);
ayadam=mean(yadam,2);


figure,
hold on
plot(axen,ayen,'-ro','LineWidth',1,'MarkerSize',1);  
plot(axsgdm,aysgdm,'-bo','LineWidth',1,'MarkerSize',1);  
plot(axadam,ayadam,'-co','LineWidth',1,'MarkerSize',1);  
legend('RMSprop','SGDM','ADAM');
axis([0 1 0 1]);
hold off



