#include <stdio.h>
#include <math.h>

int pole[ 10 ] = {-20, 10, -10, 18, -8, 30, -2, 45, 3, 56};
int min_pos( int *t_pole, int t_N );


int main () {

    printf("%d\n", min_pos( pole, 10));

    return 0;
}
