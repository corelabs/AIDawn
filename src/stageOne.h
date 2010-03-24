/*
 *  stageOne.h
 *  AIDawn
 *
 *  Created by CORE LABS on 3/5/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _STAGEONE_H_
#define _STAGEONE_H_


#include "ofMain.h"
#include "plane.h"
#include "newlevel.h"

class StageOne {
	private:
		//vars
		Plane		**plane;
		
		GLint		__viewport[4];
		GLfloat		__modelview[16];
		GLfloat		__projection[16];
		GLfloat		winX, winY, winZ;
		
		float		speedOfRotation; // speed;
		
		NewLevel	newlevel;
		int			colorPlanes;
		int			colorLines;
		
		//methods
		void		allocatePlanes();
		void		freePlanes();

		
	public:
		//vars
		int			counter;
		
		//constructor
		StageOne();
		
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