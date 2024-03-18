/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    register int bi,bj,i,j,a,b,c,d,e,f,g,h;
    if(M==32&&N==32)
        for (bi = 0; bi < M; bi += 8)
            for (bj = 0; bj < N; bj += 8)
                for (i = bi; i < bi + 8; i++)
                    a = A[i][0+bj], b = A[i][1+bj], c = A[i][2+bj], d = A[i][3+bj],
                    e = A[i][4+bj], f = A[i][5+bj], g = A[i][6+bj], h = A[i][7+bj],
                    B[0+bj][i] = a, B[1+bj][i] = b, B[2+bj][i] = c, B[3+bj][i] = d,
                    B[4+bj][i] = e, B[5+bj][i] = f, B[6+bj][i] = g, B[7+bj][i] = h;
    else if(N==64)
        for (bi = 0; bi < N; bi += 8)
            for (bj = 0; bj < M; bj += 8) {
                for (i = bi; i < bi + 4; i++) {
                    a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];
                    e = A[i][4+bj]; f = A[i][5+bj]; g = A[i][6+bj]; h = A[i][7+bj];
                    B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;
                    B[0+bj][4+i] = e; B[1+bj][4+i] = f; B[2+bj][4+i] = g; B[3+bj][4+i] = h;
                }
                for (j = bj; j < bj + 4; j++) {
                    a = A[4+bi][j]; b = A[5+bi][j]; c = A[6+bi][j]; d = A[7+bi][j];
                    e = B[j][4+bi]; f = B[j][5+bi]; g = B[j][6+bi]; h = B[j][7+bi];
                    B[j][4+bi] = a; B[j][5+bi] = b; B[j][6+bi] = c; B[j][7+bi] = d;
                    B[4+j][0+bi] = e; B[4+j][1+bi] = f; B[4+j][2+bi] = g; B[4+j][3+bi] = h;
                }
                for (i = bi + 4; i < bi + 8; i++) {
                    a = A[i][4+bj]; b = A[i][5+bj]; c = A[i][6+bj]; d = A[i][7+bj]; 
                    B[4+bj][i] = a; B[5+bj][i] = b; B[6+bj][i] = c; B[7+bj][i] = d; 
                }
            }
    else 

/* for(int bi = 0; bi < N; bi += 8) for(int bj = 0; bj < M; bj += 8)
{
        for (int i = bi; i < bi + 4 && i < N; ++i) {
            for(int j = bj; j < bj + 8 && j < M; ++j)
                tmp [j-bj] = A[i][j];

            for(int j = bj; j < bj + 4 && j < M; ++j)B[j][i]=tmp[j-bj];
            for(int j = bj; j < bj + 4 && j < M; ++j)B[j][i+4] = tmp[j-bj+4];
        }
        for (int j = bj; j < bj + 4; j++) {
            for(int i=4;i<8 && bi+i<N;++i)tmp[i-4]=A[i][j];
            //a = A[4+bi][j]; b = A[5+bi][j]; c = A[6+bi][j]; d = A[7+bi][j];
            for(int i=4;i<8 && bi+i<N;++i)tmp[i]=B[j][i];
            //e = B[j][4+bi]; f = B[j][5+bi]; g = B[j][6+bi]; h = B[j][7+bi];
            for(int i=4;i<8 && bi+i<N;++i)B[j][i] = tmp[i-4];
            //B[j][4+bi] = a; B[j][5+bi] = b; B[j][6+bi] = c; B[j][7+bi] = d;
            for(int i=0;i<4&&bi+i<N;++i)B[4+j][i] = tmp[i+4];
            //B[4+j][0+bi] = e; B[4+j][1+bi] = f; B[4+j][2+bi] = g; B[4+j][3+bi] = h;
        }
        for (int i = bi + 4; i < bi + 8; i++) {
            for(int j=4;j<8&&bj+j<M;++j)tmp[j-4] = A[i][j];
            //a = A[i][4+bj]; b = A[i][5+bj]; c = A[i][6+bj]; d = A[i][7+bj]; 
            for(int j=4;j<8&&bj+j<M;++j)B[j][i]=tmp[j-4];
            //B[4+bj][i] = a; B[5+bj][i] = b; B[6+bj][i] = c; B[7+bj][i] = d; 
        }
} */

    {
#define block_size 16
        for (bi = 0; bi < N; bi += block_size)
            for (bj = 0; bj < M; bj += block_size)
                for (i = bi; i < N && i < bi + block_size; i++)
                    for (j = bj; j < M && j < bj + block_size; j++)
                        B[j][i] = A[i][j];
#undef block_size
    }
}
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}
void trans_32_32(int M, int N, int A[N][M], int B[M][N])
{
    register int bi, bj, i, j, a, b, c, d, e, f, g, h;
    for (bi = 0; bi < M; bi += 8)
        for (bj = 0; bj < N; bj += 8)
            if(bi != bj)
                for (i = bi; i < bi + 8; i++)
                    for (j = bj; j < bj + 8; j++)
                        B[j][i] =A[i][j];
            else 
                for (i = bi; i < bi + 8; i++) {
                    a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];
                    e = A[i][4+bj]; f = A[i][5+bj]; g = A[i][6+bj]; h = A[i][7+bj];
                    B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;
                    B[4+bj][i] = e; B[5+bj][i] = f; B[6+bj][i] = g; B[7+bj][i] = h;
                }
}
void trans_by_4(int M, int N, int A[N][M], int B[M][N])
{
    register int bi, bj, i, a, b, c, d;
    for (bi = 0; bi < M; bi += 4)
        for (bj = 0; bj < N; bj += 4)
            for (i = bi; i < bi + 4; i++) {
                a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];
                B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;
            }
}
void f(int M, int N, int A[N][M], int B[M][N]){
    register int bi,bj,i,j,a,b,c,d,e,f,g,h;
    for (bi = 0; bi < N; bi += 8)
    for (bj = 0; bj < M; bj += 8)
    if(bi!=bj) {
        for (i = bi; i < bi + 4; i++) {
            a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];
            e = A[i][4+bj]; f = A[i][5+bj]; g = A[i][6+bj]; h = A[i][7+bj];
            B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;
            B[0+bj][4+i] = e; B[1+bj][4+i] = f; B[2+bj][4+i] = g; B[3+bj][4+i] = h;
        }
        for (j = bj; j < bj + 4; j++) {
            a = A[4+bi][j]; b = A[5+bi][j]; c = A[6+bi][j]; d = A[7+bi][j];
            e = B[j][4+bi]; f = B[j][5+bi]; g = B[j][6+bi]; h = B[j][7+bi];
            B[j][4+bi] = a; B[j][5+bi] = b; B[j][6+bi] = c; B[j][7+bi] = d;
            B[4+j][0+bi] = e; B[4+j][1+bi] = f; B[4+j][2+bi] = g; B[4+j][3+bi] = h;
        }
        for (i = bi + 4; i < bi + 8; i++) {
            a = A[i][4+bj]; b = A[i][5+bj]; c = A[i][6+bj]; d = A[i][7+bj]; 
            B[4+bj][i] = a; B[5+bj][i] = b; B[6+bj][i] = c; B[7+bj][i] = d; 
        }
    }
    else {
        for (i = bi; i < bi + 4; i++) {
            a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];
            e = A[i][4+bj]; f = A[i][5+bj]; g = A[i][6+bj]; h = A[i][7+bj];
            B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;
            B[0+bj][4+i] = e; B[1+bj][4+i] = f; B[2+bj][4+i] = g; B[3+bj][4+i] = h;
        }
        for (j = bj; j < bj + 4; j++) {
            a = A[4+bi][j]; b = A[5+bi][j]; c = A[6+bi][j]; d = A[7+bi][j];
            e = B[j][4+bi]; f = B[j][5+bi]; g = B[j][6+bi]; h = B[j][7+bi];
            B[j][4+bi] = a; B[j][5+bi] = b; B[j][6+bi] = c; B[j][7+bi] = d;
            B[4+j][0+bi] = e; B[4+j][1+bi] = f; B[4+j][2+bi] = g; B[4+j][3+bi] = h;
        }
        for (i = bi + 4; i < bi + 8; i++) {
            a = A[i][4+bj]; b = A[i][5+bj]; c = A[i][6+bj]; d = A[i][7+bj]; 
            B[4+bj][i] = a; B[5+bj][i] = b; B[6+bj][i] = c; B[7+bj][i] = d; 
        }
    }
}

void g(int M, int N, int A[N][M], int B[M][N]){
    register int bi,bj,i,j,a,b,c,d;
    for (bi = 0; bi < N; bi += 8)
    for (bj = 0; bj < M; bj += 8) {
        for (i = bi; i < bi + 4; i++) {
            B[0+bj][i] = A[i][0+bj]; B[1+bj][i] = A[i][1+bj];
            B[2+bj][i] = A[i][2+bj]; B[3+bj][i] = A[i][3+bj];
            B[0+bj][4+i] = A[i][4+bj]; B[1+bj][4+i] = A[i][5+bj];
            B[2+bj][4+i] = A[i][6+bj]; B[3+bj][4+i] = A[i][7+bj];
        }
        for (j = bj; j < bj + 4; j++) {
            a = B[j][4+bi]; B[j][4+bi] = A[4+bi][j];
            b = B[j][5+bi]; B[j][5+bi] = A[5+bi][j];
            c = B[j][6+bi]; B[j][6+bi] = A[6+bi][j];
            d = B[j][7+bi]; B[j][7+bi] = A[7+bi][j];
            B[4+j][0+bi] = a; B[4+j][1+bi] = b; B[4+j][2+bi] = c; B[4+j][3+bi] = d;
        }
        for (i = bi + 4; i < bi + 8; i++) {
            B[4+bj][i] = A[i][4+bj]; B[5+bj][i] = A[i][5+bj];
            B[6+bj][i] = A[i][6+bj]; B[7+bj][i] = A[i][7+bj];
        }
    }
}
void foo(int M, int N, int A[N][M], int B[M][N])
{
    register int bi, bj, i, j;
#define block_size 15
    for (bi = 0; bi < N; bi += block_size)
        for (bj = 0; bj < M; bj += block_size)
            for (i = bi; i < N && i < bi + block_size; i++)
                for (j = bj; j < M && j < bj + block_size; j++)
                    B[j][i] = A[i][j];
#undef block_size
}
void registerFunctions()
{
    //registerTransFunction(transpose_submit, "Transpose submission");
    registerTransFunction(foo,"Transpose submission");
}

int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; ++j)
            if (A[i][j] != B[j][i])
                return 0;
    return 1;
}

