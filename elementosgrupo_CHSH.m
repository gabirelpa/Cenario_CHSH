function A = elementosgrupo_CHSH

% A ideia aqui é estender o conjunto de matrizes geradoras e efetivamente
% gerar todos os elementos do grupo. Isso é feito multiplicando cada
% conjunto possível das matrizes geradoras e em todas as ordens possíveis.

Perm=zeros(1);

% Todas as permutas possíveis de elementos do grupo ficarão armazenados
% nesta matriz. Como podemos multiplicar no máximo 7 geradores por vez,
% então a matriz 'Perm' tem 7 colunas. Cada linha possui uma permuta
% diferente. Se um elemento é obtido multiplicando-se apenas três geradores
% então os outros quatro elementos restantes da linha permanecerão nulos,
% por exemplo.

r=1;
for i=1: 7
    c=combnk(1:7,i);
    
    % Calcula todas as combinações de 'i' entre 7 elementos e salva na
    % matriz c.
    
    dimc=size(c);
    
    for j=1: dimc(1,1)
        for k=1: dimc(1,2)
            v_aux(k)=c(j,k);
            
            % Aqui estou decompondo cada linha da matriz 'c' resultante em
            % um vetor auxiliar.
            
        end
        p=perms(v_aux);     
        
        % Agora calculo todas as permutações possíveis do vetor 'c' e
        % armazeno na matriz 'p'.
        
        dimp=size(p);
        
        for l=1: dimp(1,1)
            s=1;
            for k=1: dimp(1,2)
                Perm(r,s)=p(l,k);
                
                % Cada elemento da matriz 'p' é salvo na matriz 'Perm'. l e
                % k são os índices linha e coluna da matriz 'p'. r e s são
                % os índices linha e coluna da matriz 'Perm'. Note as
                % posições em que r e s são iniciados iguais a 1 e onde
                % eles são incrementados. Dessa maneira, todas as permutas
                % de todas as combinações possíveis de multiplicações das
                % matrizes geradoras ficam salvas na matriz 'Perm'.
                
                s=s+1;
            end
            r=r+1;
        end
    end  
end

G=geradoras_CHSH;

% Evocando a função das matrizes geradoras.

A=table(G{1:8,1});

% Criando uma tabela apenas com a matriz identidade.

dimPerm=size(Perm);
ind2=0;
for i=1: dimPerm(1,1)
    G_aux=G{1:8,Perm(i,1)+1}*G{1:8,Perm(i,2)+1}*G{1:8,Perm(i,3)+1}*G{1:8,Perm(i,4)+1}*G{1:8,Perm(i,5)+1}*G{1:8,Perm(i,6)+1}*G{1:8,Perm(i,7)+1};
    
    % Lembrar que 'Perm' me dá a receita de todas as combinações e permutas
    % possíveis das matrizes geradoras. Em 'G_aux' efetivamente estou
    % calculando estas combinações. Notar que G{1:8,1} me fornece a
    % identidade e G{1:8,i+1} me fornece a matriz Gi.
    
    dimA=size(A);
    ind1=0;
    for j=1: dimA(1,2)
        if isequal(G_aux,A{1:8,j})
            ind1=ind1+1;
        end
        
        % Aqui, estou comparando o elemento G_aux que acabei de calcular
        % com os elementos salvos na tabela A. Se G_aux já possui um
        % elemento idêntico em A então o indicador ind1 é incrementado. 
        
    end
    if ind1==0
        G_tab=table(G_aux);
        A(1:8,ind2+2)=G_tab;
        ind2=ind2+1;
        
        % Se ind1 for nulo, significa que NÃO há nenhum elemento idêntico a
        % G_aux em A. Então salvo G_aux em A e incremento ind2. Repare que
        % ind2 no final me dá o número de elementos distintos do grupo e
        % que todos eles estarão salvos na tabela A.
        
    end
end

end    