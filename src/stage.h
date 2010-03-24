/*
 *  stage.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/4/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "ofMain.h"
#include "plane.h"
#include "newlevel.h"

class Stage {
	private:
		//vars
		int			stage;
		Plane		**plane;
	
		GLint		__viewport[4];
		GLfloat		__modelview[16];
		GLfloat		__projection[16];
		GLfloat		winX, winY, winZ;
	
		float		speedOfRotation; // speed;
	
		NewLevel	newlevel;
		int			color;
		int			colorLines;
		
		//methods
		void		allocatePlanes();
		void		freePlanes();
		
	public:
		//vars
		int			counter;
		
		//constructor
		Stage();
		
		//methods
		void		draw(); //draw plane
		void		update();
		void		setStage(int level);
		bool		checkHit(int x, int y);
		void		createItem();
		void		resetStage();
		CGPoint		GetOGLPos(float x, float y);
	
};