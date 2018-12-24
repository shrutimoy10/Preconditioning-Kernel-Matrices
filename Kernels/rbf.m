%implementation of RBF kernel
classdef rbf < kernel
    properties
        ls;
        var;
        jitter = 1e-9;
        noise
    end
    methods
        function obj = rbf(ls,var,noise)
            obj.ls = ls;
            obj.var = var;
            %obj.jitter = 1e-9;
            obj.noise = noise/obj.var + obj.jitter;
            %disp(['ls : ',num2str(ls),'var : ',num2str(var),'noise : ',num2str(noise)]);
        end
        
        %RBF kernel definition
        function kern = K(obj,X1,X2)
            pairwise_dists = pdist2(X1,X2);
            kern = obj.var*exp(-0.5*(pairwise_dists.^2)/obj.ls^2);
        end
        
        %RBF kernel scalar definition
        function kern_scalar= K_scalar(obj,X1,X2,original_dimensions)
            pairwise_dists = pdist2(X1,X2);
            kern_scalar = (obj.var^(float(1)/original_dimensions)) * exp(-0.5*pairwise_dists.^2 / obj.ls ^2);
        end
    end
end