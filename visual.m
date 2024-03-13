%plot delle soluzioni del metodo iterativo
A=[0.3,0;0,0.5];
b=[1;5];
x_1=linspace(-20,20,100);
x_2=linspace(-20,20,100);

n=size(x_1,2);
z=zeros(n,n);

cont_1=0;
cont_2=0;

for i=x_1
  cont_1=cont_1+1;
  cont_2=0;
  for j=x_2
    cont_2=cont_2+1;
    z(cont_1,cont_2)=0.5*[i,j]*A*[i;j]-[i,j]*b;
  end
end

surf(x_1,x_2,z)
hold on 

x_0=[0;0];
[x,iter,x_k]=myjacobi_personal(A,b,x_0,100,1e-10);
plot(x_k,'-g')

q_x_0=x_0'*A*x_0-x_0'*b;
ris=[q_x_0];
aux=0;
for i=1:length(x_k)
  aux=0.5*(x_k(i)')*A*(x_k(i))-(x_k(i)')*b;
  ris=[ris,aux];
end
plot(linspace(1,length(ris),1),ris,'*-r')

