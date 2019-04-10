function D = deter(m,n)

% Esta função apenas cria uma matriz de pontos determinísticos para o caso
% sem partições. Basicamente é uma repetição do programa 'Pontos_determi-
% nísticos.m' em forma de função.

% Lembrando que m é o número de medições por parte e n é o número de
% resultados por medição.

D=zeros(n*m,n^m);

    for p=1: n 
        for q=1: m
        
            if q==m            
                for i=(q-1)*n+p: (q-1)*n+p
                    for j=(p-1)*n^(m-1)+1: p*n^(m-1)
                        D(i,j)=1;            
                    end
                end
            
            else 
                c1=1;
        
                for i=(q-1)*n+1: q*n
                    c2=n^(q-1);
                
                    if c1~=1
                        c2=-(n-c1)*n^(q-1);
                    end
            
                for j=(p-1)*n^(m-1)+1: p*n^(m-1)
                
                    if c2>0
                        D(i,j)=1;
                    end
                
                    c2=c2-1;
                
                    if c2<-(n-1)*n^(q-1)+1
                    c2=n^(q-1);
                    end   
                end
            
                c1=c1+1; 
                end
            end
        end
    end
end