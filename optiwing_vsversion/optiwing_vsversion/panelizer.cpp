// panelizer.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include "pch.h"
#include "panel.h"
#include "math.h"
#include <iostream> 
#include <fstream> 
#include <string>

using namespace std;

//Карелин 19.04: Реализовать чтение из файла массива точек для создания экземпляра
//класса airfoil + проверка замкнутости (и другие методы)
panel* pointsToPanels(point* points)//Из точек делаем панели
{
	const int n = 10;
	point p[n];
	for (int i = 0; i < n; i++) {
		p[i] = point(1 * i, 1 * i);
	}


	panel panels[n];
	ofstream fout;
	fout.open("file.txt");
	for (int i = 0; i < n - 1; i++) {

		panels[i] = panel(p[i], p[i + 1]);
		panels[i].out(fout);

	}
	panels[n - 1] = panel(p[n - 1], p[0]);
	panels[n - 1].out(fout);


	fout.close();
}

point* PointsToMass() 
{
	
	point* points;
	string line;
	ifstream in("C:\\Users\\Александр\source\repos\panelizer\panelizer\\data.txt");
	while (getline(in, line))
	{
		
	}
	
}

int main()
{
	
	point p1 = point(0.0, 0.0);
	point p2 = point(1.0, 2.0);
	panel testpanel = panel(p1, p2);
    cout << "Hello World!\n";
	cout << testpanel.getCenter().y << endl;
	

	//cout << panels[100].getCenter().y << endl;

}

// Запуск программы: CTRL+F5 или меню "Отладка" > "Запуск без отладки"
// Отладка программы: F5 или меню "Отладка" > "Запустить отладку"

// Советы по началу работы 
//   1. В окне обозревателя решений можно добавлять файлы и управлять ими.
//   2. В окне Team Explorer можно подключиться к системе управления версиями.
//   3. В окне "Выходные данные" можно просматривать выходные данные сборки и другие сообщения.
//   4. В окне "Список ошибок" можно просматривать ошибки.
//   5. Последовательно выберите пункты меню "Проект" > "Добавить новый элемент", чтобы создать файлы кода, или "Проект" > "Добавить существующий элемент", чтобы добавить в проект существующие файлы кода.
//   6. Чтобы снова открыть этот проект позже, выберите пункты меню "Файл" > "Открыть" > "Проект" и выберите SLN-файл.
