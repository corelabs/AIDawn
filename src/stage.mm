/*
 *  stage.mm
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/4/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "stage.h"

Stage::Stage(){
	stage = 0;
	counter = 0;
	
	speedOfRotation = 0.4f;
	
	color = 0xffde00;
	colorLines= 0xa4a18c;
	//fontColor = 0x111111;
	
	setStage(stage);
}

//methods
void Stage::draw(){
	switch (stage) {
		case 0: //level 0
			for (int i = 0; i <= counter; i++){
				
				//draw planes
				plane[i]->setPlaneColor(color);
				plane[i]->draw();
				
				//draw lines
				if((i-1) >= 0){
					plane[i]->setLineColor(colorLines);
					plane[i]->drawLine(plane[i-1]);
				}
			}
			break;
		case 1://level 1
			
			break;
		case 2://level 2
			
			break;
		case 3://level 3
			
			break;
		default:
			break;
	}
}

void Stage::setStage(int level){
	stage = level;
	switch (level) {
		case 0: //level 0
			allocatePlanes();
			break;
		case 1://level 1
			if(plane){freePlanes();}
			break;
		case 2://level 2
			if(plane){freePlanes();}
			break;
		case 3://level 3
			if(plane){freePlanes();}
			break;
		default:
			break;
	}
}

void Stage::update(){
	switch (stage) {
		case 0: //level 0
			/// FUNCION CAMBIO DE ESTADO
			
			newlevel.set(counter);
			color = newlevel.color;
			colorLines = newlevel.linesColor;
			for (int i = 0; i <= counter; i++)
				plane[i]->rotated(speedOfRotation, newlevel.rotation);
			break;
		case 1://level 1
			
			break;
		case 2://level 2
			
			break;
		case 3://level 3
			
			break;
		default:
			break;
	}
}

void Stage::resetStage(){
	switch (stage) {
		case 0: //level 0
			counter = 0;
		
			speedOfRotation = 0.2f;
			color = 0xffde00;
			colorLines= 0xa4a18c;
			createItem();
			break;
		case 1://level 1
			
			break;
		case 2://level 2
			
			break;
		case 3://level 3
			
			break;
		default:
			break;
	}
}
	
bool Stage::checkHit(int x, int y){
	switch (stage) {
		case 0: //level 0
			CGPoint position;
			position = GetOGLPos((float)x, (float)y);
			
			printf("SCREEN CLICK POSx :%d, POSy :%d \n",x,y );
			printf("WORLD  PLANE POSx :%d, POSy :%d, POSz :%d\n",plane[counter]->x,plane[counter]->y,plane[counter]->z);
			printf("NEW WORLD CLICK POSITION X  %f,  Y %f\n",position.x, position.y);
			
			if((position.x >= plane[counter]->x-20) && (position.x <= plane[counter]->x + TAM_PLANE+20) && 
			   (position.y >= plane[counter]->y-20) && (position.y <= plane[counter]->y + TAM_PLANE+20))
				return true;
			return false;
			break;
		case 1://level 1
			return false;
			break;
		case 2://level 2
			return false;
			break;
		case 3://level 3
			return false;
			break;
		default:
			return false;
			break;
	}
	
	
	
}

void Stage::allocatePlanes(){
	plane = new Plane*[MAX_N_PTS];
	for(int i = 0; i < MAX_N_PTS; i++){
		plane[i] = new Plane();
	}	
}

void Stage::freePlanes(){
	
	for(int i = MAX_N_PTS-1; i = 0; i--){
		free(plane);
	}	
	free(plane);
}

void Stage::createItem(){
	switch (stage) {
		case 0: //level 0
			if ((counter !=0)&&(counter <= MAX_N_PTS))
				plane[counter]->setPosition(newlevel.rotationFlag);
			break;
		case 1://level 1
			break;
		case 2://level 2
			break;
		case 3://level 3
			break;
		default:
			break;
	}
}

CGPoint Stage::GetOGLPos(float x, float y)
{
	
	glGetFloatv( GL_MODELVIEW_MATRIX, __modelview );
	glGetFloatv( GL_PROJECTION_MATRIX, __projection );
	glGetIntegerv( GL_VIEWPORT, __viewport );
	
	//opengl 0,0 is at the bottom not at the top
	y = (float)__viewport[3] - y;
	
	// float winZ;
	//we cannot do the following in openGL ES due to tile rendering
	//glReadPixels( (int)x, (int)x, 1, 1, GL_DEPTH_COMPONENT24_OES, GL_FLOAT, &winZ );
	
	float cX, cY, cZ, fX, fY, fZ;
	//gives us camera position (near plan)
	gluUnProject( x, y, 0, __modelview, __projection, __viewport, &cX, &cY, &cZ);
	//far plane
	gluUnProject( x, y, 1, __modelview, __projection, __viewport, &fX, &fY, &fZ);
	
	//We could use some vector3d class, but this will do fine for now
	//ray
	fX -= cX;
	fY -= cY;
	fZ -= cZ;
	float rayLength = sqrtf(cX*cX + cY*cY + cZ*cZ);
	//normalize
	fX /= rayLength;
	fY /= rayLength;
	fZ /= rayLength;
	
	//T = [planeNormal.(pointOnPlane - rayOrigin)]/planeNormal.rayDirection;
	//pointInPlane = rayOrigin + (rayDirection * T);
	
	float dot1, dot2;
	
	float pointInPlaneX = 0;
	float pointInPlaneY = 0;
	float pointInPlaneZ = 0;
	float planeNormalX = 0;
	float planeNormalY = 0;
	float planeNormalZ = -1;
	
	pointInPlaneX -= cX;
	pointInPlaneY -= cY;
	pointInPlaneZ -= cZ;
	
	dot1 = (planeNormalX * pointInPlaneX) + (planeNormalY * pointInPlaneY) + (planeNormalZ * pointInPlaneZ);
	dot2 = (planeNormalX * fX) + (planeNormalY * fY) + (planeNormalZ * fZ);
	
	float t = dot1/dot2;
	
	fX *= t;
	fY *= t;
	
	return CGPointMake(fX + cX, fY + cY);
	
	
}
