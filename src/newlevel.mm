/*
 *  newlevel.cpp
 *  iPhone AI Dawn
 *
 *  Created by Rez on 2/22/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "newlevel.h"
#include "ofMain.h"


NewLevel::NewLevel(){

	color = 0xFFDE00;
	linesColor = 0xA4A18C;
	rotation.set(0,1,0);


}


void NewLevel::set(int level){

	
	if (level==0){
		color = 0xffde00;
		linesColor = 0xa4a18c;
		rotation.set(0,1,0);	
		rotationFlag = Y;
		
	} 
	else if (level==10){
		color = 0xffffff;
		linesColor = 0x000000;
		rotation.set(1,0,0);	
		rotationFlag = X;
		
	}else if (level==20) {
		color = 0xff0000;
		linesColor = 0xa4a18c;
		rotation.set(0,0,1);
		rotationFlag = Z;
		
		
	} else if (level==30)  {
		color = 0x00aaff;
		linesColor = 0x000000;
		rotation.set(0,-1,0);	
		rotationFlag = X;
		
	} else if ((level>=40)&&(int(level)%10==0)){
		color = ofRandom(0, 1)*0xffffff;
		linesColor = 1 - color;
		float randomize;
		randomize = ofRandom(0, 4);
		
		if (randomize<=1){
			rotation.set(0,1,0);	

			rotationFlag = Y;
		} else if (1<randomize<=2)
		{
			rotation.set(1,0,1);
			rotationFlag = XZ;
		} else if (2<randomize<=3)
		{
			rotation.set(1,0,0);
			rotationFlag = X;

		} else if (3<randomize<=4)
		{
			rotation.set(1,-1,1);

			rotationFlag = XYZ;
		}
		
		
	}
	
	
	

}