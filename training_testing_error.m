%dataset可选mnist以及covertype
[train_x,train_y,test_x,test_y]=data_choose('mnist');
lambda_list=[10,1,0.1,0.001];
%为了显示，只进行20次迭代
maxiter=20;
title_list={'lambda=10','lambda=1','lambda=0.1','lambda=0.001'};
figure(1)
for i=1:4
lambda=lambda_list(i);
[accuracy_adam,cost_adam,adam_opt,adam_time,cost_test_adam]=adam(train_x,train_y,test_x,test_y,lambda,maxiter);
[accuracy_adagrad,cost_adagrad,adagrad_opt,adagrad_time,cost_test_adagrad]=AdaGrad(train_x,train_y,test_x,test_y,lambda,maxiter);
cost_adam(:,2)=cost_adam(:,2)-adam_opt;
cost_adagrad(:,2)=cost_adagrad(:,2)-adagrad_opt;
figure(1)
subplot(2,2,i);
semilogy(cost_adam(:,1),cost_adam(:,2),'r*-',cost_adagrad(:,1),cost_adagrad(:,2),'b.-')
legend('adam','AdaGrad');
title(title_list(i));
xlabel('Iterations');
ylabel('Training Error');
figure(2)
subplot(2,2,i);
plot(adam_time,cost_test_adam,'g*-',adagrad_time,cost_test_adagrad,'m.-')
legend('adam','AdaGrad');
title(title_list(i));
xlabel('Time(s)');
ylabel('Testing Error');
end
hold on;
figure(2)


