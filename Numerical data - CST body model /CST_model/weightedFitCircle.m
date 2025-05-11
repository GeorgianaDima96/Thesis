function [CXCYout, Rout, RMSE, exitFlag] = ...
    weightedFitCircle(Xin, Yin, Win, opts)
%weightedFitCircle Fits a circle to a list of datapoints X, Y, and weights 
% W using fminsearch with specifiable options.  Initial parameters are 
% obtained using SVD (SVD approach inspired by
% https://people.cas.uab.edu/~mosya/cl/TaubinSVD.m).
%   Returns 
%      CXCYout:  XY of circle center
%      Rout:     Radius of circle
%      RMS:      Orthogonal, weighted, root mean squared error
%      exitFlag: Exit condition of fit
%
%   Example code showing that fitting is very fast and accurate.
% 
% X = 1./rand(1, 6); Y = 1./rand(1, 6); W = rand(1, 6);
% tic
% [CXCYout, Rout, RMSE] = ...
%     weightedFitCircle(X, Y, W, optimset('Display', 'Iter')); 
% toc
% disp(['(X,Y,R) = ', num2str([CXCYout, Rout])])
% disp(['RMSE    = ', num2str(RMSE)])
% plot(CXCYout(1) + Rout*cos(0:0.00001:2.001*pi), ...
%     CXCYout(2) + Rout*sin(0:0.00001:2.001*pi), '--k')
% hold on
% scatter(X, Y, W/max(W)*75, 'r')
% axis equal


%% Clean, store, and check the inputs

switch nargin
    case 0
        error 'Not enough inputs'
    case 1
        error 'Not enough inputs'
    case 2
        [X, Y] = prepareCurveData(Xin, Yin);
        W = ones(size(X));
        opts = optimset('fminsearch');
    case 3
        [X, Y, W] = prepareCurveData(Xin, Yin, Win);
        opts = optimset('fminsearch');
    case 4
        if isempty(Win)
            [X, Y] = prepareCurveData(Xin, Yin);
            W = ones(size(X));
        else
            [X, Y, W] = prepareCurveData(Xin, Yin, Win);
        end
    otherwise
        error 'Too many inputs'
end

% Define fit RMSE by computing the distances from each point to the
% center of the circle, subtracting the radius, squaring the difference,
% weighting, averaging, and square rooting
errorFunction = @(CXCYR) ...
    sqrt(sum(((sqrt(...
    (CXCYR(1) - X).^2 + (CXCYR(2) - Y).^2) - CXCYR(3)).^2) .* W)...
    ./sum(W));


%% First, perform a fast but unweighted fit using SVD

% Center the data
mu = mean([X, Y]);
X = X - mu(1);
Y = Y - mu(2);

% Generate matrix
XY = X .* X + Y .* Y;
mu(3) = mean(XY);

% Pefrom SVD
[~, ~, V] = svd([(XY - mu(3))/(2 * sqrt(mu(3))), X, Y], 0);
V(1,3) = V(1,3)/(2 * sqrt(mu(3)));
A = [V(:,3); -mu(3) * V(1,3)];

% Calculate circle center and radius
CXCYSVD = [mu(1) - A(2)/(2 * A(1)), mu(2) - A(3)/(2 * A(1))];
RSVD = sqrt(A(2) * A(2) + A(3) * A(3) - 4 * A(1) * A(4))/(2 * abs(A(1)));


%% Second, tighten the fit using slower and weighted iterative optimization

[CXCYRout, RMSE, exitFlag] = fminsearch(...
    errorFunction, [CXCYSVD, RSVD], opts);
CXCYout = CXCYRout(1:2);
Rout = CXCYRout(3);

end