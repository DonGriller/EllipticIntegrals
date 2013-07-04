function [K,E] = ellipkeMod(m)

%% Notas

%Esta funcion es análoga a ellipke de Matlab, sin embargo se le ha retirado
%la validación de los datos de entrada para incremento de la velocidad
%y se a quitado la sigularidad.

%% Elliptic K and E
    classin = superiorfloat(m);
    tol = eps(classin);
    a0 = 1;
    b0 = sqrt(1-m);
    s0 = m;
    i1 = 0; mm = 1;
    while mm > tol
        a1 = (a0+b0)/2;
        b1 = sqrt(a0.*b0);
        c1 = (a0-b0)/2;
        i1 = i1 + 1;
        w1 = 2^i1*c1.^2;
        mm = max(w1(:));
        s0 = s0 + w1;
        a0 = a1;
        b0 = b1;
    end
    K = pi./(2*a1);
    E = K.*(1-s0/2);
    im = find(m ==1);
    if ~isempty(im)
        E(im) = ones(length(im),1);        
        K(im) = 9e9;%Singularity avoided        
    end
	

end

