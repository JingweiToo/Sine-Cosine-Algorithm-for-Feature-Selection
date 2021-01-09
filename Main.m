%---------------------------------------------------------------------%
%  Sine Cosine Algorithm (SCA) source codes demo version              %
%---------------------------------------------------------------------%


%---Inputs-----------------------------------------------------------
% feat     : feature vector ( Instances x Features )
% label    : label vector ( Instances x 1 )
% N        : Number of solutions
% max_Iter : Maximum number of iterations
% alpha    : Constant 

%---Output-----------------------------------------------------------
% sFeat    : Selected features (instances x features)
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Sine Cosine Algorithm
clc, clear, close; 
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho);

% Parameter setting
N        = 10;
max_Iter = 100; 
alpha    = 2;

% Sine Cosine Algorithm
[sFeat,Sf,Nf,curve] = jSCA(feat,label,N,max_Iter,alpha,HO);

% Plot convergence curve
plot(1:max_Iter,curve);
xlabel('Number of iterations');
ylabel('Fitness Value');
title('SCA'); grid on;




