#include "pch.h"
#include "panel.h"
#include "math.h"

panel::panel()
{
	left = point();
	right = point();

}

panel::panel(point p1, point p2)
{
	left = p1;
	right = p2;
}

const point panel::getCenter()
{
	double centerX, centerY;
	centerX = 0.5*(left.x + right.x);
	centerY = 0.5*(left.y + right.y);
	return point(centerX, centerY);
}
const double panel::getAngle()
{
	double angle;
	angle = atan((right.y - left.y) / (right.x - left.x));
	return angle;
}
const double panel::getLenght()
{
	double lenght;
	lenght =sqrt( (left.y - right.y)*(left.y - right.y) + (right.x - left.x)*(right.x - left.x));
	return lenght;
}
 /*const point panel::getPoint()
{
	int a;
	cin >>a;
	char *str1[] =new char[a];
	for (int i = 0; i < a; i++) {
		cin >> str1[i];
	}
	ofstream fout("name.txt");
	fout << str1; 
	fout.close();
	
	return 0;
}*/

panel::~panel()
{
}
