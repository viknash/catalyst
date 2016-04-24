#include "PrecompiledHeader.h"
/*
static void my_init_hook(void);
static void *my_malloc_hook(size_t, const void *);
static void my_free_hook(void*, const void *);
static void *my_realloc_hook(void *ptr, size_t size, const void *caller);
static void *my_memalign_hook(size_t alignment, size_t size, const void *caller);

void(*__malloc_initialize_hook) (void) = my_init_hook;

void*(*old_malloc_hook)(size_t, const void *) = nullptr;
void(*old_free_hook)(void*, const void *) = nullptr;

static void
my_init_hook(void)
{
    old_malloc_hook = __malloc_hook;
    old_free_hook = __free_hook;
    __malloc_hook = my_malloc_hook;
    __free_hook = my_free_hook;
    //__memalign_hook = my_realloc_hook;
    //__realloc_hook = my_memalign_hook;
}

static void *
my_malloc_hook(size_t size, const void *caller)
{
    void *result;
    __malloc_hook = old_malloc_hook;
    __free_hook = old_free_hook;
    result = malloc(size);
    old_malloc_hook = __malloc_hook;
    old_free_hook = __free_hook;
    printf("malloc (%u) returns %p\n", (unsigned int)size, result);
    __malloc_hook = my_malloc_hook;
    __free_hook = my_free_hook;
    return result;
}

static void
my_free_hook(void *ptr, const void *caller)
{
    __malloc_hook = old_malloc_hook;
    __free_hook = old_free_hook;
    free(ptr);
    old_malloc_hook = __malloc_hook;
    old_free_hook = __free_hook;
    printf("freed pointer %p\n", ptr);
    __malloc_hook = my_malloc_hook;
    __free_hook = my_free_hook;
}

static void*
my_realloc_hook(void *ptr, size_t size, const void *caller)
{
    return nullptr;
}
static void*
my_memalign_hook(size_t alignment, size_t size, const void *caller)
{
    return nullptr;
}
*/
void* operator new(size_t size)
{
    return malloc(size);
}

void operator delete(void *p) throw()
{
    free(p);
}

void *operator new(size_t size, const std::nothrow_t &) throw()
{
    return malloc(size);
}

void operator delete(void *p, const std::nothrow_t &) throw()
{
    free(p);
}

void *operator new[](size_t size)
{
    return malloc(size);
}

void operator delete[](void *p) throw()
{
    free(p);
}

void *operator new[](size_t size, const std::nothrow_t &) throw()
{
    return malloc(size);
}

void operator delete[](void *p, const std::nothrow_t &) throw()
{
    free(p);
}