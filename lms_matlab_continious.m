clc
close all
clear all

%N=input('interval = ');
N=10
t=[0:0.1:N-1];
filter_size=length(t);
filter_size=10;
w0=0.5;  phi=0;
desired_signal=[1 0 1 0 1 0 1 0 1 0];
input_signal=[1 0 1 1 1 1 1 0 0 0];

%desired_signal=10*sin(2*pi*[0:0.1:N-1]*w0+phi);
%input_signal=10*sin(2*pi*[0:0.1:N-1]*w0+phi).^2;


filter_current = zeros(filter_size,1);
input_vector = zeros(filter_size, 1);

for k=1:1
for i=1:filter_size
i

input_vector(1)=input_signal(i);
filter_output(i)=dot(filter_current, input_vector);
error= desired_signal(i)-filter_output(i)

step_size=1/(1+(dot(input_vector, input_vector)))
%step_size=2*0.0000001
filter_current = filter_current +(step_size*error*input_vector);

for j=filter_size:-1:2
input_vector(j)=input_vector(j-1);
end
error_signal(i)=error;
cost(i)=error*error;
ss(i)=step_size;
end
input_vector = zeros(filter_size, 1)
end
output=conv((filter_current)',input_signal)
koutput=output(1:10)
t=1:10
subplot(321),plot(t,desired_signal),ylabel('Desired Signal'),
subplot(322),plot(t,input_signal),ylabel('Input Signal+Noise'),
subplot(323),plot(t,error_signal),ylabel('Error'),
subplot(324),plot(t,koutput),ylabel('Adaptive Desired output')
subplot(325),plot(t,ss),ylabel('Step-size')