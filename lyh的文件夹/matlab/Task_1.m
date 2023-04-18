%%
clear;clc;
f = @(x) sin(x);

%% 
a = -10;
b = 10;
n = [10,20,40,80];
h = [];
fplot(f,[a,b]);
hold on;
size_n = size(n);
for i=1:size_n(2)
    h(i) = (b-a)/n(i);
end
J = [];
Data_J = {};
size_h = size(h);
for i=1:size_h(2)
    temp = a;
    for j=1:(b-a)/h(i)
        J = [temp,temp+h(i)];
        Data_J{i,j} = J;
        temp = temp+h(i);  
    end
end    
%%
size_Data_J = size(Data_J);
k = size_Data_J(1);

approx = [];
for i=1:k
    for j=1:size_Data_J(2)
        if isempty(Data_J{i,j})
            break;
        end
        front = Data_J{i,j}(1);
        
        midpoint = front + h(i)/2;
        approx(i,j)=f(midpoint);
    end
end
%%

for i=1:k
    x = [];
    y = [];
    for j=1:size_Data_J(2)

        if isempty(Data_J{i,j})
            break;
        end
        front = Data_J{i,j}(1);
        after = Data_J{i,j}(2);
        x_j = front:0.1:after;
        y_j = 0.*x_j+approx(i,j);
        x = [x,x_j];
        y = [y,y_j];
    end
    plot(x,y);
end

%%
error=[];
for i=1:k
    error_j = 0;
    for j=1:size_Data_J(2)

        if isempty(Data_J{i,j})
            break;
        end
        integral_approx = h(i)*approx(i,j);

        front = Data_J{i,j}(1);
        after = Data_J{i,j}(2);
        integral_f = integral(f,front,after);
        error_j = error_j+abs(integral_approx-integral_f);
    end
    error = [error;error_j];
    
end
%%
size_error = size(error);
log_error = [];
for i=2:size_error(1)
    log_error(i) = log(error(i)/error(i-1));
end