/*
 *  cube.mm
 *  AIDawn
 *
 *  Created by CORE LABS on 3/8/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "cube.h"

Cube::Cube(){
	c.x = -5.0f; x = -5.0f;
	c.y = -5.0f; y = -5.0f;
	c.z =  5.0f; z =  5.0f;
	
	cubeColor = 0xFFDE00;
	lineColor = 0xA4A18C;
	
	cubeRotation.set(0, 1, 0);
	
	angle = 1.0f;
}

Cube::Cube(int posX, int posY, int posZ){
	c.x = posX; x = posX;
	c.y = posY; y = posY;
	c.z = posZ; z = posZ;
	
	cubeColor = 0xFFDE00;
	lineColor = 0xA4A18C;
	
	angle = 1.0f;
}

void Cube::setCubeColor(int color){
	cubeColor = color;
}

void Cube::setLineColor(int color){
	lineColor = color;
}

void Cube::setPosition(int posX, int posY, int posZ){
	c.x = posX; x = posX;
	c.y = posY; y = posY;
	c.z = posZ; z = posZ;
}

void Cube::setPosition(rotationType flag){
	switch (flag) {
		case X:
			//CASE X
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((70)+ TAM_PLANE, (110)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);						
			break;
			
		case Y:
			//CASE Y
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (150)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case Z:
			//CASE Z
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((70)+ TAM_PLANE, (110)- TAM_PLANE);					
			break;
			
		case XY:
			//CASE XY
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case YZ:
			//CASE YZ
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case XZ:
			//CASE XZ
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case X-YZ:
			//CASE X-YZ
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		default:
			//CASE Y
			x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (130)- TAM_PLANE);
			y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);
			z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);							
			break;
	}
	c.x = x;
	c.y = y;
	c.z = z;
}

void Cube::rotated(float speed, ofxVec3f rotation){
	//c = c.rotated(0.99f, rotation);
	//cubeRotation = rotation;
	//x = c.x;
	//y = c.y;
	//z = c.z;
}


void Cube::draw(int tam_plan_init){
	//printf("X: %f Y: %f Z:%f\n", c.x, c.y, c.z);

			GLfloat box[] = 
			{
				// FRONT
				x,					y,					z,
				x+tam_plan_init,	y,					z,
				x,					y+tam_plan_init,	z,
				x+tam_plan_init,	y+tam_plan_init,	z,
				
				// BACK
				x,					y,					z-tam_plan_init,
				x+tam_plan_init,	y+tam_plan_init,	z-tam_plan_init,
				x,					y,					z-tam_plan_init,
				x+tam_plan_init,	y+tam_plan_init,	z-tam_plan_init,
				
				// LEFT
				x,					y,					z,
				x,					y+tam_plan_init,	z,
				x,					y,					z-tam_plan_init,
				x,					y+tam_plan_init,	z-tam_plan_init,
				
				// RIGHT
				x+tam_plan_init,	y,					z-tam_plan_init,
				x+tam_plan_init,	y+tam_plan_init,	z-tam_plan_init,
				x+tam_plan_init,	y,					z,
				x+tam_plan_init,	y+tam_plan_init,	z,
				
				// TOP
				x,					y+tam_plan_init,	z,
				x+tam_plan_init,	y+tam_plan_init,	z,
				x,					y+tam_plan_init,	z-tam_plan_init,
				x+tam_plan_init,	y+tam_plan_init,	z-tam_plan_init,
				
				// BOTTOM
				x,					y,					z,
				x,					y,					z-tam_plan_init,
				x+tam_plan_init,	y,					z,
				x+tam_plan_init,	y,					z-tam_plan_init,
			};
			
			ofEnableAlphaBlending();
			
			ofSetColor(cubeColor);
			//glPushMatrix();
			
			//glRotatef(angle, cubeRotation.x, cubeRotation.y, cubeRotation.z);//ENABLE TO ACTIVATE GL ROTATION INSTEAD OLD ROTATION
			glEnable(GL_LIGHT0);
			
			glEnable(GL_DEPTH_TEST);
			glDepthFunc(GL_LEQUAL);	
			
			glVertexPointer(3, GL_FLOAT, 0, box);
			glEnableClientState(GL_VERTEX_ARRAY);
			
			// FRONT AND BACK
			
			//	glColor4f(255.0f, 200.0f, 0.0f, 0.8f);
			glNormal3f(0.0f, 0.0f, 1.0f);
			glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
			glNormal3f(0.0f, 0.0f, -1.0f);
			glDrawArrays(GL_TRIANGLE_STRIP, 4, 4);
			
			// LEFT AND RIGHT
			//	glColor4f(255.0f, 200.0f, 0.0f, 0.8f);
			glNormal3f(-1.0f, 0.0f, 0.0f);
			glDrawArrays(GL_TRIANGLE_STRIP, 8, 4);
			glNormal3f(1.0f, 0.0f, 0.0f);
			glDrawArrays(GL_TRIANGLE_STRIP, 12, 4);
			
			// TOP AND BOTTOM
			//	glColor4f(255.0f, 200.0f, 0.0f, 0.8f);
			glNormal3f(0.0f, 1.0f, 0.0f);
			glDrawArrays(GL_TRIANGLE_STRIP, 16, 4);
			glNormal3f(0.0f, -1.0f, 0.0f);
			glDrawArrays(GL_TRIANGLE_STRIP, 20, 4);
			
			//glPopMatrix();
			
			ofDisableAlphaBlending();
			
			angle++;
			
		
	
	
}

void Cube::drawLine(Cube *cube){

	//glRotatef(angle, 0, 1, 0);
	
	ofSetColor(lineColor);
	GLfloat vertices[] = {0.0f, 0.0f, 0.0f, c.x+TAM_PLANE/2, c.y+TAM_PLANE/2, c.z-TAM_PLANE/2};
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glDrawArrays(GL_LINE_STRIP, 0, 2);

}