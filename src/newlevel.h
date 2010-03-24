/*
 *  newlevel.h
 *  iPhone AI Dawn
 *
 *  Created by Rez on 2/22/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _NEWLEVEL
#define _NEWLEVEL

#include "ofMain.h"
#include "ofxVectorMath.h"
enum	  rotationType {X,Y,Z,XY,XZ,YZ,XYZ};	

class NewLevel {
	
	public:
		//vars
		ofxVec3f		rotation;
		int				color;
		int				linesColor;
		rotationType	rotationFlag;
		
		//constructor
		NewLevel();
		
		//methods
		void			set(int level);
};
#endif

