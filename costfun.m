function cost=costfun(X,y,w,lambda)
[d,n]=size(X);
cost=sum(log(1+exp(-y.*(X'*w))))/n+lambda*norm(w,1);
end
    