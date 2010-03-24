/*
 *  stageTwo.h
 *  AIDawn
 *
 *  Created by Rez on 3/5/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _STAGETWO_H_
#define _STAGETWO_H_

#include "ofMain.h"
#include "newlevel.h"
#include "circle.h"


class StageTwo {
	private:
		//vars
		Circle		**circle;
		
		GLint		__viewport[4];
		GLfloat		__modelview[16];
		GLfloat		__projection[16];
		GLfloat		winX, winY, winZ;
		
		float		speedOfRotation; // speed;
		
		NewLevel	newlevel;
		int			color;
		int			colorLines;
		
		//methods
		void		allocateCircles();
		void		freeCircles();
		
		
	public:
		//vars
		int			counter;
		
		//constructor
		StageTwo();
		
		//methods
		void		draw(); //draw plane
		void		update();
		void		setStage(int level);
		bool		checkHit(int x, int y);
		void		createItem();
		void		reset();
		void		close();
		CGPoint		GetOGLPos(float x, float y);
	
};

#endif