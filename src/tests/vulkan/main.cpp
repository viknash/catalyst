#include "PrecompiledHeader.h"

int main()
{
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