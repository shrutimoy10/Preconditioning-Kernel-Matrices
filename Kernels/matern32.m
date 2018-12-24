%implementation of the Matern-3/2 kernel
classdef matern32 < kernel
    properties
        ls;
        var;
        noise;
    end
    methods
        %constructor
        function obj = matern32(ls,var,noise)
            obj.ls = ls;
            obj.var = var;
            obj.noise = noise;
        end
        
        %GP Matern-3/2 kernel definition
        function kern = K(obj,X1,X2)
            pairwise_dists = pdist2(X1,X2)/obj.ls;
            kern = obj.var*(double(1)+ sqrt(double(3))* pairwise_dists) * exp(-sqrt(double(3)) * pairwise_dists);
        end
    end
end