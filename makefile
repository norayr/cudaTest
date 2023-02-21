export CFLAGS='-fPIC -I "/opt/voc/2/include" -L"/opt/voc/lib" -lvoc-O2 -L/usr/local/cuda-10.2/targets/aarch64-linux/lib/ -lcublas' 
export LDFLAGS='-L"/opt/voc/lib" -lvoc-O2 -L/usr/local/cuda-10.2/targets/aarch64-linux/lib/ -lcublas'
all:
	#nvcc -c cudafl.cu
	nvcc -c cudaVec.cu
	voc -sS cuda.Mod cudaArrays.Mod 
	voc -Sm test.Mod
	nvcc --compiler-options ${CFLAGS} -c cuda.c
	nvcc --compiler-options ${CFLAGS} -c cudaArrays.c
	#cp test.c test.cu
	#nvcc --compiler-options ${CFLAGS}  -c test.cu
	nvcc --compiler-options ${CFLAGS}  -c test.c
	nvcc -L. --compiler-options ${CFLAGS} --linker-options ${LDFLAGS} -o test test.o cudaArrays.o  cuda.o cudaVec.o
	#nvcc --include-path /opt/voc/2/include -L. -L/opt/voc/lib -lvoc-O2 -o test test.o cudaArrays.o  cuda.o cudaVec.o
