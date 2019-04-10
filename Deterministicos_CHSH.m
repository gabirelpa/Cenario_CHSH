clear

m1=2; % Definindo as medidas m e os resultados n das partes 1 e 2
n1=2;
m2=2;
n2=2;

D1=deter(m1,n1); % Cria as matrizes determinísticas para o cenário
D2=deter(m2,n2); % "monopartido".

d1=size(D1); % Vetor 1x2 com o tamanho da matriz no argumento
d2=size(D2);

D=zeros(d1(1,1)*d2(1,1),d1(1,2)*d2(1,2));

% Para obter a matriz determinística do cenário bipartido bastaria
% tomarmos o produto tensorial entre as matrizes do cenário sem partições,
% entretanto a interpretação dos resultados é mais difícil usando apenas
% a função 'kron' do MATLAB.
%   A ideia é reimplementar o produto tensorial de tal maneira que a matriz
% resultante tenha uma interpretação mais facilitada dos resultados, então
% veja que 'D' tem o mesmo tamanho que 'kron(D1,D2)'

k=1; % 'k' é o índice das colunas da matriz resultante.

for lambda1=1: d1(1,2)
    for lambda2=1: d2(1,2)
        
        % Os lambdas são os índices coluna das matrizes de entrada.
        
        l=1; % 'l' é o índice das linhas da matriz resultante.
        
        for x=1: m1
            for y=1: m2
                
                % Aqui eu poderia fazer com que x e y rodassem até d1(1,1)
                % e d2(1,1), respectivamente e ignorar os dois 'fors'
                % abaixo. Entretanto, isso seria a implementação exata da
                % função 'kron'. 
                %   Esse programa apenas muda a ordem na qual eu leio as
                % matrizes da entrada. Primeiro mantenho fixo as medidas
                % (que aqui estou atribuindo os índices x e y) e depois
                % rodo sobre os resultados a e b.
                
                for a=1: n1
                    for b=1: n2
                        
                        D(l,k)=D1((x-1)*n1+a,lambda1)*D2((y-1)*n2+b,lambda2);
                        
                        % Veja que eu rodo livremente sobre as colunas das
                        % matrizes de entrada, mas sobre as linhas eu
                        % mantenho a restrição já mencionada de que as
                        % medidas x e y estão fixas.
                        %   Por exemplo, '(x-1)*n1+a' garante que nor 'for'
                        % da variável 'a' eu esteja olhando apenas para um
                        % 'x' fixo.
                        
                        l=l+1;
                    end
                end
            end
        end
        k=k+1;
    end
end

display(D);