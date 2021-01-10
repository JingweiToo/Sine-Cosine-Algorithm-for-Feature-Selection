# Sine Cosine Algorithm for Feature Selection

[![View Sine Cosine Algorithm for Feature Selection on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/80671-sine-cosine-algorithm-for-feature-selection)
[![License](https://img.shields.io/badge/license-BSD_3-yellow.svg)](https://github.com/JingweiToo/Sine-Cosine-Algorithm-for-Feature-Selection/blob/main/LICENSE)
[![GitHub release](https://img.shields.io/badge/release-1.1-green.svg)](https://github.com/JingweiToo/Sine-Cosine-Algorithm-for-Feature-Selection)

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/101fa7c4-d84f-4473-abd1-ee0cfcdc165a/34f1f649-9e76-4e26-b0e8-15ade13bc5aa/images/1601790091.JPG)

## Introduction
* This toolbox offers a Sine Cosine Algorithm ( SCA ) method
* The `Main` file illustrates the example of how SCA can solve the feature selection problem using benchmark data-set.


## Input
* *`feat`*     : feature vector ( Instances *x* Features )
* *`label`*    : label vector ( Instances *x* 1 )
* *`N`*        : number of solutions
* *`max_Iter`* : maximum number of iterations
* *`alpha`*    : constant 

## Output
* *`sFeat`*    : selected features
* *`Sf`*       : selected feature index
* *`Nf`*       : number of selected features
* *`curve`*    : convergence curve


### Example
```code
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
```

## Requirement
* MATLAB 2014 or above
* Statistics and Machine Learning Toolbox

