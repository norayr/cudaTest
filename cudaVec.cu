

__global__ void cuda_Vec_Add(float* A, float* B, float* C)
{
    int i = threadIdx.x;
    C[i] = A[i] + B[i];
}

void cudaVecAdd(int threads, float* a, float* b, float* c)
{
cuda_Vec_Add<<<1, threads>>>(a, b, c);
}
