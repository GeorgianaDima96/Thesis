function [Q,f_res] = get_Q(w,Z_param)

[value,pos] = min(Z_param);
w_res = w(pos); 
flag_lower = 0; 
flag_upper = 0; 
for count = 1:numel(Z_param)-1

    if Z_param(count) - value >3 && Z_param(count+1) - value <3
        lower = count; 
        flag_lower = 1; 
    end
    
    if Z_param(count) - value <3 && Z_param(count+1) - value >3
        upper = count; 
        flag_upper = 1; 
    end

end

if flag_upper == 0 
    upper = numel(Z_param); 
end

if flag_lower == 0 
    lower = 1; 
end

Q = w_res/(w(upper)-w(lower)); 
f_res = w_res;
end