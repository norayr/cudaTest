MODULE cudaArrays;

IMPORT SYSTEM;
(* in case we uncomment this function, we need to use 
(* voc -S to only generate the .c file but do not compile it *)
(* then when building test.c nvcc will give the error that <<< is not recognized  *) 
(* in order to get them recoginzed we need to rename test.c to test.cu *)
(* but then nvcc compiler does not understand other things, alas *)
PROCEDURE -Add*(threads: INTEGER; VAR a, b, c: ARRAY OF REAL)
"cuda_Vec_Add<<<1, threads>>>(a, b, c);";
*)


(* nvcc does not find cudaVecAdd, I did nm and I use real symbol from the .o file *)
PROCEDURE -add(threads: INTEGER; VAR a, b, c: ARRAY OF REAL)
"_Z10cudaVecAddiPfS_S_(a__len, a, b, c)";

PROCEDURE Add*(threads: INTEGER; VAR a, b, c: ARRAY OF REAL);
BEGIN
  add(threads, a, b, c)
END Add;

END cudaArrays.
