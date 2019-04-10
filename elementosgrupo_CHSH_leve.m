function A = elementosgrupo_CHSH_leve

Comb=zeros(1);

r=1;
for i=1: 7
    c=combnk(1:7,i);
    dimc=size(c);
                      
        for l=1: dimc(1,1)
            s=1;
            for k=1: dimc(1,2)
                Comb(r,s)=c(l,k);
                s=s+1;
            end
            r=r+1;
        end
end

G=geradoras_CHSH;

A=table(G{1:8,1});

dimComb=size(Comb);

for i=1: dimComb(1,1)
    G_aux=G{1:8,Comb(i,1)+1}*G{1:8,Comb(i,2)+1}*G{1:8,Comb(i,3)+1}*G{1:8,Comb(i,4)+1}*G{1:8,Comb(i,5)+1}*G{1:8,Comb(i,6)+1}*G{1:8,Comb(i,7)+1};
    G_tab=table(G_aux);
    A(1:8,i+1)=G_tab;        
end

end
