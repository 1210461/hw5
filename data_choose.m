function [train_x,train_y,test_x,test_y]=data_choose(dataset)
if strcmp(dataset,'mnist')
    train_x=load('mnist_train_x.mat');
    train_x=train_x.images;
    train_y=load('mnist_train_y.mat');
    train_y=train_y.labels;
    test_x=load('mnist_test_x.mat');
    test_x=test_x.test_images;
    test_y=load('mnist_test_y.mat');
    test_y=test_y.test_labels;
elseif strcmp(dataset,'covertype')
    covertype_x=load('covertype_x.mat');
    covertype_x=covertype_x.array;
    covertype_y=load('covertype_y.mat');
    covertype_y=covertype_y.array;
    train_x=covertype_x(:,1:400000);
    test_x=covertype_x(:,400001:581012);
    train_y=covertype_y(:,1:400000)';
    test_y=covertype_y(:,400001:581012)';
end
train_y=tobinary(train_y);
test_y=tobinary(test_y);
end