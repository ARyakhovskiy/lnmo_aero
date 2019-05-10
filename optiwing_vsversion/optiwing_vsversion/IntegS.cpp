#include "iostream"
#include "math.h"
#include "IntegS.h"

IntegS::IntegS(double x, double y)
{
	if (sizeof(x) == sizeof(y))
		int n = sizeof(x) / sizeof(double);
	else
	{

	}
	int n = sizeof(x) / sizeof(double);
	int h = x[1] - x[2];
	int N = 0;
	int P = 0;
	int L = 0;
	int K = 0;
	int T = 0;
	int I = 0;
	int S = 0;
	if (n % 2 == 0)
	{
		N = n / 2;
		for (int i = 2; i < N; i++)
		{
			P = y[2 * i - 1];
			L = L + P;
		}
		for (int i = 1; i < N - 1; i++)
		{
			K = y[2 * i];
			T = T + K;
		}
		I = I + (h / 3) * y[1] + y[n - 1] + 4 * L + 2 * T;
	}
	else
	{
		N = (n - 1) / 2;
		for (int i = 2; i < N; i++) {
			P = y[2 * i - 1];
			L = L + P;
		}
		for (int i = 1; i < N - 1; i++) {
			K = y[2 * i];
			T = T + K;
		}
		S = h * (y[n - 1] + y[n]) / 2;
		I = I + (h / 3)*(y[1] + y[n - 1] + 4 * L + 2 * T) + S;
	}
}
