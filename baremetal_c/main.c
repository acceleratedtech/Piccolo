#include "util.h"
#include "tagging_macros.h"

int main(int argc, char* argv[]) {
    const char* world_string = "world";
    printf("Hello, %s!\n", world_string);

    // this raises an exception
    int* p = (int*) 0x80000007;
    return *p;

    // return 0;
}
