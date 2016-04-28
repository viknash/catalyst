#include "PrecompiledHeader.h"
#include <reckless/severity_log.hpp>
#include <reckless/file_writer.hpp>



int main()
{
    using log_t = reckless::severity_log<
        reckless::indent<4>,       // 4 spaces of indent
        ' ',                       // Field separator
        reckless::severity_field,  // Show severity marker (D/I/W/E) first
        reckless::timestamp_field  // Then timestamp field
    >;

    reckless::file_writer writer("log.txt");
    log_t g_log(&writer);


    std::string s("Hello World!");
    g_log.debug("Pointer: %p", s.c_str());
    g_log.info("Info line: %s", s);
     for (int i = 0; i != 4; ++i) {
        reckless::scoped_indent indent;  // The indent object causes the lines
        g_log.warn("Warning: %d", i);  // within this scope to be indented
    }
    g_log.error("Error: %f", 3.14);

    vector<LayerProperties> layerProperties;
    ///*Result result = */enumerateInstanceLayerProperties(layerProperties);
    future<Result> fut = defer( 
        [&](yield_context yield)
    {
        this_thread::sleep_for(5s); return enumerateInstanceLayerProperties(layerProperties);
    }, use_future);
    fut.get();
    return 0;
}