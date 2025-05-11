%% f, Q Lorentzian fit 

function [f_res,Q] = fQ_Lorentzian(data,frequency_range,plotting)
    


    [f_res0,Q0] = fQ_3dB_method(data, frequency_range, 2, 21,0)

    if Q0 == 0 
        Q0 = 5; 
    end

    if Q0 > 50
        N = 200;
    else  
        N = 300; 
    end
    [value,index] = min(abs(f_res0-frequency_range));
    absolute_data = abs(data);

    x = frequency_range(index-N:index+N); 
    y = absolute_data(index-N:index+N);

    model = @(params, f) params(1)+params(2)*f+(max(y)+params(3)*f)./sqrt(1+4*((f-params(4))/params(5)).^2); 
  
    initialGuess = [min(absolute_data), 1, 1, 1*f_res0/1e6, 1*f_res0/(Q0*1e6)];

    % Perform the curve fitting using lsqcurvefit.

    options = optimset('TolX', 1e-50,'MaxIter',1e5);
    paramsFit = lsqcurvefit(model, initialGuess, x/1e6, y,[],[],options);
        
    f_res = paramsFit(4);
    Q = f_res/paramsFit(5);

    if plotting == 1
        figure()
        plot(x/1e6,y,'linewidth',2)
        hold on 
        plot(x/1e6,model(paramsFit,x/1e6),'linewidth',2)
        grid on 
        xlabel('frequency, f [MHz]')
        ylabel('S_{21} ')
        set(gca,'fontsize',16)
    end
    
end