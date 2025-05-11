%%%% -3dB extraction


function [f_res,Q] = fQ_3dB_method(data,frequency_range,filter_order,filter_window,plotting)

    S_dB = 20 * log10(data);

    N_smooth = 10000;
    frequency_range_smooth = linspace(min(frequency_range), max(frequency_range), N_smooth);
    S_dB_smooth = sgolayfilt(S_dB, filter_order, filter_window);
    
    f = interp1(frequency_range, S_dB_smooth, frequency_range_smooth, 'pchip'); % 'pchip' interpolation
    S_dB_smooth = f;
    
    % Find the maximum after interpolation
    [value_min_smooth, index_min_smooth] = min(S_dB_smooth);
    f_res = frequency_range_smooth(index_min_smooth);
    upper_smooth = 0; 
    lower_smooth = 0;
    % Q factor for smoothed data
    for index_2 = 1:(N_smooth - 2)
        if S_dB_smooth(index_2) - value_min_smooth > 3 && S_dB_smooth(index_2 + 1) - value_min_smooth < 3 && index_2 < index_min_smooth
            lower_smooth = index_2;
        end
        if S_dB_smooth(index_2) - value_min_smooth < 3 && S_dB_smooth(index_2 + 1) - value_min_smooth > 3 && index_2 > index_min_smooth
            upper_smooth = index_2;
        end
    end

    if upper_smooth == 0 || lower_smooth == 0 
        Q = 0; 
        print('ALERT')
    else 
        f_1_smooth = frequency_range_smooth(lower_smooth);
        f_2_smooth = frequency_range_smooth(upper_smooth);
        Q = f_res/ abs(f_2_smooth - f_1_smooth);
    end
    
    if Q<20
        N_smooth = 10000;
        frequency_range_smooth = linspace(min(frequency_range), max(frequency_range), N_smooth);
        S_dB_smooth = sgolayfilt(S_dB, 1, 35);
    
        f = interp1(frequency_range, S_dB_smooth, frequency_range_smooth, 'pchip'); % 'pchip' interpolation
        S_dB_smooth = f;
    
        % Find the maximum after interpolation
        [value_min_smooth, index_min_smooth] = min(S_dB_smooth);
        f_res = frequency_range_smooth(index_min_smooth);
        upper_smooth = 0; 
        lower_smooth = 0;
        % Q factor for smoothed data
        for index_2 = 1:(N_smooth - 2)
            if S_dB_smooth(index_2) - value_min_smooth > 3 && S_dB_smooth(index_2 + 1) - value_min_smooth < 3 && index_2 < index_min_smooth
                lower_smooth = index_2;
            end
            if S_dB_smooth(index_2) - value_min_smooth < 3 && S_dB_smooth(index_2 + 1) - value_min_smooth > 3 && index_2 > index_min_smooth
            upper_smooth = index_2;
            end
        end

        if upper_smooth == 0 || lower_smooth == 0 
            Q = 0; 
            print('ALERT')
        else 
            f_1_smooth = frequency_range_smooth(lower_smooth);
            f_2_smooth = frequency_range_smooth(upper_smooth);
            Q = f_res/ abs(f_2_smooth - f_1_smooth);
        end
    end
    if plotting == 1
        figure()
        plot(frequency_range/1e6,S_dB,'linewidth',2)
        hold on 
        plot(frequency_range_smooth/1e6,S_dB_smooth,'linewidth',2)
        grid on 
        xlabel('frequency, f [MHz]')
        ylabel('S_{21} [dB]')
        set(gca,'fontsize',16)
    end
    

end