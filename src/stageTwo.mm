/*
 *  stageTwo.cpp
 *  AIDawn
 *
 *  Created by Rez on 3/5/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "stageTwo.h"


StageTwo::StageTwo(){
	counter = 0;
	
	speedOfRotation = 0.4f;
	
	color = 0xFFDE00;
	colorLines= 0xA4A18C;
	allocateCircles();

}


void StageTwo::draw(){
	for (int i = 0; i <= counter; i++){
		
		//draw circles
		circle[i]->setCircleColor(color);
		circle[i]->draw();
		
		//draw lines
		if((i-1) >= 0){
			circle[i]->setLineColor(colorLines);
			circle[i]->drawLine(circle[i-1]);
		}
	}	
}

void StageTwo::update(){
	/// FUNCION CAMBIO DE ESTADO
	
	newlevel.set(counter);
	color = newlevel.color;
	colorLines = newlevel.linesColor;
	for (int i = 0; i <= counter; i++)
		circle[i]->rotated(speedOfRotation, newlevel.rotation);
	
}

bool StageTwo::checkHit(int x, int y){
	CGPoint position;
	position = GetOGLPos((float)x, (float)y);
	
	printf("SCREEN CLICK POSx :%d, POSy :%d \n",x,y );
	printf("WORLD  circle POSx :%d, POSy :%d, POSz :%d\n",circle[counter]->x,circle[counter]->y,circle[counter]->z);
	printf("NEW WORLD CLICK POSITION X  %f,  Y %f\n",position.x, position.y);
	
	if((position.x >= circle[counter]->x-20) && (position.x <= circle[counter]->x + TAM_PLANE+20) && 
	   (position.y >= circle[counter]->y-20) && (position.y <= circle[counter]->y + TAM_PLANE+20))
		return true;
	return false;	
}

void StageTwo::createItem(){
	if ((counter !=0)&&(counter <= MAX_N_PTS))
		circle[counter]->setPosition(newlevel.rotationFlag);
}

void StageTwo::reset(){
	counter = 0;
	
	speedOfRotation = 0.2f;
	color = 0xffde00;
	colorLines= 0xa4a18c;
	createItem();
}

void StageTwo::allocateCircles(){
	circle = new Circle*[MAX_N_PTS];
	for(int i = 0; i < MAX_N_PTS; i++){
		circle[i] = new Circle();
	}	
}

void StageTwo::freeCircles(){
	for(int i = MAX_N_PTS-1; i = 0; i--){
		free(circle[i]);
	}	
	free(circle);
}

void StageTwo::close(){
	freeCircles();
}

CGPoint StageTwo::GetOGLPos(float x, float y)
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

