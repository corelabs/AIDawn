/*
 *  circle.cpp
 *  AIDawn
 *
 *  Created by Rez on 3/9/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "circle.h"

Circle::Circle(){
	x = 0; cir.x = 0;
	y = 0; cir.y = 0;
	z = 0; cir.z = 0;
	
	circleColor = 0xffde00;
	lineColor = 0xa4a18c;
}

Circle::Circle(int posX, int posY, int posZ){
	x = posX; cir.x = 0;
	y = posY; cir.y = 0;
	z = posZ; cir.z = 0;
	
	circleColor = 0xffde00;
	lineColor = 0xa4a18c;
}

void Circle::setCircleColor(int color){
	circleColor = color;
}

void Circle::setLineColor(int color){
	lineColor = color;
}

void Circle::setPosition(int posX, int posY, int posZ){
	x = posX; cir.x = 0;
	y = posY; cir.y = 0;
	z = posZ; cir.z = 0;
}

void Circle::setPosition(rotationType flag){
	switch (flag) {
		case X:
			//CASE X
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((70)+ TAM_PLANE, (110)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);						
			break;
			
		case Y:
			//CASE Y
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);

			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((20)+ TAM_PLANE, (90)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((20)+ TAM_PLANE, (90)- TAM_PLANE);
			
			
			if ((abs(cir.x)>70)||(abs(cir.z)>70)){
				cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);
				printf("PRE 1 X %f, Z %f, Y %f\n", cir.x, cir.z, cir.y);
				
			} else if ((abs(cir.x)>50)||(abs(cir.z)>50)){
				cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (80)- TAM_PLANE);
				printf("PRE 2 X %f, Z %f, Y %f\n", cir.x, cir.z, cir.y);
				
			} else if ((abs(cir.x)>40)||(abs(cir.z)>40)) {
				cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((100)+ TAM_PLANE, (125)- TAM_PLANE);
				printf("PRE 3 X %f, Z %f, Y %f\n", cir.x, cir.z, cir.y);
				
			} else if ((abs(cir.x)<41)&&(abs(cir.z)<41)){
				cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((115)+ TAM_PLANE, (165)- TAM_PLANE);
				printf("PRE 4 X %f, Z %f, Y %f\n", cir.x, cir.z, cir.y);
			}
			break;
			
		case Z:
			//CASE Z
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((70)+ TAM_PLANE, (110)- TAM_PLANE);					
			break;
			
		case XY:
			//CASE XY
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case YZ:
			//CASE YZ
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case XZ:
			//CASE XZ
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case X-YZ:
			//CASE X-YZ
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		default:
			//CASE Y
			cir.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (130)- TAM_PLANE);
			cir.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);
			cir.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);							
			break;
	}
	x = cir.x;
	y = cir.y;
	z = cir.z;
}

void Circle::draw(){
	GLfloat vertices[720];
	//GLfloat stroke[720];
	
	for (int i = 0; i < 720; i += 3) {
		vertices[i] = cir.x+(cos(DEGREES_TO_RADIANS(i/2)) * 10);
		vertices[i+1] = cir.y+(sin(DEGREES_TO_RADIANS(i/2)) * 10);
		vertices[i+2] = cir.z;
	}
	
	ofSetColor(lineColor);
	ofSetColor(circleColor);
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glEnableClientState(GL_VERTEX_ARRAY);
	glDrawArrays(GL_TRIANGLE_FAN, 0, 240);
	

}

void Circle::drawLine(Circle *circle){
	ofSetColor(lineColor);
	GLfloat vertices[] = {circle->x, circle->y, circle->z, cir.x, cir.y, cir.z};
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glDrawArrays(GL_LINE_STRIP, 0, 2);
}

void Circle::rotated(float speed, ofxVec3f rotation){
	cir = cir.rotated(speed, rotation);
	x = cir.x;
	y = cir.y;
	z = cir.z;
}
