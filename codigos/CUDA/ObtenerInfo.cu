#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>

// Imprime las propiedades del dispositivo.
void printDevProp(cudaDeviceProp devProp) {
    printf("  Nombre del GPU:                %s\n",  devProp.name);
    printf("  Memoria global:                %.0f MBytes (%llu bytes)\n",
      (float)devProp.totalGlobalMem/1048576.0f, (unsigned long long) devProp.totalGlobalMem);
    printf("  Numero de multiprocesadores:   %d\n",  devProp.multiProcessorCount);
    return;
}

// Programa principal.
int main() {
    // Numero de dispositivos CUDA.
    int devCount;
    cudaGetDeviceCount(&devCount);
    printf("Test NVIDIA CUDA...\n");
    printf("Existe %d GPU NVIDIA CUDA.\n", devCount);

    // Mostrar propiedades de todos los dispositivos.
    for (int i = 0; i < devCount; ++i) {
        // Obtener propiedades del dispositivos.
        printf("\nDispositivo CUDA #%d\n", i+1);
        cudaDeviceProp devProp;
        cudaGetDeviceProperties(&devProp, i);
        printDevProp(devProp);
    }

    return 0;
}
