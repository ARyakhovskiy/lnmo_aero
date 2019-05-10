#pragma once
#include "point.h"
#include <iostream>
class panel
{
public:
	point left, right;

	panel();
	panel(point p1, point p2);
	const point getCenter();
	const double getAngle();
	const double getLenght();
	void out(std::ofstream& streamOut);

	~panel();
};
