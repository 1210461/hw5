function grad=sgd(X,y,w,lambda)  
[d,n]=size(X);
L_grad=zeros(d,1);
grad=zeros(d,1);
m=100;
index=randi([1 n],m,1);
for i=1:m
    L_grad=L_grad+grad_Li(X(:,index(i)),y(index(i)),w);
end
L_grad=L_grad./m;
for j=1:d
    if w(j)~=0
        grad(j)=L_grad(j)+lambda*sign(w(j));
    elseif w(j)==0 & L_grad(j)<-lambda
        grad(j)=L_grad(j)+lambda;
    elseif w(j)==0 & L_grad(j)>lambda
        grad(j)=L_grad(j)-lambda;
    else
        grad(j)=0;
    end
end
end    