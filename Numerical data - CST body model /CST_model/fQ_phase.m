%% phase extraction 


function  [f,Q] = fQ_phase(data,frequency_range,plotting)
    

    [f_res0,Q0] = fQ_3dB_method(data, frequency_range, 2, 21,0)

    if Q0 > 50
        N = 20;
    else  
        N = 20; 
    end 

    [value,index] = min(abs(f_res0-frequency_range));
    
    frq_range = frequency_range(index-N:index+N); 
    x = real(data(index-N:index+N)); 
    y = imag(data(index-N:index+N));   
    xref = (x(1) + x(end)) / 2;
    yref = (y(1) + y(end)) / 2;
    
    % Calculate the distances and weights.
    weights = ((x-xref).^2+(y-yref).^2).^2;
    
    
    [a,b] =   weightedFitCircle(x,y,weights)
    theta = linspace(0, 2 * pi, 100);
    x_circle = b * cos(theta);
    y_circle = b * sin(theta);

    x_centered = x-a(1);
    y_centered = y-a(2);

    phase = unwrap(angle(x_centered+y_centered*i));


    model = @(params, f) params(1)+2*atan(2*params(2)*(1-f/params(3)))
    initialGuess = [0,Q0,f_res0/1e6];

    % Perform the curve fitting using lsqcurvefit.

    options = optimset('TolX', 1e-50,'MaxIter',1e5);
    paramsFit = lsqcurvefit(model, initialGuess,frq_range/1e6, phase,[],[],options);
    f = paramsFit(3);
    Q = paramsFit(2);
    
    if plotting == 1
        plot(frq_range/1e6,phase,'.',linewidth=2)
        hold on 
        plot(frq_range/1e6,model(paramsFit,frq_range/1e6))
    end


end