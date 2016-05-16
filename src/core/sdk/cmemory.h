#include <new>
#include <cstddef>

#include <cds/memory/vyukov_queue_pool.h>
#include <cds/memory/pool_allocator.h>
#include <cds/memory/michael/allocator.h>

void* operator new(size_t size);
void  operator delete(void *p) throw();
void* operator new(size_t size, const std::nothrow_t &) throw();
void  operator delete(void *p, const std::nothrow_t &) throw();
void* operator new[](size_t size);
void  operator delete[](void *p) throw();
void* operator new[](size_t size, const std::nothrow_t &) throw();
void  operator delete[](void *p, const std::nothrow_t &) throw();

template <class T>
class Allocator
{
    typedef std::allocator<T>               std_allocator;
    typedef cds::memory::michael::Heap <
        cds::memory::michael::opt::aligned_heap< cds::memory::michael::aligned_malloc_heap >,
        cds::memory::michael::opt::page_heap< cds::memory::michael::page_cached_allocator<16, cds::memory::michael::malloc_heap> >
    > michael_heap;

    // Michael heap static object
    static michael_heap     s_Heap;
public:
    // Declare typedefs from std::allocator
    typedef typename std_allocator::const_pointer   const_pointer;
    typedef typename std_allocator::pointer         pointer;
    typedef typename std_allocator::const_reference const_reference;
    typedef typename std_allocator::reference       reference;
    typedef typename std_allocator::difference_type difference_type;
    typedef typename std_allocator::size_type       size_type;
    typedef typename std_allocator::value_type      value_type;

    friend void* operator new(size_t size);
    friend void operator delete(void *p) throw();
    friend void* operator new(size_t size, const std::nothrow_t &) throw();
    friend void operator delete(void *p, const std::nothrow_t &) throw();
    friend void *operator new[](size_t size);
    friend void operator delete[](void *p) throw();
    friend void* operator new[](size_t size, const std::nothrow_t &) throw();
    friend void operator delete[](void *p, const std::nothrow_t &) throw();

    // Allocation function
    pointer allocate(size_type _Count, const void* _Hint)
    {
        return reinterpret_cast<pointer>(s_Heap.alloc(sizeof(T) * _Count));
    }

    // Deallocation function
    void deallocate(pointer _Ptr, size_type _Count)
    {
        s_Heap.free(_Ptr);
    }

    // Rebinding allocator to other type
    template <class _Other>
    struct rebind {
        typedef Allocator<_Other> other;
    };
};