/*
 *  plane.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */


#ifndef _PLANE_H_
#define _PLANE_H_

#include "ofMain.h"
#include "ofxVectorMath.h"
#include "newlevel.h"
#include "constant.h"

#define TAM_PLANE 10

class Plane {
	private:
		ofxVec3f p;
	
	public:
		//vars
		int planeColor;
		int lineColor;
		int x;
		int y;
		int z;
	
		/* Constructor. Create a new plane at position (0, 0, 0) */
		Plane();
		/* Constructor. Create a new plane at position (posX, posY, posZ) */
		Plane(int posX, int posY, int posZ);
		
		//methods
		void draw(); //draw plane
		void drawLine(Plane *plane);
		void setPlaneColor(int color);
		void setLineColor(int color);
		void setPosition(int posX, int posY, int posZ);
		void setPosition(rotationType flag); //Position depends flag value.
		void rotated(float speed, ofxVec3f rotation);
		
};
#endif
