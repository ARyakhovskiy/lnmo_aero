#include "math.h"

class matrix
{
private:
	double **a;
	int n, m;
public:
	matrix();
	matrix(int N, int M, bool E = 0);
	matrix(double array[], int N, bool horizontal);
	int getSize();
	int N();
	int M();
	double* getRow(int index);
	double* getColumn(int index);
	matrix matrixadd(matrix & a, matrix & b);
	matrix matrixmuln(matrix & a, double k);
	matrix matrixmulm(matrix & a, matrix & b);
};
