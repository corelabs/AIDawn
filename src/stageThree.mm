/*
 *  stageThree.cpp
 *  AIDawn
 *
 *  Created by Rez on 3/6/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "stageThree.h"

StageThree::StageThree(){

	angle	= 0.25f;
	counter	= 0;
	
	speedOfRotation = 0.4f;
	
	colorCube = 0xFFDE00;
	colorLines= 0xA4A18C;
	
	tam_cube = TAM_PLANE;
	
	allocateCubes();
	
}

void StageThree::draw(){
	glPushMatrix();
	glRotatef(angle, newlevel.rotation.x, newlevel.rotation.y, newlevel.rotation.z);
		for (int i = 0; i <= counter; i++){
			
			//draw planes
			cube[i]->setCubeColor(colorCube);
			if (i == 0) {
				cube[i]->draw(tam_cube);
			}else {
				cube[i]->draw(TAM_PLANE);
			}

			//draw lines
			if((i-1) >= 0){
				cube[i]->setLineColor(colorLines);
				cube[i]->drawLine(cube[i-1]);
			}
		}	
	glPopMatrix();
	angle ++;

}


void StageThree::update(){
	/// FUNCION CAMBIO DE ESTADO
	
	newlevel.set(counter);
	colorCube = newlevel.color;
	colorLines = newlevel.linesColor;
	for (int i = 0; i <= counter; i++){
		cube[i]->rotated(speedOfRotation, newlevel.rotation);
		//cube[i]->rotated();
	}
}

void StageThree::createItem(){
	if ((counter !=0)&&(counter <= MAX_N_PTS))
		cube[counter]->setPosition(newlevel.rotationFlag);
	
}

void StageThree::reset(){
	counter = 0;
	
	//speedOfRotation = 0.2f;
	colorCube = 0xffde00;
	colorLines= 0xa4a18c;
	createItem();
}

bool StageThree::checkHit(int x, int y){

	CGPoint position;
	position = GetOGLPos((float)x, (float)y);
	
//	printf("SCREEN CLICK POSx :%d, POSy :%d \n",x,y );
//	printf("WORLD  Cube POSx :%f, POSy :%f, POSz :%f\n",cube[counter]->x,cube[counter]->y,cube[counter]->z);
//	printf("NEW WORLD CLICK POSITION X  %f,  Y %f\n",position.x, position.y);
	
	/*if((position.x >= cube[counter]->x-20) && (position.x <= cube[counter]->x + TAM_PLANE+20) && 
	   (position.y >= cube[counter]->y-20) && (position.y <= cube[counter]->y + TAM_PLANE+20))
		return true;
	return false;*/
	if((position.x >= cube[0]->x-20) && (position.x <= cube[0]->x + tam_cube+20) && 
	   (position.y >= cube[0]->y-20) && (position.y <= cube[0]->y + tam_cube+20)){
		cube[0]->setPosition(cube[0]->x-1, cube[0]->y-1, cube[0]->z+1);
		tam_cube += 2;
		return true;
	}
	return false;
	
}

void StageThree::allocateCubes(){
	cube = new Cube*[MAX_N_PTS];
	for(int i = 0; i < MAX_N_PTS; i++){
		cube[i] = new Cube();
	}	
}

void StageThree::freeCubes(){
	for(int i = MAX_N_PTS-1; i = 0; i--){
		free(cube[i]);
	}	
	free(cube);
}

void StageThree::close(){
	freeCubes();
}

CGPoint StageThree::GetOGLPos(float x, float y)
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




