function C = combs_CHSH(v)

% O objetivo desta função é obter todas as combinações possíveis de um 
% vetor 'v' de QUATRO componentes.

    P=perms(v);
    
    % Extrai todas as permutas possíveis de v e as coloca em uma matriz
    % de tamanho 24x4.

    a=0;
    
    % Conta o número de permutas IGUAIS.
    % factorial(4)=24
    
    for i=1: factorial(4)
        
        v1=[P(i,1),P(i,2),P(i,3),P(i,4)];
        
        % Transforma a linha i de P em um vetor de quatro componentes.
        
        k=i+1;
        
        % Comparo o vetor da linha i sempre com os demais das linhas
        % ABAIXO, por isso k=i+1.
        
        for j=k: factorial(4)
            
            v2=[P(j,1),P(j,2),P(j,3),P(j,4)];
            
            % v2 é o vetor das linhas abaixo de i.
        
            if v1==v2
                P(j,1)=0;
                a=a+1;
                
                % Caso dois vetores iguais sejam encontrados, marco o
                % elemento da primeira coluna de P correspondente e
                % incremento o contador a.
            end
        end
    end

    C=zeros(factorial(4)-a,4);
    
    % factorial(4)-a é o número de combinações encontradas! Assim, monto
    % uma matriz C para acomodar todas as combinações
    
    k=1;    
    for i=1: factorial(4)
        
        v1=[P(i,1),P(i,2),P(i,3),P(i,4)];
        if v1(1)~=0
            C(k,1)=v1(1);
            C(k,2)=v1(2);
            C(k,3)=v1(3);
            C(k,4)=v1(4);
            k=k+1;
        end   
    end
    
    % Este último bloco simplesmente acomoda as combinações distintas na
    % nova matriz C. Lembre que o indicador de que uma combinção é repetida
    % foi definido acima quando zerei o elemento da primeira coluna de P
    % cuja linha corresponde a uma combinação repetida. Assim, se v1(1)
    % diferente de zero, então a combinação da linha i é distinta das
    % demais.

    C=transpose(C);
    
    % Para os fins que eu preciso, é necessário que a matriz resposta seja
    % transposta para usá-la no programa 'Correlatores_biartido_v1.m'.
    
end