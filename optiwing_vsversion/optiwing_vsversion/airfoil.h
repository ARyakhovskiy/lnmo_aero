#pragma once
#include "panel.h"


//������� ����� ��� ���������������� ��������
class airfoil
{
	panel* panels;
public:
	airfoil();
	airfoil(point* points);
	~airfoil();

	int size(); //���-�� �������
	bool closed(); //�������� �����������

	
};

