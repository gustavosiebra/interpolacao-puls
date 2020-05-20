%%
% AUTOR: GUSTAVO SIEBRA
% DATA: 12/10/2019
% LOCAL: FORTALEZA
% 
% ESSAS INFORMACOES ESTAO NO ARQUIVO TCC-RESULTADOS 
% NAS SHEETS RESERVATORIOS
%
% O ARQUIVO baseDeDados1.txt DEVE CONTER AS SEGUINTES INFORMA��ES:
% 
% COLUNA X - AJ (COM SEPARADOR)
% 
% O ARQUIVO baseDeDados2.txt DEVE CONTER AS SEGUINTES INFORMA��ES:
% 
% COLUNA Q: HIDROGRAMA DE ENTRADA (i)
% COLUNA R: SEPARADOR (VIRGULA)
% COLUNA S: i1 + i2 (m3/s)
% 
% COM ESSAS INFORMA��ES O N�MEROS PRECISAM ESTAR SALVOS NO PADR�O AMERICANO:
% EXEMPLO: 10.4, 2.7, 4.3
% 
% NA DISMA USA PONTO E PARA SEPARAR USA VIRGULA.

%%
clc
clear all
close all

%% Carregando arquivo
%data0 = load('baseDeDados0.txt');
data1 = load('baseDeDados1.txt');
data2 = load('baseDeDados2.txt');

%% Condi��es

%dataset0 = data0;
dataset1 = data1;
dataset2 = data2;

%[linha0, col0] = size(data0);
[linha1, col1] = size(data1);
[linha2, col2] = size(data2);

vazaoPositivaAntes(1,1) = 0; %(2s/deltaT) + O
vazaoNegativaAntes(1,1) = 0; %(2s/deltaT) - O

% resultado do amortecimento
vazaoPositiva(1,1:6) = 0;
vazaoNegativa(1,1:6) = 0;
vazaoSaida(1,1:6) = 0;

g = 1;

%%
for a=2:col1
    j = 3;
    vazaoPositiva(2,g) = dataset2(1,2) + vazaoNegativa(1,g); 
    
    for i=2:linha1
        vazaoPositivaAntes(i,1) = dataset1(i,1) + dataset1(i,a);
        vazaoNegativaAntes(i,1) = dataset1(i,1) - dataset1(i,a);
    end
    
    for i=2:linha2
        m = 0;
        k = 1;
        while(m == 0)
            if (vazaoPositivaAntes(k,1) <= vazaoPositiva(i,g) && vazaoPositivaAntes(k+1,1) >= vazaoPositiva(i,g))
                m1 = vazaoPositivaAntes(k,1);
                m2 = vazaoPositivaAntes(k+1,1);
                n1 = vazaoNegativaAntes(k,1);
                n2 = vazaoNegativaAntes(k+1,1);
                p1 = dataset1(k,a);
                p2 = dataset1(k+1,a);
                calculoVazaoNegativa = (n2*(m2-m1)-(n2-n1)*(m2-vazaoPositiva(i,g)))/(m2-m1);
                calculoVazaoSaida = (p2*(m2-m1)-(p2-p1)*(m2-vazaoPositiva(i,g)))/(m2-m1);
                m = 1;
            end
            k = k + 1;
        end
        vazaoNegativa(i,g) = calculoVazaoNegativa;
        vazaoSaida(i,g) = calculoVazaoSaida;
        vazaoPositiva(j,g) = dataset2(i,2) + vazaoNegativa(i,g);
        j = j+1;
    end
    g = g+1;
end