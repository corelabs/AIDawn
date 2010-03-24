/*
 *  stageThree.h
 *  AIDawn
 *
 *  Created by Rez on 3/6/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _STAGETHREE_H_
#define _STAGETHREE_H_

#include "ofMain.h"
#include "newlevel.h"
#include "glu.h"
#include "cube.h"

class StageThree {

	private:
		
		GLint		__viewport[4];
		GLfloat		__modelview[16];
		GLfloat		__projection[16];
	
		Cube		**cube;
		
		NewLevel	newlevel;
		int			colorCube;
		int			colorLines;
		int			tam_cube;
	
		float		speedOfRotation;
	
		//methods
		void		allocateCubes();
		void		freeCubes();
	
	public:
	
		StageThree();
	
		void		draw();
		void		update();
		void		createItem();
		void		reset();
		void		close();
		bool		checkHit(int x, int y);	
		CGPoint		GetOGLPos(float x, float y);

		int			counter;
		float		angle;

};

#endif