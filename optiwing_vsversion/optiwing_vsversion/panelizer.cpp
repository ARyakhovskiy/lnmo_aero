// panelizer.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include "pch.h"
#include "panel.h"
#include "math.h"
#include <iostream> 
#include <fstream> 
#include <string>
#include <vector>
#include <regex>

using namespace std;

const char* path = "C:\\Users\\Александр\\source\\repos\\panelizer\\panelizer\\data.txt";
const char* path1 = "C:\\Users\\Александр\\source\\repos\\panelizer\\panelizer\\AG24.txt";
const char* path2 = "C:\\Users\\Александр\\source\\repos\\panelizer\\panelizer\\NASA6412.txt";


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
	return &panel(point(1,2), point(2,2));
}


std::vector<std::string> split(const string& input, const string& regex) {
	// passing -1 as the submatch index parameter performs splitting
	std::regex re(regex);
	std::sregex_token_iterator
		first{ input.begin(), input.end(), re, -1 },
		last;
	return { first, last };
}

//point* PointsToMass() 
vector<point> PointsToMass() 
{
	
	vector<point> points;

	string line = "";
	ifstream in(path); // окрываем файл для чтения
	
	cout << in.is_open() << endl;

	if (in.is_open())
	{
		while (getline(in, line))
		{
			cout << line << endl;
			vector<string> spt = split(line, " ");
			if (spt.size() == 2) {
				//cout << "First " << spt[0] << " Second " << spt[1] << endl;
				points.push_back(point(atof(spt[0].c_str()), atof(spt[1].c_str()))); 
			}
		}
	}
	in.close();

	return points;
	//in.close();
}

int main()
{
	
	/*point p1 = point(0.0, 0.0);
	point p2 = point(1.0, 2.0);
	panel testpanel = panel(p1, p2);
    cout << "Hello World!\n";
	cout << testpanel.getCenter().y << endl;
	
	
	for (int i = 0; i < points.size(); i++) {
		cout << points.at(i).x << " " << points.at(i).y << endl;
	}*/
	vector<point> points = PointsToMass();
	vector <panel> panels (points.size-1);
	for (int i = 0; i < panels.size(); i++) {
		panels.at(i).left = points.at(i);
		panels.at(i).right = points.at(i + 1);
	

	}
	
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
