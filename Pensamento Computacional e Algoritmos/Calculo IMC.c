#include <stdio.h>

int main(void) {
    float peso, altura, imc;
    
printf("Peso em kg: ") ; 
scanf("%f", &peso);
printf("Altura: ");
scanf("%f", &altura);

imc = peso / (altura*altura);

printf("Seu imc é: %.2f\n", imc);

if (imc < 18.5) {
    printf("Você está abaixo do peso!\n");
} else if (imc >= 18.5 && imc < 24.9) {
    printf("Você está com o peso ideal!\n");
} else if (imc >= 25.0 && imc < 29.9) {
    printf("Você está com sobrepeso!");
} else if (imc >= 30.0 && imc < 34.9) {
    printf("Você está com obesidade grau 1!");
} else {
    printf("Você está com obesidade grau 2!");
}
    
    
    return 0;
}
