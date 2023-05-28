#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>




int coinChange(int amount, int* coins, int coinsSize){
    int quantidade = 0;
   // bool isPossible = false;
    int maiorValor = 0;
    int menorValor = 1000;
    int maiorValorMarcado = 0;
    int espacoMaiorValor = 0;
    int total = 0;

    if(amount == 0){
        return 0;
    }


    // for(int i = 0; i<=coinsSize; i++){
        
    //     if((amount % coins[i]) == 0 ){
    //         isPossible = true;     
    //     }



    // }

    for(int i = 0; i <= coinsSize-1; i++){
        //printf("valor %d\n", coins[i]);

        if(coins[i] < menorValor){
            menorValor = coins[i];
            
        }

        if(coins[i] > maiorValor){
            maiorValor = coins[i];
            espacoMaiorValor = i;

        }
    
    }

    //OPCAO MAIS GULOSA

    // while(amount > 0){
    //     //printf("teste");

    //     // if(amount >= maiorValor ){
    //     //     quantidade++;
    //     //     amount = amount - maiorValor;
    //     // }

    //     for(int j = 0; j <= coinsSize-1; j++){
    //     //printf("valor %d\n", coins[i]);
    //         quantidade = amount / coins[j];
    //         amount = (quantidade * coins[j]) - amount;
    //         total = quantidade + total;
    
    //     }
        

    // }



    if((amount % menorValor) != 0){ //caso do troco menor que a possibilidade minima de moedas.
        return -1;
    }

    //OPCAO OTIMIZADA

     while(amount > 0){
        //printf("teste");

        // if(amount >= maiorValor ){
        //     quantidade++;
        //     amount = amount - maiorValor;
        // }

        for(int j = coinsSize-1; j >= 0; j--){
        //printf("valor %d\n", coins[i]);
            quantidade = amount / coins[j];
            amount = (quantidade * coins[j]) - amount;
            //printf("%dx moedas de valor %d\n", j,coins[j]);
            total = quantidade + total;
    
        }
        

    }


    

    //printf("menor valor: %d\n", menorValor);
    //printf("maior valor: %d\n", maiorValor);


  
   

    return total;

}


int main(){
    int vetor[] = {1, 2, 5};
    int amount = 20;
    int tamanho = sizeof(vetor) / sizeof(vetor[0]);
    int quantidadeMoedas = coinChange(amount, vetor, tamanho);
    
    //printf("array de tamanho %d\n", tamanho);
    printf("%d\n", quantidadeMoedas);
   // printf("%d\n", probabilidades);

}