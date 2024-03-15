function [xnew,iter,ris]=myjacobi_personal(A,b,x0,nmax,toll)
xnew=zeros(size(x0));
xold=x0;
D=diag(diag(A));
iter=0;
ris=[];
err=toll+1; % condizione per entare sicuramente nel ciclo
% criterio di arresto sull'errore 
% criterio d'arresto basato sulla differenza fra due iterazioni
while(iter < nmax && err > toll)
    iter=iter+1;
    % risolvo il sistema diagonale per si
    xnew=D\((D-A)*xold+b);
    ris=[ris,xnew];
    % criteri
    err=norm(b-A*xnew)/norm(b);
    % aggiorno iterazione
    xold=xnew;
end
