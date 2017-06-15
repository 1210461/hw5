function [accuracy,cost_sgd_ls]=sgd_bls(train_x,train_y,test_x,test_y,lambda,maxiter)
[d,n]=size(train_x);
w=randn(d,1);
w0=w;
beta=0.5;
alpha=0.2;
lr=0.01;
iter=1;
cost_sgd_ls=zeros(maxiter-1,2);
while iter<maxiter
    tic
    g=sgd(train_x,train_y,w,lambda);
    step=1.0;
    while costfun(train_x,train_y,w-step.*g,lambda)>(costfun(train_x,train_y,w,lambda)-alpha*step*(norm(g)^2))
        step=beta*step;
        fprintf('step%f \n',step);
    end
    w_old=w;
    w=w_old-step.*g;
    cost_sgd_ls(iter,1)=iter;
    cost_sgd_ls(iter,2)=costfun(train_x,train_y,w,lambda);
    fprintf('iter: %d \n',iter);
    iter=iter+1;
end
pred_labels=sign(test_x'*w);
accuracy=sum(pred_labels==test_y)/length(test_y);
end