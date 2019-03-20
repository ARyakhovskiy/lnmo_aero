#include "pch.h"
#include "panel.h"
#include "cmath"

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
const point panel::getAngle()
{
	double angle;
	angle = atan((right.y - left.y) / (right.x - left.x));
	
}
const point panel::getLenght()
{
	double lenght;
	lenght =sqrt( (left.y - right.y)^2 + (right.x - left.x)^2);
	
}


panel::~panel()
{
}
