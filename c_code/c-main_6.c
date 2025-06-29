#include <stdio.h>
#include <math.h>
#include <string.h>


extern void bubble( int *pole, int N, int asc_desc);
int pole[ 10 ] = {-20, 10, -10, 18, -8, 30, -2, 45, 3, 56}; // [rdi + 8]  rdi
int N = 10;
int asc_desc = 1;
// add rdi, 4           это адрес первого елемента масива (то есть 10 (второй елемент масива))
// add [rdi], 4         это операция с содержимим (10(второй елемент масива) + 4)
int main () {

    bubble(pole, N, asc_desc);


    for (int i = 0; i < N; i++) {
        printf("%d ", pole[i]);
    }
    printf("\n");
    return 0;
}


