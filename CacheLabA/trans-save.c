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

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
register int a,b,c,d,e,f,g,h;
// int tmp[8];
if(M==32&&N==32)
for (int bi = 0; bi < M; bi += 8) {
    for (int bj = 0; bj < N; bj += 8) {
        for (int i = bi; i < bi + 8; i++) {
            a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];
            e = A[i][4+bj]; f = A[i][5+bj]; g = A[i][6+bj]; h = A[i][7+bj]; //除第一个A,其他都是利用cache命中存入
            B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;
            B[4+bj][i] = e; B[5+bj][i] = f; B[6+bj][i] = g; B[7+bj][i] = h;
        }
    }
}
else if(N==64)
for (int bi = 0; bi < N; bi += 8) {
    for (int bj = 0; bj < M; bj += 8) {
        for (int i = bi; i < bi + 4; i++) {
            a = A[i][0+bj]; b = A[i][1+bj]; c = A[i][2+bj]; d = A[i][3+bj];  //store a a a a
            e = A[i][4+bj]; f = A[i][5+bj]; g = A[i][6+bj]; h = A[i][7+bj];  //store 1 1 1 1

            B[0+bj][i] = a; B[1+bj][i] = b; B[2+bj][i] = c; B[3+bj][i] = d;              //assign a a a a
            B[0+bj][4+i] = e; B[1+bj][4+i] = f; B[2+bj][4+i] = g; B[3+bj][4+i] = h;  //assign 1 1 1 1 
        }
        for (int j = bj; j < bj + 4; j++) {
            a = A[4+bi][j]; b = A[5+bi][j]; c = A[6+bi][j]; d = A[7+bi][j];   //store e f g h
            e = B[j][4+bi]; f = B[j][5+bi]; g = B[j][6+bi]; h = B[j][7+bi];   //store 1 2 3 4

            B[j][4+bi] = a; B[j][5+bi] = b; B[j][6+bi] = c; B[j][7+bi] = d;          //assign e f g h
            B[4+j][0+bi] = e; B[4+j][1+bi] = f; B[4+j][2+bi] = g; B[4+j][3+bi] = h;  //assign 1 2 3 4
        }
        for (int i = bi + 4; i < bi + 8; i++) {
            a = A[i][4+bj]; b = A[i][5+bj]; c = A[i][6+bj]; d = A[i][7+bj]; 
            B[4+bj][i] = a; B[5+bj][i] = b; B[6+bj][i] = c; B[7+bj][i] = d; 
        }
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
            //B[j][4+bi] = a; B[j][5+bi] = b; B[j][6+bi] = c; B[j][7+bi] = d;          //assign e f g h
            for(int i=0;i<4&&bi+i<N;++i)B[4+j][i] = tmp[i+4];
            //B[4+j][0+bi] = e; B[4+j][1+bi] = f; B[4+j][2+bi] = g; B[4+j][3+bi] = h;  //assign 1 2 3 4
        }
        for (int i = bi + 4; i < bi + 8; i++) {
            for(int j=4;j<8&&bj+j<M;++j)tmp[j-4] = A[i][j];
            //a = A[i][4+bj]; b = A[i][5+bj]; c = A[i][6+bj]; d = A[i][7+bj]; 
            for(int j=4;j<8&&bj+j<M;++j)B[j][i]=tmp[j-4];
            //B[4+bj][i] = a; B[5+bj][i] = b; B[6+bj][i] = c; B[7+bj][i] = d; 
        }
} */

{int block_size = 16;      //子块大小：block_size * block_size
for (int bi = 0; bi < N; bi += block_size) {
    for (int bj = 0; bj < M; bj += block_size) {
        for (int i = bi; i < N && i < bi + block_size; i++) {
            for (int j = bj; j < M && j < bj + block_size; j++) {
                B[j][i] = A[i][j];
            }
        }
    }
}}

}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
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

void trans1(int M, int N, int A[N][M], int B[M][N])
{
    // for(int i=0;i<N;++i)for(int j=0;j<M;++j)if(i!=j)B[j][i] = A[i][j];
    // for(int i=0;i<M&&i<N;++i)B[i][i]=A[i][i];
    int tmp[8];
    for (int bi = 0; bi < M; bi += 8)
    {
        for (int bj = 0; bj < N; bj += 8)
        {
            for (int i = bi; i < bi + 8; i++)
            {
                for (int cnt = 0; cnt < 8; ++cnt)
                    tmp[cnt] = A[i][cnt + bj];
                for (int cnt = 0; cnt < 8; ++cnt)
                    B[cnt + bj][i] = tmp[cnt];
            }
        }
    }
}
void trans2(int M, int N, int A[N][M], int B[M][N]){



}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

    //registerTransFunction(trans1, "trans1");
}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

