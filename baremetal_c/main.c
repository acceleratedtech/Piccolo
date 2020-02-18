#include "util.h"
#include "tagging_macros.h"

#define HEAP_START 0x88000000

void *malloc_ptr = (void*) HEAP_START;

void *malloc(int size) {
    void *ret = malloc_ptr;
    malloc_ptr = (void*) (size + (int) malloc_ptr);
    return ret;
}

int main(int argc, char* argv[]) {
    const char* world_string = "world";

    int* tags = malloc(4 * sizeof(int));
    tags[0] = -1;

    printf("Hello, %s!\n", world_string);

    int x = 42;

    printf("&tags[0] = 0x%x\n", (int) &tags[0]);

    printf("Hello, %s!\n", world_string);
    printf("x = %d\n", x);

    LOAD_TAG(x, &tags[0]);
    STORE_TAG(x, &tags[1]);

    printf("Hello, %s!\n", world_string);
    printf("x = %d\n", x);

    LOAD_TAG(x, &tags[1]);
    STORE_TAG(x, &tags[2]);

    printf("Hello, %s!\n", world_string);
    printf("x = %d\n", x);

    printf("tags:\n");
    for (int i = 0 ; i < 3 ; i++) {
        printf("    tag[%d] = 0x%x\n", i, tags[i]);
    }

    // this raises an exception
    int* p = (int*) 0x80000007;
    return *p;

    // return 0;
}
