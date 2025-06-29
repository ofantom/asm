#include <stdio.h>
#include <stdint.h>

long g_long_array[5] = { 255, 594, 11, 4, 321};

char g_char_array[99] = "fsadfasdfasdfsdfsdauifu7fhhvdsfui IO CUIRINVOLuhfighafoadf";
char g_to_replace = 'a';
char g_new = '0';

int g_ip_address = 0x0afe0a06;
int g_ip_mask = 0xffff0000;

int g_counter = 0;
long g_output = 0;

void petr(long *g_long_array, int *g_counter, long *g_output);
void zamena(char *array, char to_replace, char new_char);
void hostpart(int *ip, int *mask, uint8_t *outPut);

int main() {

    // printf("%d", sizeof(long));
    petr(g_long_array, &g_counter, &g_output);
    printf("Schetchik: %d\nSumma chetnih (delenih na 5): %ld\n", g_counter, g_output);

    zamena(g_char_array, g_to_replace, g_new);
    printf("Izmenennij text: %s\n", g_char_array);

    uint8_t result_ip[4];
    hostpart(&g_ip_address, &g_ip_mask, result_ip);

    printf("Часть выделеного айпи: %d.%d.%d.%d\n",
    result_ip[3], result_ip[2], result_ip[1], result_ip[0]);

    return 0;
}

