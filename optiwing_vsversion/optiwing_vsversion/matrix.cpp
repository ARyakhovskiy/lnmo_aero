#include "matrix.h"

int main() {
	matrix m = matrix();

	return 0;
}
matrix::matrix() //Нулевая матрица
{
	a = 0;
	n = 0;
	m = 0;
}
matrix::matrix(int N, int M, bool E = 0) //Матрица с интами
{
	n = N;
	m = M;
	a = new double *[n];
	for (int i = 0; i < n; ++i)
	{
		a[i] = new double[m];
		for (int j = 0; j < m; ++j)
			a[i][j] = (i == j) * E;
	}
}
matrix::matrix(double array[], int N, bool horizontal) //Горизонтальная и вертикальная матрица
{
	if (horizontal)
	{
		n = 1;
		m = N;
		a = new double *[1];
		a[0] = new double[m];
		for (int i = 0; i < m; ++i)
			a[0][i] = array[i];
	}
	else
	{
		n = N;
		m = 1;
		a = new double *[n];
		for (int i = 0; i < n; ++i)
		{
			a[i] = new double[1];
			a[i][0] = array[i];
		}
	}
}
int matrix::N()
{
	return n;
}
int matrix::M()
{
	return m;
}
int matrix::getSize() // Размер матрицы
{
	return n && m;
}


double* matrix::getColumn(int index) //Взять столбец матрицы
{
	if (index < 0 || index >= m)
		return 0;
	double * c = new double[n];
	for (int i = 0; i < n; ++i)
		c[i] = a[i][index];
	return c;
}
double* matrix::getRow(int index) //Взять строку матрицы
{
		if (index >= 0 && index < n)
			return a[index];
		return 0;
}
matrix matrix::matrixadd(matrix & a, matrix & b) //Сложение двух матрицы
{
	if (a.N() != b.N() || a.M() != b.M())
		return matrix();
	matrix c = matrix(a.N(), b.M());
	for (int i = 0; i < a.N(); ++i)
		for (int j = 0; j < a.M(); ++j)
			c.a[i][j] = a.a[i][j] + b.a[i][j];
	return c;
}
matrix matrix::matrixmuln(matrix & a, double k) //Умножение матрицы на число
{
	matrix c = matrix(a.N(), a.M());
	for (int i = 0; i < a.N(); ++i)
		for (int j = 0; j < a.M(); ++j)
			c.a[i][j] = a.a[i][j] * k;
	return c;
}
matrix matrix::matrixmulm(matrix & a, matrix & b) //Перемножение двух матриц
{
	if (a.M() != b.N())
		return matrix();
	matrix c = matrix(a.N(), b.M());
	for (int i = 0; i < a.N(); ++i)
		for (int j = 0; j < b.M(); ++j)
			for (int k = 0; k < a.M(); ++k)
				c.a[i][j] += a.a[i][k] * b.a[k][j];
	return c;
}