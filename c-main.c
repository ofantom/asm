#include <stdio.h>
extern void veymRet(char* text);
char text[5] = "nelej";

int main () {
    printf("%s\n",text);
    veymRet(text);
    printf("%s\n", text);
    return 0;
}
