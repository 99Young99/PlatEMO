function varargout = calc_pccs(obj)
% calculate the density  proposed by "Adaptive Multiobjective Particle Swarm Optimization Based on Parallel Cell Coordinate System"

%------------------------------- Reference --------------------------------
% W. Hu and G. G. Yen, "Adaptive Multiobjective Particle Swarm Optimization " 
% + ... "Based on Parallel Cell Coordinate System," in IEEE Transactions on 
% Evolutionary Computation, vol. 19, no. 1, pp. 1-18, Feb. 2015, doi: 10.1109/
% TEVC.2013.2296151.
%--------------------------------------------------------------------------


    K = size(obj,1); % K 个非支配解
    fmax = max(obj); % m 个目标解的最大值
    fmin = min(obj); % m 个目标解的最小值
    L = ceil(K * (obj-fmin)./(fmax-fmin)); % 对每个目标进行归一化,ceil 进行四舍五入
    L(L==0) = L(L==0) + 1; % 对于 0 的情况，设置 L 为 1
    PCD = pdist2(L,L,'cityblock');  % 计算 L 之间的绝对值距离或曼哈顿距离
    PCD(logical(eye(K))) = []; % 去掉斜对角线上与自身的距离值
    PCD = reshape(PCD,K-1,K)'; % 得到每个非支配解与 其他非支配解的距离，每个非支配解对应一行
    PCD(PCD==0) = PCD(PCD==0) + 0.5; % 避免除 0 的情况，设置为 0.5
    density = sum(1./PCD.^2,2); % % 计算每个粒子的密度，其受周围粒子的影响
    varargout = {density}; % 输出
end