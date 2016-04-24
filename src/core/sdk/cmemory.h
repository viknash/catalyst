#include <new>
#include <cstddef>

void* operator new(size_t size);
void  operator delete(void *p) throw();
void* operator new(size_t size, const std::nothrow_t &) throw();
void  operator delete(void *p, const std::nothrow_t &) throw();
void* operator new[](size_t size);
void  operator delete[](void *p) throw();
void* operator new[](size_t size, const std::nothrow_t &) throw();
void  operator delete[](void *p, const std::nothrow_t &) throw();