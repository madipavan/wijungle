#include <iostream>
#include<string>
#include<Windows.h>


extern "C" {

    __declspec(dllexport) const char*  get_ram_usage()
{
    MEMORYSTATUSEX memoryinfo;
    memoryinfo.dwLength = sizeof(MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&memoryinfo);
    double memoryLoadString = memoryinfo.dwMemoryLoad;
    std::string result = "" + std::to_string(memoryLoadString);

    
    return _strdup(result.c_str());
}

    __declspec(dllexport) const char* get_cpu_usage() {
        FILETIME idleTime, kernelTime, userTime;
        static FILETIME prevIdleTime = {0}, prevKernelTime = {0}, prevUserTime = {0};

        // Get the current system times
        if (!GetSystemTimes(&idleTime, &kernelTime, &userTime)) {
            return _strdup("Error retrieving system times");
        }

        // Convert FILETIME to ULONGLONG
        ULONGLONG idle = (static_cast<ULONGLONG>(idleTime.dwLowDateTime) |
                          (static_cast<ULONGLONG>(idleTime.dwHighDateTime) << 32)) -
                          (static_cast<ULONGLONG>(prevIdleTime.dwLowDateTime) |
                           (static_cast<ULONGLONG>(prevIdleTime.dwHighDateTime) << 32));
        ULONGLONG kernel = (static_cast<ULONGLONG>(kernelTime.dwLowDateTime) |
                            (static_cast<ULONGLONG>(kernelTime.dwHighDateTime) << 32)) -
                            (static_cast<ULONGLONG>(prevKernelTime.dwLowDateTime) |
                             (static_cast<ULONGLONG>(prevKernelTime.dwHighDateTime) << 32));
        ULONGLONG user = (static_cast<ULONGLONG>(userTime.dwLowDateTime) |
                          (static_cast<ULONGLONG>(userTime.dwHighDateTime) << 32)) -
                          (static_cast<ULONGLONG>(prevUserTime.dwLowDateTime) |
                           (static_cast<ULONGLONG>(prevUserTime.dwHighDateTime) << 32));

        // Update previous times
        prevIdleTime = idleTime;
        prevKernelTime = kernelTime;
        prevUserTime = userTime;

        // Calculate CPU usage
        ULONGLONG total = kernel + user;
        ULONGLONG totalDelta = total - idle;
        double cpuUsage = (total > 0) ? (static_cast<double>(totalDelta) * 100.0 / total) : 0.0;

        // Create result string
        std::string result = "" + std::to_string(cpuUsage);

        // Return a duplicated string
        return _strdup(result.c_str());
    }

    __declspec(dllexport) void free_string(const char* str) {
        free((void*)str); // Free the memory allocated for the string
    }
}
