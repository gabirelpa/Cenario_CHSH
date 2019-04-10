clear

% Este programa constroi a matriz dos correlatores para o caso bipartido.
% Para melhor entendimento sugiro que rode o programa antes para visualizar
% o formato desta matriz.

C=zeros(8,16);

% Para o caso bipartido, a matriz é 8x16. A parte difícil do programa é
% determinar as quatro últimas linhas. As quatro primeiras, são apenas o
% produto entre elementos das quatro últimas, como definido no último bloco
% deste programas.

for i=5: 8
    C(i,1)=-1;
    C(i,16)=1;
end

% Veja que aqui estou preenchendo apenas as 4 últimas linhas. Para
% facilitar, dividi as 4 últimas linhas em 5 blocos: dois blocos 4x1, dois
% blocos 4x4 e um bloco 4x6. Cada bloco é preenchido com todas as
% combinações possíveis de um vetor de quatro componentes. Os dois blocos
% 4x1 possuem todas as componentes iguais, logo há uma única combinação
% possível. Neste primeiro for (acima) simplesmente preencho estes dois
% blocos 4x1, já que sei de antemão seus respectivos valores: [1,1,1,1] e
% [-1,-1,-1,-1].

C1=combs_CHSH([-1,-1,-1,1]);
r=1;
for i=5: 8
    s=1;
   for j=2: 5
       C(i,j)=C1(r,s);
       s=s+1;
   end
   r=r+1;   
end

% Nesta estrofe do programa eu gero a matriz que contém todas as
% combinações do vetor [-1,-1,-1,1] usando a função combs_bi() e então
% encaixo esta matriz no seu lugar correspondente. O lugar no qual eu
% posiciono a matriz C1 nas quatro últimas linhas de C não é importante.
% Apenas devo me atentar para não posicionar C1 em elementos já previamente
% preenchidos.

C1=combs_CHSH([-1,-1,1,1]);
r=1;
for i=5: 8
    s=1;
   for j=6: 11
       C(i,j)=C1(r,s);
       s=s+1;
   end
   r=r+1;   
end

% Idem a estrofe anterior, mas agora usando o vetor [-1,-1,1,1], que possui
% seis combinações distintas.

C1=combs_CHSH([-1,1,1,1]);
r=1;
for i=5: 8
    s=1;
   for j=12: 15
       C(i,j)=C1(r,s);
       s=s+1;
   end
   r=r+1;   
end

% Idem a estrofe anterior, mas agora usando o vetor [-1,1,1,1], que possui
% quatro combinações distintas.

r=7;
s=5;
for i=1: 4
    
    if r==9
        r=7;
        s=s+1;
    end
    
    for j=1: 16
        C(i,j)=C(s,j)*C(r,j);
    end
    r=r+1;
end

% Aqui simplesmente estou preenchendo as quatro linhas superiores. O
% elemento de cada uma destas linhas será o produto dos elementos de duas
% das quatro linhas inferiores. Na primeira linha, faço o produto da quinta
% com a sétima, na segunda, da quinta com a oitava, na terceira, faço o
% produto da sexta com a sétima e na quarta linha, tomo o produto da sexta
% com a oitava.

disp(C);