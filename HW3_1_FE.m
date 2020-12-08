endt = 0.1;
deltat = 0.1;
t = 0;
w1 = 1;
w2 = 1;
w3 = 1;
disp(['delta t = ', num2str(deltat)]);
for i = 1:(endt/deltat)
    w1 = w1 + deltat*(1+(t-w1)^2);
    disp(['w1 = ', num2str(w1)]);
    t = t + deltat;
end
deltat = deltat/2;
t = 0;
disp(['delta t = ', num2str(deltat)]);

for i = 1:(endt/deltat)
    w2 = w2 + deltat*(1+(t-w2)^2);
    disp(['w2 = ', num2str(w2)]);
    t = t + deltat;
end
deltat = deltat/2;
t = 0;
disp(['delta t = ', num2str(deltat)]);

for i = 1:(endt/deltat)
    w3 = w3 + deltat*(1+(t-w3)^2);
    disp(['w3 = ', num2str(w3)]);
    t = t + deltat;
end

t = 0;

power = (w2 - w1)/(w3 - w2);
disp(['2^p = ', num2str(power)]);

K = (w3 - w2)/(deltat^(log2(power))*(power - 1));
disp(['K = ', num2str(K)]);

e = abs(K*deltat^log2(power));
disp(['e = ', num2str(e)]);
