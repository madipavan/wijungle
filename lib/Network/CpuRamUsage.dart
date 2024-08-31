import 'dart:ffi';

import 'package:ffi/ffi.dart';

typedef GetMemoryLoadFunction = Pointer<Utf8> Function();
typedef FreeStringNative = Void Function(Pointer<Utf8>);
typedef FreeStringDart = void Function(Pointer<Utf8>);
typedef GetCpuUsageFunction = Pointer<Utf8> Function();

class Cpuramusage {
  //opening shared library
  final DynamicLibrary nativeAddLib = DynamicLibrary.open(
      "D:/android projects/wijungle/lib/Service/service.dll");

//fuction returning ram usage
  Future getRAMusage() async {
    final ram = nativeAddLib.lookupFunction<GetMemoryLoadFunction,
        GetMemoryLoadFunction>('get_ram_usage');
    final memoryLoadPointer = ram();
    final memoryLoad = memoryLoadPointer.toDartString();
    freeSpacedUsed(memoryLoadPointer);

    return memoryLoad;
  }

//fuction returning cpu usage
  Future getCPUusage() async {
    final cpu =
        nativeAddLib.lookupFunction<GetCpuUsageFunction, GetCpuUsageFunction>(
            'get_cpu_usage');
    final cpuLoadPointer = cpu();
    final cpuLoad = cpuLoadPointer.toDartString();
    freeSpacedUsed(cpuLoadPointer);
    return cpuLoad;
  }

//fuction to free up the memory Used to store data
  freeSpacedUsed(data) {
    final freeString = nativeAddLib
        .lookupFunction<FreeStringNative, FreeStringDart>('free_string');
    freeString(data);
  }
}
