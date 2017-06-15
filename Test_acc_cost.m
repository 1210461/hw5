%dataset可选mnist以及covertype
[train_x,train_y,test_x,test_y]=data_choose('covertype');
lambda_list=[10,1,0.1,0.001];
maxiter=1000;
title_list={'lambda=10','lambda=1','lambda=0.1','lambda=0.001'};
for i=1:4
lambda=lambda_list(i);
[accuracy_adam,cost_adam]=adam(train_x,train_y,test_x,test_y,lambda,maxiter);
[accuracy_adagrad,cost_adagrad]=AdaGrad(train_x,train_y,test_x,test_y,lambda,maxiter);
fprintf('lambda=%12f  adam acc=%12f\n',lambda,accuracy_adam);
fprintf('lambda=%12f  adagrad acc=%12f\n',lambda,accuracy_adagrad);
subplot(2,2,i);
plot(cost_adam(:,1),cost_adam(:,2),'r-',cost_adagrad(:,1),cost_adagrad(:,2),'b--')
legend('cost-adam','cost-AdaGrad');
title(title_list(i));
xlabel('Iterations');
ylabel('Cost');
end
hold on;

