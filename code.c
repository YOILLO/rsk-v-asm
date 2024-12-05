#include <stdio.h>

#define N 4
#define M 4

int process(int n, int m, int matrix [M][N], int str)
{
    int sum = 0;
    for (int i = 0; i < m; ++i) {
        if (i == str)
            for (int j = 0; j < n; ++j)
                sum += matrix[i][j];
    }

    return sum;

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    int str;
    scanf("%d", &str);

    int result = process(N, M, matrix, str);

    printf("%d ", result);

    return 0;
}