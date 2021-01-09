
function [sFeat,Sf,Nf,curve] = jSCA(feat,label,N,max_Iter,alpha,HO)
% Parameters
lb    = 0;
ub    = 1; 
thres = 0.5; 

% Objective function
fun = @jFitnessFunction;
% Number of dimensions
dim = size(feat,2); 
% Initial 
X   = zeros(N,dim);
for i = 1:N
	for d = 1:dim
    X(i,d) = lb + (ub - lb) * rand();
	end
end
% Pre
fitD = inf; 
fit  = zeros(1,N);

curve = inf; 
t = 1;
%---Iteration start---------------------------------------------------
while t <= max_Iter
  % Destination point
  for i = 1:N
    % Fitness
    fit(i) = fun(feat,label,(X(i,:) > thres),HO); 
    % Destination update
    if fit(i) < fitD
      fitD = fit(i); 
      Xdb  = X(i,:);
    end
  end
  
	% Parameter r1, decreases linearly from alpha to 0 
	r1 = alpha - t * (alpha / max_Iter);
  
	for i = 1:N
    for d = 1:dim
      % Random parameter r2 & r3 & r4
      r2 = (2 * pi) * rand(); 
      r3 = 2 * rand();
      r4 = rand();
      % Position update 
      if r4 < 0.5
      	% Sine update 
        X(i,d) = X(i,d) + r1 * sin(r2) * abs(r3 * Xdb(d) - X(i,d));
      else
        % Cosine update 
        X(i,d) = X(i,d) + r1 * cos(r2) * abs(r3 * Xdb(d) - X(i,d));
      end
    end
    % Boundary
    XB = X(i,:);  XB(XB < lb) = lb;  XB(XB > ub) = ub; 
    X(i,:) = XB;
  end
  curve(t) = fitD;
  fprintf('\nIteration %d Best (SCA)= %f',t,curve(t))
  t = t + 1;
end
% Selects features
Pos   = 1:dim;
Sf    = Pos((Xdb > thres) == 1); 
sFeat = feat(:,Sf);
Nf    = length(Sf);
end




