#pragma once
#include "point.h"

class panel
{
public:
	point left, right;

	panel();
	panel(point p1, point p2);
	const point getCenter();
	const double getAngle();
	const double getLenght();
	const point getPoint();
	~panel();
};
