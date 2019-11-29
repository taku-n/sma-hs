#include <Rts.h>

void hs_begin()
{
    int argc = 1;
    char *argv[] = {"ghcDll", NULL};

    char **args = argv;
    hs_init(&argc, &args);
}

void hs_end()
{
    hs_exit();
}
