/*
 *  cube.h
 *  AIDawn
 *
 *  Created by CORE LABS on 3/8/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _CUBE_H_
#define _CUBE_H_

#include "ofMain.h"
#include "constant.h"


class Cube {
	private:
		//vars
		ofxVec3f	c; // The cube
		
		ofxVec3f	cubeRotation;
		float		angle;
		int			cubeColor;
		int			lineColor;
		
	public:
		//vars
		float		x;
		float		y;
		float		z;
		
		/* Constructor. Create a new cube at position (0, 0, 0) */
		Cube();
		/* Constructor. Create a new cube at position (posX, posY, posZ) */
		Cube(int posX, int posY, int posZ);
		
		//methods
		void		draw(int tam_plan_init); //draw plane
		void		drawLine(Cube *cube);
		void		setCubeColor(int color);
		void		setLineColor(int color);
		void		setPosition(int posX, int posY, int posZ);
		void		setPosition(rotationType flag); //Position depends flag value.
		void		rotated(float speed, ofxVec3f rotation);
		void		update();
};
#endif