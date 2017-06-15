function g=grad_Li(x,yi,w)
L=exp(-yi*dot(w,x));
g=(L/(1+L))*(-yi).*x;
end
