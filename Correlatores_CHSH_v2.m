clear

% Este programa constroi a matriz dos correlatores para o caso bipartido.
% Para melhor entendimento sugiro que rode o programa antes para visualizar
% o formato desta matriz.

C=zeros(8,16);

% Para o caso bipartido, a matriz é 8x16. A parte difícil do programa é
% determinar as quatro últimas linhas. As quatro primeiras, são apenas o
% produto entre elementos das quatro últimas, como definido no último bloco
% deste programas.

k=0;
for i=5: 8
    c=2^k;
    for j=1: 16
        if c>=1
            C(i,j)=1;
        else
            C(i,j)=-1;
        end
        c=c-1;
        if c<=-2^k
           c=2^k;
        end
    end
    k=k+1;
end

% Nesta versão 2 do programa, o código é mais simples. Ao invés de dividir
% as quatro linhas inferiores em blocos, eu simplesmente as preencho todas
% de uma vez notando que existe um padrão entre os 1's e -1's que pode ser
% utilizado para facilitar o trabalho. A lógica desta estrofe de programa-
% ção é a mesma que usei em 'Pontos_determinísticos.m', substituindo o 0
% por -1. Na quinta linha, preencho os elementos alternando entre 1 e -1
% com período 1. Na sexta alterno com período 2. Na sétima com período 4
% e na oitava com período 8. Veja que o período é dado por 2^k, onde k
% incrementa uma unidade a cada linha que desço.

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

C=transpose(C);

dlmwrite('Correlatores_CHSH.txt',C,'\t')