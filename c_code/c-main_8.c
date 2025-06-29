#include <stdio.h>

extern void merge_and_extend();
extern void decode();

char g_char2[2] = { 0xCA, 0xFE };
short g_short_merged;
int g_extended;

int enc_string = 0x53415050; // 'PAPS\0'
char g_decoded[5];

int main() {
    merge_and_extend();
    printf("Variables g_short_merged=%d, g_extended=%#010x\n", g_short_merged, g_extended);

    decode();
    printf("decode: %s\n", g_decoded);

    return 0;
}