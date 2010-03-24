/*
 *  circle.h
 *  AIDawn
 *
 *  Created by Rez on 3/9/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _CIRCLE_H_
#define _CIRCLE_H_

#include "ofMain.h"
#include "constant.h"

#define TAM_PLANE	10

class Circle {
private:
	ofxVec3f cir;
	
public:
	//vars
	int circleColor;
	int lineColor;
	int x;
	int y;
	int z;
	
	/* Constructor. Create a new plane at position (0, 0, 0) */
	Circle();
	/* Constructor. Create a new plane at position (posX, posY, posZ) */
	Circle(int posX, int posY, int posZ);
	
	//methods
	void draw(); //draw plane
	void drawLine(Circle *circle);
	void setCircleColor(int color);
	void setLineColor(int color);
	void setPosition(int posX, int posY, int posZ);
	void setPosition(rotationType flag); //Position depends flag value.
	void rotated(float speed, ofxVec3f rotation);
	
};
#endif