# Código em MatLab para interpolar os valores da vazão amortecida.

## AUTOR: GUSTAVO SIEBRA

1. ENTRAR NA PLANILHA: https://bit.ly/2Ztea2S

2. O ARQUIVO **baseDeDados1.txt** DEVE CONTER AS SEGUINTES INFORMAÇÕES: __**COLUNA X - AJ (COM SEPARADOR)**__

3. O ARQUIVO **baseDeDados2.txt** DEVE CONTER AS SEGUINTES INFORMAÇÕES: __**COLUNA Q - S (COM SEPARADOR)**__

4. COM ESSAS INFORMAÇÕES O NÚMEROS PRECISAM ESTAR SALVOS NO PADRÃO AMERICANO (NA DISMA USA PONTO E PARA SEPARAR USA VIRGULA). EXEMPLO: **10.4, 2.7, 4.3**

5. FEITO ISSO, ABRA O ARQUIVO **interpolacao.m** NO MATLAB E EXECUTE O CÓDIGO. 

6. AS VARIÁVEIS **vazaoSaida (O)**, **vazaoNegativa ((2S/Δt)-O)** E **vazaoPositiva ((2S/Δt)+O)** RETORNAM 6 COLUNAS EM (m³/s):
 <ul><li> coluna 1: vazão da saída de 1 orifício + vertedor</ul></li>
 <ul><li> coluna 2: vazão da saída de 2 orifícios + vertedor</ul></li>
 <ul><li> coluna 3: vazão da saída de 4 orifícios + vertedor</ul></li>
 <ul><li> coluna 4: vazão da saída de 6 orifícios + vertedor</ul></li>
 <ul><li> coluna 5: vazão da saída de 8 orifícios + vertedor</ul></li>
 <ul><li> coluna 6: vazão da saída de 10 orifícios + vertedor</ul></li>

--

## Contato: gustavosiebra@gmail.com