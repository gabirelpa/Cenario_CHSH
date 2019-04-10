function G = geradoras_CHSH

% Aqui simplesmente criaremos as matrizes geradores do grupo de simetria
% para o caso (2,2,2). Como a maior parte dos elementos destas matrizes
% começam em zero, preferi usar a função 'zeros' pra começar.

G0=eye(8);
G1=zeros(8,8);
G2=zeros(8,8);
G3=zeros(8,8);
G4=zeros(8,8);
G5=zeros(8,8);
G6=zeros(8,8);
G7=zeros(8,8);

% Criando as matrizes. Defini G0 como sendo a matriz identidade. G1 é a
% matriz que troca as etiquetas da Alice e Bob. G2 e G3 troca medição 0
% pela medição 1 para Alice e Bob, respectivamente. G4 à G7 trocam os
% resultados de cada medição e de cada parte e por isso são diagonais, pois
% como os resultados são apenas +1 ou -1, trocar o resultado implica apenas
% em mudar o sinal do elemento da diagonal.

G1(1,1)=1;
G1(3,2)=1;
G1(2,3)=1;
G1(4,4)=1;
G1(5,7)=1;
G1(6,8)=1;
G1(7,5)=1;
G1(8,6)=1;

G2(1,2)=1;
G2(2,1)=1;
G2(3,4)=1;
G2(4,3)=1;
G2(5,5)=1;
G2(6,6)=1;
G2(7,8)=1;
G2(8,7)=1;

G3(1,3)=1;
G3(3,1)=1;
G3(2,4)=1;
G3(4,2)=1;
G3(5,6)=1;
G3(6,5)=1;
G3(7,7)=1;
G3(8,8)=1;

% Para entender a localização de cada elemento acima, lembrar que cada 
% vetor está ordenado da seguinte maneira: v=[A0B0,A0B1,A1B0,A1B1,A0,A1,B0,
% B1].

for i=1: 8
    G4(i,i)=1;
    G5(i,i)=1;
    G6(i,i)=1;
    G7(i,i)=1;
end

G4(1,1)=-1;
G4(2,2)=-1;
G4(5,5)=-1;
G5(3,3)=-1;
G5(4,4)=-1;
G5(6,6)=-1;
G6(1,1)=-1;
G6(3,3)=-1;
G6(7,7)=-1;
G7(2,2)=-1;
G7(4,4)=-1;
G7(8,8)=-1;

G=table(G0,G1,G2,G3,G4,G5,G6,G7);

% Todas as oito matrizes geradoras do grupo ficam armazenadas na tabela G.

end