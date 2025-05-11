clear all

data = read_tables('body_model_data_full.txt')

range_data = [62 65 68 71];
for count = 1:numel(range_data)

    data_point = data{range_data(count)};
    Z11= data_point(:,2);

    [Q(count),f_res(count)] = fQ_3dB_method(Z11,data_point(:,1),2,11,1); 
end

