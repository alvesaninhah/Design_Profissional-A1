#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h> 

// Estrutura para as métricas
typedef struct {
    long long steps_cmp, steps_swap; 
} Metrics;

// Funções de ordenação

// Reset métricas 
void reset_metrics(Metrics *m) {
    m->steps_cmp = 0;
    m->steps_swap = 0;
}

// Bubble Sort
void bubble_sort(int *v, size_t n, Metrics *m) {
    for (size_t i = 0; i < n - 1; i++) {
        for (size_t j = 0; j < n - 1 - i; j++) {
            m->steps_cmp++;
            if (v[j] > v[j + 1]) {
                int temp = v[j];
                v[j] = v[j + 1];
                v[j + 1] = temp;
                m->steps_swap++;
            }
        }
    }
}

// Insertion Sort
void insertion_sort(int *v, size_t n, Metrics *m) {
    for (size_t i = 1; i < n; i++) {
        int key = v[i];
        size_t j = i - 1;
        m->steps_cmp++;
        while (j >= 0 && v[j] > key) {
            v[j + 1] = v[j];
            j--;
            m->steps_swap++;
            m->steps_cmp++;
        }
        v[j + 1] = key;
    }
}

// Quick Sort
void quick_sort(int *v, size_t n, Metrics *m) {
    if (n <= 1) return;

    int pivot = v[n / 2];
    size_t i = 0, j = n - 1;
    while (i <= j) {
        while (v[i] < pivot) { i++; m->steps_cmp++; }
        while (v[j] > pivot) { j--; m->steps_cmp++; }

        if (i <= j) {
            int temp = v[i];
            v[i] = v[j];
            v[j] = temp;
            m->steps_swap++;
            i++;
            j--;
        }
    }

    if (j > 0) quick_sort(v, j + 1, m);
    if (i < n) quick_sort(v + i, n - i, m);
}

double run_sort(void (*sort_fn)(int*, size_t, Metrics*), int *v, size_t n, Metrics *m) {
    reset_metrics(m);
    clock_t t0 = clock();
    sort_fn(v, n, m);
    clock_t t1 = clock();
    return 1000.0 * (t1 - t0) / CLOCKS_PER_SEC; 
}

// Função para gerar vetores aleatórios
void generate_random_array(int *v, size_t n) {
    printf("Gerando vetor aleatório para N = %zu...\n", n); 
    for (size_t i = 0; i < n; i++) {
        v[i] = rand() % 1000;  // Vetor com números aleatórios de 0 a 999
    }
    // Debug: Mostrar os primeiros 10 valores para conferir
    for (size_t i = 0; i < (n < 10 ? n : 10); i++) {
        printf("%d ", v[i]);
    }
    printf("\n");
}

int main() {
    int rgm[] = {4, 4, 7, 5, 3, 0, 7, 1};  
    size_t rgm_len = sizeof(rgm) / sizeof(rgm[0]);

    Metrics m_bubble, m_insertion, m_quick;
    int v_bubble[rgm_len], v_insertion[rgm_len], v_quick[rgm_len];

    // Ordenação do RGM
    printf("RGM: ");
    for (size_t i = 0; i < rgm_len; i++) {
        printf("%d ", rgm[i]);
    }
    printf("\n");

    // Teste Bubble Sort
    for (size_t i = 0; i < rgm_len; i++) v_bubble[i] = rgm[i];
    double time_bubble = run_sort(bubble_sort, v_bubble, rgm_len, &m_bubble);
    printf("Bubble Sort: Passos = %lld, Trocas = %lld, Tempo = %.3f ms\n", m_bubble.steps_cmp, m_bubble.steps_swap, time_bubble);

    // Teste Insertion Sort
    for (size_t i = 0; i < rgm_len; i++) v_insertion[i] = rgm[i];
    double time_insertion = run_sort(insertion_sort, v_insertion, rgm_len, &m_insertion);
    printf("Insertion Sort: Passos = %lld, Trocas = %lld, Tempo = %.3f ms\n", m_insertion.steps_cmp, m_insertion.steps_swap, time_insertion);

    // Teste Quick Sort
    for (size_t i = 0; i < rgm_len; i++) v_quick[i] = rgm[i];
    double time_quick = run_sort(quick_sort, v_quick, rgm_len, &m_quick);
    printf("Quick Sort: Passos = %lld, Trocas = %lld, Tempo = %.3f ms\n", m_quick.steps_cmp, m_quick.steps_swap, time_quick);


    for (size_t n = 100; n <= 10000; n *= 10) {
        int random_arr[n];
        generate_random_array(random_arr, n);


        printf("\nBenchmark para N = %zu:\n", n);

        // Bubble Sort
        for (size_t i = 0; i < n; i++) v_bubble[i] = random_arr[i];
        double time_bubble = run_sort(bubble_sort, v_bubble, n, &m_bubble);
        printf("Bubble Sort: Passos = %lld, Trocas = %lld, Tempo = %.3f ms\n", m_bubble.steps_cmp, m_bubble.steps_swap, time_bubble);

        // Insertion Sort
        for (size_t i = 0; i < n; i++) v_insertion[i] = random_arr[i];
        double time_insertion = run_sort(insertion_sort, v_insertion, n, &m_insertion);
        printf("Insertion Sort: Passos = %lld, Trocas = %lld, Tempo = %.3f ms\n", m_insertion.steps_cmp, m_insertion.steps_swap, time_insertion);

        // Quick Sort
        for (size_t i = 0; i < n; i++) v_quick[i] = random_arr[i];
        double time_quick = run_sort(quick_sort, v_quick, n, &m_quick);
        printf("Quick Sort: Passos = %lld, Trocas = %lld, Tempo = %.3f ms\n", m_quick.steps_cmp, m_quick.steps_swap, time_quick);
    }

    return 0;
}

