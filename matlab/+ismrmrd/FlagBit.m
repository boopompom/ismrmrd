classdef FlagBit

    properties
        bitmask = uint64(0);
    end
    
    methods
        function fb = FlagBit(b)
            if ~(b>0)
                error('b must be positive');
            else
                fb.bitmask_ = bitshift(uint16(1),(b-1));
            end
        end % FlagBit
    end
    
    methods
        
        function obj = set.bitmask(obj,b)
            obj.bitmask = uint64(b);
        end % bitmask_ set function
        
        function b = isSet(obj,m)
            if (bitand(obj.bitmask, uint64(m))>0)
                b = true;
            else
                b = false;
            end
        end % isSet
    end
    
end % classdef