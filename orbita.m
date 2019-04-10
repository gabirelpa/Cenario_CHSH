function orb = orbita(v,A) 

% Esta função calcula a órbita de um vetor em relação ao grupo dado. Para
% tal, ela recebe de entrada o vetor 'v' e os elementos do grupo
% armazenados numa tabela 'A'.

orb=table(v);

% Crio uma tabela com o vetor o qual desejo calcular a órbita.

dimA=size(A);

ind2=0;
for i=1: dimA(1,2)
    v_aux=v*A{1:8,i};
    
    % Aqui aplico um elemento i do grupo 'A' no vetor original e armazeno o
    % resultado em v_aux.
    
    dimorb=size(orb);
    ind1=0;
    for j=1: dimorb(1,2)
        if isequal(v_aux,orb{1,j})
            ind1=ind1+1;
        end
        
        % Se v_aux já possui um elemento idêntico em orb então o indicador 
        % ind1 é incrementado. 
                
    end
    if ind1==0
        orb_tab=table(v_aux);
        orb(1,ind2+2)=orb_tab;
        ind2=ind2+1;
        
        % Apenas se ind1 é nulo, v_aux é armazenado em orb. O indicador
        % ind2 serve para que os índices da tabela orb não sejam
        % descontínuos. No final, ind2 contém o número de elementos da
        % órbita de v e orb contém todos os vetores da órbita de v.
        
    end
end

end