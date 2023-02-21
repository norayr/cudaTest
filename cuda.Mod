MODULE cuda;

IMPORT SYSTEM;

TYPE
  Dev* = LONGINT;

  devMsg* = RECORD
  END;


PROCEDURE -AincludecudaRuntime '#include <cuda_runtime.h>';

PROCEDURE -getDevCount(dcnt: Dev) 
"cudaGetDeviceCount(&dcnt)";

PROCEDURE getDeviceCount*(): Dev;
VAR
  cnt: Dev;
BEGIN
  getDevCount(cnt);
  RETURN cnt;
END getDeviceCount;

PROCEDURE -dimG(nBlocks: INTEGER)
"dim3 dimGrid(nBlocks)";

PROCEDURE -dimB(nThreads: INTEGER)
"dim3 dimBlock(nThreads)";

PROCEDURE initBlocks*(n: INTEGER);
BEGIN
  dimG(n)
END initBlocks;

PROCEDURE initThreads*(n: INTEGER);
BEGIN
  dimB(n);
END initThreads;

(*PROCEDURE -getMaxGflops(): Dev
"gpuGetMaxGflopsDeviceId()";

PROCEDURE getMostPowerfulDevice*(): Dev;
BEGIN
  RETURN getMaxGflops()
END getMostPowerfulDevice; 
*)
END cuda.
