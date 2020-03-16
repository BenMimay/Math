function b = bgcd(a,n)
%
%   This program is the binary gcd algorithm.
%   It follows the method laid out in the Handbook of Applied Cryptography
%   by Menezes et al
%
%   Input: Two integers, not both zero. Negative integers will be
%          be converted to positive integers
%
%   Output: The greatest common divisor of a and n.
%
%   Author: Ben Mimay (C) March 2018
%

if ( a == 0 && n == 0)
    fprintf(' Undefined: a, n cannot both be zero \n')
    return; 
end

if ( a < 0 || n < 0 )
        a = abs(a);
        n = abs(n);
end

g = 1;
% are a, n both even?
while mod(a,2) == 0 && mod(n,2) == 0                
    % a = a/2
    a = bitshift(a,-1,'int64');         
    n = bitshift(n,-1,'int64');
    % g = g*2
    g = bitshift(g,1,'int64');                      
end

if n == 0
    b = g*a;
    return;
    
else
    u = a;
    v = n;
    A = 1;
    B = 0;
    C = 0;
    D = 1;

end

while u ~= 0

    while mod(u,2) == 0
        
		u = bitshift(u,-1,'int64');          
        
        if mod(A,2) == 0 
            A = bitshift(A,-1,'int64');
        else
            A = bitshift(A+n,-1,'int64');
        end
        
        if mod(B,2) == 0
            B = bitshift(B,-1,'int64');     
        else
            B = bitshift(B-a,-1,'int64');
        end
	
    end
    
    while mod(v,2) == 0
       
        v = bitshift(v,-1,'int64');     
    
        if mod(C,2) == 0 
            C = bitshift(C,-1,'int64');
        else
            C = bitshift(C+n,-1,'int64');
        end
        
        if mod(D,2) == 0
            D = bitshift(D,-1,'int64');
        else
            D = bitshift(D-a,-1,'int64');
        end
    end

    if u >= v
	    u = u-v;
        A = A-C;
        B = B-D;
	else 
	    v = v-u;
        C = C-A;
        D = D-B;
    end
end
    x = C;
    n = D;
    % restore factors of 2
    b = g*v;                                        
    
end