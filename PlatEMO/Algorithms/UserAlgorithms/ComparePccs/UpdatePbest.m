function Pbest = UpdatePbest(Pbest,Population)
% Update the local best position of each particle

%------------------------------- Reference --------------------------------
% W. Hu and G. G. Yen, "Adaptive Multiobjective Particle Swarm Optimization " 
% + ... "Based on Parallel Cell Coordinate System," in IEEE Transactions on 
% Evolutionary Computation, vol. 19, no. 1, pp. 1-18, Feb. 2015, doi: 10.1109/
% TEVC.2013.2296151.
%--------------------------------------------------------------------------

    replace        = ~all(Population.objs>=Pbest.objs,2);
    Pbest(replace) = Population(replace);
end