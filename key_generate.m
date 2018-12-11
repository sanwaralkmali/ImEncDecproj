function [key] = key_generate(n)
n = n*8;   % *8 in case we have Large Image 
bin_x = zeros(n,1,'uint8');
r = 13;  
bin_x_N_Minus_1 =  .4;     % random numbers
x_N = 0;

for i = 2 : n
    x_N = 1 - 2* bin_x_N_Minus_1 * bin_x_N_Minus_1;    
     if (x_N > 0.0)
        bin_x(i-1) = 1;
    end 
     bin_x_N_Minus_1 =  x_N;
     
end

% save bin_sec bin_x;
t = uint8(0);
key = zeros(n/8,1,'uint8');
for j = 1 : n/8
    
    for k = 1 : 8
    key(j) = key(j) + bin_x(k*j)* 2 ^ (k-1);
    end
      
end