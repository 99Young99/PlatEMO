classdef MOPSOPCCS < ALGORITHM
% <multi> <real> <large/none> <sparse>
% Adaptive Multiobjective Particle Swarm Optimization Based on Parallel Cell Coordinate System

%------------------------------- Reference --------------------------------
% W. Hu and G. G. Yen, "Adaptive Multiobjective Particle Swarm Optimization " 
% + ... "Based on Parallel Cell Coordinate System," in IEEE Transactions on 
% Evolutionary Computation, vol. 19, no. 1, pp. 1-18, Feb. 2015, doi: 10.1109/
% TEVC.2013.2296151.
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)

            addpath("D:\Code\PlatEMO\PlatEMO\UserAlgorithms\PCCS");
            %% Generate random population
            Population       = Problem.Initialization(); % 初始化种群
            Pbest            = Population;  % 初始话 Pbest
            [Gbest, CrowdDis, density]  = PCCS(Population,Problem.N);

            %% Optimization
            while Algorithm.NotTerminated(Gbest)
                Population       = Operator(Problem,Population,Pbest,Gbest(TournamentSelection(2,Problem.N, density))); % 这里应该是，尽可能选择小的 density 交叉变异产生子代
                [Gbest, CrowdDis, density] = PCCS([Gbest,Population],Problem.N); % 利用 PCCS 进行 Gbest 选择
                Pbest            = UpdatePbest(Pbest,Population);
            end
        end
    end
end








