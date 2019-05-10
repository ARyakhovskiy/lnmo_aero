#include "pch.h"
#include "panel.h"
#include "math.h"
#include <iostream> 
#include <fstream> 

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

const point panel::getCenter()//����� ������
{
	double centerX, centerY;
	centerX = 0.5*(left.x + right.x);
	centerY = 0.5*(left.y + right.y);
	return point(centerX, centerY);
}
const double panel::getAngle()//���� ����� ������� � ���� �
{
	double angle;
	angle = atan((right.y - left.y) / (right.x - left.x));
	return angle;
}
const double panel::getLenght()//����� ������
{
	double lenght;
	lenght =sqrt( (left.y - right.y)*(left.y - right.y) + (right.x - left.x)*(right.x - left.x));
	return lenght;
}
  
void panel ::out(std::ofstream& streamOut)//����� ��������� ������
{
	
	

	streamOut << "("<<left.x << " "<<left.y<<") "<< "(" << right.x << " " << right.y << ");\n";


}

panel::~panel()
{
}
