MODULE test;
IMPORT Out, cuda, cudaArrays;

PROCEDURE initArrays(i: REAL; VAR a, b, c: ARRAY OF REAL);
VAR
  j: INTEGER;
BEGIN
  j := 0;
  REPEAT
    a[j] := i;
    b[j] := i;
    c[j] := i;
    INC(j)
  UNTIL j = LEN(a); 
END initArrays;

PROCEDURE main;
VAR
  a, b, c: ARRAY 64 OF REAL; 
  d : cuda.Dev;
  threads: INTEGER;
  i: INTEGER;
BEGIN

  initArrays(0.5, a, b, c);
  Out.Real(a[55], 0); Out.Ln;
  Out.Real(b[55], 0); Out.Ln;
  Out.Real(c[55], 0); Out.Ln;
 
  d := cuda.getDeviceCount();
  threads := 64;
  cuda.initBlocks(1);
  cuda.initThreads(threads);
  cudaArrays.Add(threads, a, b, c);
  Out.Real(a[55], 0); Out.Ln;
  Out.Real(b[55], 0); Out.Ln;
  Out.Real(c[55], 0); Out.Ln;
END main;

BEGIN
main;

END test.
