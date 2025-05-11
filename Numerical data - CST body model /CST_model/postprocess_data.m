clear all

T = readtable('table_results.xlsx');

r_range = [50,100,150,200]; 
x_range = [0]
count = 1

figure 

for count_x = 1:numel(x_range)
    
    for count_r = 1:numel(r_range)

    idx = T.r == r_range(count_r) & T.f == 50 & T.x == x_range(count_x) & T.sigma ~= 0;
    idx_0 = T.r == r_range(count_r) & T.f == 50 & T.x == x_range(count_x) & T.sigma == 0;
    new_table = T(idx,:);
    new_table_0 = T(idx_0,:);

    subplot(1,2,count)
    plot(new_table.sigma,abs(new_table.f_res)/new_table_0.f_res*100,linewidth = 2,marker = 'o')
    hold on 
    grid on 
    xlim([min(new_table.sigma) max(new_table.sigma)])
    xticks([0.2802,0.52,0.7,0.9])
    ylabel(['$ f_\mathrm{res}/f_0 \ [\%]$'],interpreter = 'latex',fontsize = 16)
    xlabel('$\sigma$ [S/m]',interpreter ='latex',fontsize = 16)
    title('$(a)$',interpreter='latex',fontsize = 16)
set(gca,'fontsize',16)

    subplot(1,2,count+1)
    plot(new_table.sigma,abs(new_table.Q)/new_table_0.Q*100,linewidth = 2,marker = 'o')
    hold on 
    grid on 
    xlim([min(new_table.sigma) max(new_table.sigma)])
    ylabel('$Q/Q_0 \ [\%]$',interpreter = 'latex',fontsize = 16)
    xlabel('$\sigma$ [S/m]',interpreter ='latex',fontsize = 16)
    xticks([0.2802,0.52,0.7,0.9])
        title('$(b)$',interpreter='latex',fontsize = 16)
    set(gca,'fontsize',16)
    end
    count = count+2
end


legend({'$r_0 = 50$ mm', '$r_0 = 100$ mm', '$r_0 = 150$ mm','$r_0 = 200$ mm'},interpreter = 'latex',fontsize = 14)


