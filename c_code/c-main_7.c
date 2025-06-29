#include <stdio.h>
//#include <math.h>
//#include <string.h>


extern void prvocisla( int *pole, int N, int P);
int pole[10] = {1,2,3,4,5,6,7,8,9,10}; // [rdi + 8]  rdi
int N = 10;
int P = 10;
// add rdi, 4           это адрес первого елемента масива (то есть 10 (второй елемент масива))
// add [rdi], 4         это операция с содержимим (10(второй елемент масива) + 4)
int main () {

    prvocisla(pole, N, P);
    // printf("%d ", pole[0]);

    for (int i = 0; i < 10; i++) {
        printf("%d\n", pole[i]);
    }
    printf("\n");
    return 0;
}