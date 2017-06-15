function [accuracy,cost_adagrad,adagrad_opt,adagrad_time,cost_test_adagrad]=AdaGrad(train_x,train_y,test_x,test_y,lambda,maxiter)
[d,n]=size(train_x);
w=randn(d,1);
r=zeros(d,1);
delta=10e-7;
w0=w;
lr=0.01;
iter=1;
plot_cost=zeros(maxiter,1);
adagrad_time=zeros(maxiter,1);
cost_test_adagrad=zeros(maxiter,1);
cost=@(x,y,w)sum(log(1+exp(-y.*(x'*w))))/length(y);
while iter<maxiter+1
    tic;
    g=sgd(train_x,train_y,w,lambda);
    r=r+g.*g;
    lr_new=lr./(delta+sqrt(r)).*g;
    w_old=w;
    w=w_old-lr_new;
    if iter==1
        adagrad_time(iter)=toc;
    else
        adagrad_time(iter)=adagrad_time(iter-1)+toc;
    end
    cost_test_adagrad(iter)=cost(test_x,test_y,w);
    cost_adagrad(iter,1)=iter;
    cost_adagrad(iter,2)=costfun(train_x,train_y,w,lambda);
    iter=iter+1;
end
toc;
pred_labels=sign(test_x'*w);
accuracy=sum(pred_labels==test_y)/length(test_y);
adagrad_opt=costfun(train_x,train_y,w,lambda);
end
