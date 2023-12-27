function [Gbest, CrowdDis, density] = useDistance(Gbest,N)
% Update the global best set

%------------------------------- Reference --------------------------------
% W. Hu and G. G. Yen, "Adaptive Multiobjective Particle Swarm Optimization " 
% + ... "Based on Parallel Cell Coordinate System," in IEEE Transactions on 
% Evolutionary Computation, vol. 19, no. 1, pp. 1-18, Feb. 2015, doi: 10.1109/
% TEVC.2013.2296151.
%--------------------------------------------------------------------------
    
%     s = Gbest.objs;
%     s = round(s, 2);
    Gbest    = Gbest(NDSort(Gbest.objs,1)==1);
%     Gbest = Gbest(NDSort(s, Gbest.cons, 1)==1);
%     s = Gbest.objs;
%     s = round(s, 2);
    CrowdDis = CrowdingDistance(Gbest.objs);

    density  = caculateDistance(Gbest.objs);
    
    [~,rank] = sort(density,'ascend');
    Gbest    = Gbest(rank(1:min(N,length(Gbest))));
    density = density(rank(1:min(N,length(Gbest))));
    CrowdDis = CrowdDis(rank(1:min(N,length(Gbest))));
end