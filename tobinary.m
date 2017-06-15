function y_new=tobinary(y)
y_new=mod(y,2);
y_new(find(y_new==0))=-1;
end