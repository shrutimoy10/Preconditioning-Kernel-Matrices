% superclass for classes of Kernel functions
classdef kernel
    methods
        function obj = kernel(obj)
        end
        function kern = K(obj,X1,X2)
        end
        function K_scalar(X1,X2,original_dimensions)
        end
    end
end