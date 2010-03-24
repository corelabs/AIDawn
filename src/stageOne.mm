/*
 *  stageOne.mm
 *  AIDawn
 *
 *  Created by CORE LABS on 3/5/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "stageOne.h"

StageOne::StageOne(){
	counter = 0;
	
	speedOfRotation = 0.4f;
	
	colorPlanes		= 0xFFDE00;
	colorLines  = 0xA4A18C;
	allocatePlanes();
}


void StageOne::draw(){
	for (int i = 0; i <= counter; i++){
		
		//draw planes
		plane[i]->setPlaneColor(colorPlanes);
		plane[i]->draw();
		
		//draw lines
		if((i-1) >= 0){
			plane[i]->setLineColor(colorLines);
			plane[i]->drawLine(plane[i-1]);
		}
	}	
}

void StageOne::update(){
	/// FUNCION CAMBIO DE ESTADO
	newlevel.set(counter);
	colorPlanes = newlevel.color;
	colorLines = newlevel.linesColor;
	for (int i = 0; i <= counter; i++)
		plane[i]->rotated(speedOfRotation, newlevel.rotation);
	
}


bool StageOne::checkHit(int x, int y){
	CGPoint position;
	position = GetOGLPos((float)x, (float)y);
	
	//printf("SCREEN CLICK POSx :%d, POSy :%d \n",x,y );
	//printf("WORLD  PLANE POSx :%d, POSy :%d, POSz :%d\n",plane[counter]->x,plane[counter]->y,plane[counter]->z);
	//printf("NEW WORLD CLICK POSITION X  %f,  Y %f\n",position.x, position.y);
	
	if((position.x >= plane[counter]->x-20) && (position.x <= plane[counter]->x + TAM_PLANE+20) && 
	   (position.y >= plane[counter]->y-20) && (position.y <= plane[counter]->y + TAM_PLANE+20))
		return true;
	return false;	
}

void StageOne::createItem(){
	if ((counter !=0)&&(counter <= MAX_N_PTS))
		plane[counter]->setPosition(newlevel.rotationFlag);
}

void StageOne::reset(){
	counter = 0;
	
	speedOfRotation = 0.2f;
	colorPlanes = 0xFFDE00;
	colorLines= 0xA4A18C;
	createItem();
}

void StageOne::allocatePlanes(){
	plane = new Plane*[MAX_N_PTS];
	for(int i = 0; i < MAX_N_PTS; i++){
		plane[i] = new Plane();
	}	
}

void StageOne::freePlanes(){
	for(int i = MAX_N_PTS-1; i = 0; i--){
		free(plane[i]);
	}	
	free(plane);
}

void StageOne::close(){
	freePlanes();
}

CGPoint StageOne::GetOGLPos(float x, float y)
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
