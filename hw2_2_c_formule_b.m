h = 1;

for i = 1:5
    Q = ((1/3)*exp(2*h)-(4/3)*exp(h)-(3/2)+4*exp(-h)-(5/3)*exp(-2*h)+(1/6)*exp(-4*h))/(2*h);   %formule b
    error = abs(Q+1);                                                                          %fout: |Q-(-e^(-0))|
    disp(h);
    disp(Q);
    disp(error);
    h = h/2;
end
