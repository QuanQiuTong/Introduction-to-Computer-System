#define begin {
#define end }

void f(int M, int N, int A[N][M], int B[M][N]) {
    register int i, j, x1, x2, x3, x4, x5, x6, x7, x8, ii, jj;
    for (i = 0; i < N; i += 8)
    for (j = 0; j < M; j += 8)
        if (i == j) {
            x1=A[i][j];x2=A[i][j+1];x3=A[i][j+2];x4=A[i][j+3];
			x5=A[i][j+4];x6=A[i][j+5];x7=A[i][j+6];x8=A[i][j+7];

			B[i][j]=x1;B[i][j+1]=x2;B[i][j+2]=x3;B[i][j+3]=x4;
			B[i][j+4]=x5;B[i][j+5]=x6;B[i][j+6]=x7;B[i][j+7]=x8;

			x1=A[i+1][j];x2=A[i+1][j+1];x3=A[i+1][j+2];x4=A[i+1][j+3];
			x5=A[i+1][j+4];x6=A[i+1][j+5];x7=A[i+1][j+6];x8=A[i+1][j+7];
 
			B[i+1][j]=B[i][j+1];B[i][j+1]=x1;

			B[i+1][j+1]=x2;B[i+1][j+2]=x3;B[i+1][j+3]=x4;
			B[i+1][j+4]=x5;B[i+1][j+5]=x6;B[i+1][j+6]=x7;B[i+1][j+7]=x8;
 
			x1=A[i+2][j];x2=A[i+2][j+1];x3=A[i+2][j+2];x4=A[i+2][j+3];
			x5=A[i+2][j+4];x6=A[i+2][j+5];x7=A[i+2][j+6];x8=A[i+2][j+7];
 
			B[i+2][j]=B[i][j+2];B[i+2][j+1]=B[i+1][j+2];
			B[i][j+2]=x1;B[i+1][j+2]=x2;B[i+2][j+2]=x3;
			B[i+2][j+3]=x4;B[i+2][j+4]=x5;B[i+2][j+5]=x6;B[i+2][j+6]=x7;B[i+2][j+7]=x8;
 
			x1=A[i+3][j];x2=A[i+3][j+1];x3=A[i+3][j+2];x4=A[i+3][j+3];
			x5=A[i+3][j+4];x6=A[i+3][j+5];x7=A[i+3][j+6];x8=A[i+3][j+7];
 
			B[i+3][j]=B[i][j+3];B[i+3][j+1]=B[i+1][j+3];B[i+3][j+2]=B[i+2][j+3];
			B[i][j+3]=x1;B[i+1][j+3]=x2;B[i+2][j+3]=x3;B[i+3][j+3]=x4;
			B[i+3][j+4]=x5;B[i+3][j+5]=x6;B[i+3][j+6]=x7;B[i+3][j+7]=x8;
 
			x1=A[i+4][j];x2=A[i+4][j+1];x3=A[i+4][j+2];x4=A[i+4][j+3];
			x5=A[i+4][j+4];x6=A[i+4][j+5];x7=A[i+4][j+6];x8=A[i+4][j+7];
 
			B[i+4][j]=B[i][j+4];B[i+4][j+1]=B[i+1][j+4];B[i+4][j+2]=B[i+2][j+4];B[i+4][j+3]=B[i+3][j+4];
			B[i][j+4]=x1;B[i+1][j+4]=x2;B[i+2][j+4]=x3;B[i+3][j+4]=x4;B[i+4][j+4]=x5;
			B[i+4][j+5]=x6;B[i+4][j+6]=x7;B[i+4][j+7]=x8;
 
			x1=A[i+5][j];x2=A[i+5][j+1];x3=A[i+5][j+2];x4=A[i+5][j+3];
			x5=A[i+5][j+4];x6=A[i+5][j+5];x7=A[i+5][j+6];x8=A[i+5][j+7];
 
			B[i+5][j]=B[i][j+5];B[i+5][j+1]=B[i+1][j+5];B[i+5][j+2]=B[i+2][j+5];B[i+5][j+3]=B[i+3][j+5];B[i+5][j+4]=B[i+4][j+5];
			B[i][j+5]=x1;B[i+1][j+5]=x2;B[i+2][j+5]=x3;B[i+3][j+5]=x4;B[i+4][j+5]=x5;B[i+5][j+5]=x6;
			B[i+5][j+6]=x7;B[i+5][j+7]=x8;
 
			x1=A[i+6][j];x2=A[i+6][j+1];x3=A[i+6][j+2];x4=A[i+6][j+3];
			x5=A[i+6][j+4];x6=A[i+6][j+5];x7=A[i+6][j+6];x8=A[i+6][j+7];
 
			B[i+6][j]=B[i][j+6];B[i+6][j+1]=B[i+1][j+6];B[i+6][j+2]=B[i+2][j+6];B[i+6][j+3]=B[i+3][j+6];
			B[i+6][j+4]=B[i+4][j+6];B[i+6][j+5]=B[i+5][j+6];
			B[i][j+6]=x1;B[i+1][j+6]=x2;B[i+2][j+6]=x3;B[i+3][j+6]=x4;B[i+4][j+6]=x5;B[i+5][j+6]=x6;
			B[i+6][j+6]=x7;B[i+6][j+7]=x8;
 
			x1=A[i+7][j];x2=A[i+7][j+1];x3=A[i+7][j+2];x4=A[i+7][j+3];
			x5=A[i+7][j+4];x6=A[i+7][j+5];x7=A[i+7][j+6];x8=A[i+7][j+7];
 
			B[i+7][j]=B[i][j+7];B[i+7][j+1]=B[i+1][j+7];B[i+7][j+2]=B[i+2][j+7];B[i+7][j+3]=B[i+3][j+7];
			B[i+7][j+4]=B[i+4][j+7];B[i+7][j+5]=B[i+5][j+7];B[i+7][j+6]=B[i+6][j+7];
			B[i][j+7]=x1;B[i+1][j+7]=x2;B[i+2][j+7]=x3;B[i+3][j+7]=x4;B[i+4][j+7]=x5;B[i+5][j+7]=x6;B[i+6][j+7]=x7;
			B[i+7][j+7]=x8;
        }
        else
            for (ii = i; ii < i + 8; ii++)
                for (jj = j; jj < j + 8; jj++)
                    B[jj][ii] = A[ii][jj];
}