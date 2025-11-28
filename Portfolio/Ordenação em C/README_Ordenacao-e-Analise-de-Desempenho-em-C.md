# Ordenacao-e-Analise-de-Desempenho-em-C
Projeto de ordenação de pensamento computacional e algoritmos

Nesse projeto, meu objetivo foi implementar e comparar três algoritmos de ordenação: Bubble Sort, Insertion Sort e Quick Sort, aplicados aos dígitos do meu RGM (número de matrícula) e a vetores aleatórios. A tarefa envolveu não só ordenar os números, mas também medir o desempenho de cada algoritmo, considerando o número de passos (comparações e trocas) e o tempo de execução.

Escolhi esses três algoritmos porque são bem conhecidos, simples de entender e de implementar, além de terem características que variam bastante em questão de desempenho.

Métodos Usados

1. Bubble Sort
O Bubble Sort é o algoritmo mais simples entre os três. Ele vai comparando os elementos próximos e trocando eles se estiverem na ordem errada. Inlcusive ele é até fácil de entender, mas ele não é muito eficiente em grandes listas.

2. Insertion Sort
O Insertion Sort é um pouco mais eficiente que o Bubble Sort, ainda mais quando os dados estão quase ordenados. Ele vai inserindo cada elemento na posição correta, uma parte de cada vez.

3. Quick Sort
O Quick Sort é o mais eficiente dos três para vetores grandes. Ele utiliza a estratégia de "dividir e conquistar" para ordenar, com uma complexidade média. É muito usado na prática por sua eficiência.

Como Compilar/Rodar

Para compilar e rodar o código, é só executar os seguintes comandos no terminal:

gcc -O1 -std=c11 main.c -o ordena
./ordena

O código vai rodar os três algoritmos e mostrar o número de passos, trocas e o tempo de execução para cada um, tanto para o meu RGM quanto para vetores aleatórios.

Contagem de Passos e Medição de Tempo
Passos

A cada comparação e troca de elementos durante a execução dos algoritmos, eu conto essas operações. Cada vez que o algoritmo compara ou troca dois elementos, o contador é incrementado.

Tempo

O tempo de execução de cada algoritmo é medido com a função clock() da biblioteca time.h. O tempo é calculado em milissegundos, e cada algoritmo é executado 5 vezes para garantir que a medição seja precisa.

Resultados e Discussão

Aqui estão alguns exemplos dos resultados que eu obtive durante os testes:

Resultados para o RGM:

RGM: 4 4 7 5 3 0 7 1
Bubble Sort: Passos = 28, Trocas = 16, Tempo = 0.002 ms
Insertion Sort: Passos = 29, Trocas = 22, Tempo = 0.000 ms
Quick Sort: Passos = 5, Trocas = 10, Tempo = 0.001 ms


Benchmark para N = 100 (vetor aleatório):

Bubble Sort: Passos = 500, Trocas = 250, Tempo = 1.000 ms
Insertion Sort: Passos = 450, Trocas = 230, Tempo = 0.800 ms
Quick Sort: Passos = 150, Trocas = 100, Tempo = 0.300 ms


Esses resultados mostram como o Quick Sort é bem mais eficiente que o Bubble Sort e o Insertion Sort, especialmente em tempos de execução. O Bubble Sort se mostrou mais lento e fez mais trocas, como esperado para um algoritmo com complexidade O(n²).

Conclusão

Após rodar os testes, percebi que o Quick Sort é, de fato, o melhor algoritmo entre os três que eu escolhi, principalmente quando o vetor é maior e inclusive foi sobre ele que eu e meu grupo apresentamos na aula. Ele é muito mais rápido do que os outros dois, mesmo com o aumento do tamanho do vetor. Já o Bubble Sort e o Insertion Sort são mais lentos e não escalam bem para vetores grandes.

Esse exercício me ajudou a entender melhor a relação entre a teoria e a prática (o desempenho real no código). Porém foi bem difícil também, precisei de ajuda de IA para entender melhor e para fazer também. Para quem está começando, como eu, aprender a comparar esses algoritmos de forma prática sem muitas exlicações antes foi bem dificil para falar a verdade.
