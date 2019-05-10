#pragma once
#include "panel.h"


//Базовый класс для аэродинамических профилей
class airfoil
{
	panel* panels;
public:
	airfoil();
	airfoil(point* points);
	~airfoil();

	int size(); //кол-во панелей
	bool closed(); //Проверка замкнутости

	
};

