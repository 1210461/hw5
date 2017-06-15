images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');
test_images=loadMNISTImages('t10k-images.idx3-ubyte');
test_labels=loadMNISTLabels('t10k-labels.idx1-ubyte');
save('mnist_train_x.mat','images');
save('mnist_train_y.mat','labels');
save('mnist_test_x.mat','test_images');
save('mnist_test_y.mat','test_labels');