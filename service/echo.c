/* service/echo.c */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>    //strlen
#include<unistd.h>    //write

int main()
{
    char buf[256];
    while (1)
    {
        scanf("%s", buf);
        printf("%s\n", buf);
        fflush(stdout);
    }
    return 0;
}
