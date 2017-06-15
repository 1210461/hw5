import sklearn
from sklearn import datasets
import numpy
X,Y=sklearn.datasets.load_svmlight_file('covtype.libsvm.binary.scale')
X=X.toarray()
X=X.T
import scipy.io as scio  
scio.savemat('covertype_x.mat',{'array':X})
scio.savemat('covertype_y.mat',{'array':Y})