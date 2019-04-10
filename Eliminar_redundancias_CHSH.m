clear

% Este programa recebe os dados armazenados na forma de uma matriz onde
% cada linha da matriz representa uma faceta (na forma de desigualdade) de
% um politopo de 8 dimensões. O objetivo é eliminar todos os politopos
% redundantes fisicamente em relação ao grupo A.

Data=importdata('Correlatores_CHSH.out');

% Leio os dados.

D=zeros(24,8);

for i=1: 24
    for j=1: 8
    D(i,j)=Data(i,j);    
    end
end

% Este laço serve unicamente para tirar a última coluna dos dados, que não
% é interessante.

A=elementosgrupo_CHSH_leve;

% Invoco a função que calcula todos os elementos do grupo de simetria dos
% correlatores bipartidos.

v=[D(1,1),D(1,2),D(1,3),D(1,4),D(1,5),D(1,6),D(1,7),D(1,8)];

% Crio um vetor com a primeira desigualdade fornecida pela matriz de dados.

orb=orbita(v,A);

% Calculo a órbita deste vetor com relação ao grupo A e armazeno esta
% órbita na tabela 'orb'.

desig=table(v);

% Como é a primeira desigualdade que estou analisando, armazeno ela na
% tabela 'desig' que é a tabela resposta com todas as desigualdades
% inequivalentes entre si.


ind2=0;
for i=2: 24
    v_aux=[D(i,1),D(i,2),D(i,3),D(i,4),D(i,5),D(i,6),D(i,7),D(i,8)];
    
    % Agora cada linha dos dados - começando pela segunda - é armazenada
    % num vetor auxiliar.
    
    dimorb=size(orb);
    ind1=0;
    for j=1: dimorb(1,2)
        if isequal(v_aux,orb{1,j})
            ind1=ind1+1;
        end
        
        % Se este vetor auxiliar já esta na tabela orb, então o indicador
        % ind1 é incrementado.
        
    end
    if ind1==0
        desig_tab=table(v_aux);
        desig(1,ind2+2)=desig_tab;
        orb_tab=orbita(v_aux,A);
        dimorb_tab=size(orb_tab);
        orb(1,dimorb(1,2)+1:dimorb(1,2)+dimorb_tab(1,2))=orb_tab;
        ind2=ind2+1;
        
        % Se ind1 é nulo, então a desigualdade da linha i é inequivalente
        % em relação as desigualdades armazenadas em orb. Logo, armazeno
        % esta nova desigualdade em 'desig' e calculo a órbita desta nova
        % desigualdade, armazenado-a em orb. Repare a sintaxe complicada
        % para armazenar uma tabela dentro de outra: deve-se ter em conta o
        % tamanho da tabela a ser armazenada.
        
    end
end

dimdesig=size(desig);
for i=1: dimdesig(1,2)
    disp(desig{1,i});
end

% Aqui printo as desigualdades inequivalentes encontradas.