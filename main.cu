#include <iostream>
#include <cuda_runtime.h>
#include <cuda.h>
#include <thrust/sort.h>
#include <thrust/execution_policy.h>

//typedef unsigned _int64 uint64_t




int main(){

 
    uint64_t key[5] = {234,5938,23,94,55};
    int index[5] = {0,1,2,3,4}; 
    
    uint64_t* key_d;
    int* index_d;
    cudaMalloc((void**)&key_d,sizeof(uint64_t)*5);
    cudaMalloc((void**)&index_d,sizeof(int)*5);
    cudaMemcpy(key_d,key,sizeof(uint64_t)*5,cudaMemcpyHostToDevice);
    cudaMemcpy(index_d,index,sizeof(int)*5,cudaMemcpyHostToDevice);

    thrust::sort_by_key(thrust::device,key_d,key_d+5,index_d);   

    
    cudaFree(key_d);
    cudaFree(index_d);



}
