/*
 *  plane.m
 *  iPhone AI Dawn copy
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "plane.h"

Plane::Plane(){
	x = 0; p.x = 0;
	y = 0; p.y = 0;
	z = 0; p.z = 0;
	planeColor = 0xFFDE00;
	lineColor  = 0xA4A18C;
}

Plane::Plane(int posX, int posY, int posZ){
	x = posX; p.x = posX;
	y = posY; p.y = posY;
	z = posZ; p.z = posZ;
	planeColor	  = 0xFFDE00;
	lineColor     = 0xA4A18C;
}

void Plane::setPlaneColor(int color){
	planeColor = color;
}

void Plane::setLineColor(int color){
	lineColor = color;
}

void Plane::setPosition(int posX, int posY, int posZ){
	x = posX; p.x = posX;
	y = posY; p.y = posY;
	z = posZ; p.z = posZ;
}

void Plane::setPosition(rotationType flag){
	switch (flag) {
		case X:
			//CASE X
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((70)+ TAM_PLANE, (110)- TAM_PLANE);
			p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);						
			break;
			
		case Y:
			//CASE Y
			
			// FOR X AND Z < 41 , Y CAN BE UP TO 155
			// FOR X AND Z < 51 , Y CAN BE UP TO 115
			// FOR X AND Z < 70 , Y CAN BE UP TO 70
			// FOR X AND Z < 80 , Y CAN BE UP TO 60
						
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((20)+ TAM_PLANE, (90)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((20)+ TAM_PLANE, (90)- TAM_PLANE);
			

			if ((abs(p.x)>70)||(abs(p.z)>70)){
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);
				printf("PRE 1 X %f, Z %f, Y %f\n", p.x, p.z, p.y);

			} else if ((abs(p.x)>50)||(abs(p.z)>50)){
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (80)- TAM_PLANE);
				printf("PRE 2 X %f, Z %f, Y %f\n", p.x, p.z, p.y);
				
			} else if ((abs(p.x)>40)||(abs(p.z)>40)) {
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((100)+ TAM_PLANE, (125)- TAM_PLANE);
				printf("PRE 3 X %f, Z %f, Y %f\n", p.x, p.z, p.y);

			} else if ((abs(p.x)<41)&&(abs(p.z)<41)){
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((115)+ TAM_PLANE, (165)- TAM_PLANE);
				printf("PRE 4 X %f, Z %f, Y %f\n", p.x, p.z, p.y);
			}
						
			break;
			
		case Z:
			//CASE Z
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((50)+ TAM_PLANE, (70)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((70)+ TAM_PLANE, (110)- TAM_PLANE);					
			break;
			
		case XY:
			//CASE XY
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case YZ:
			//CASE YZ
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case XZ:
			//CASE XZ
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		case X-YZ:
			//CASE X-YZ
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((40)+ TAM_PLANE, (70)- TAM_PLANE);
			break;
			
		default:
			//CASE Y
			p.x = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((20)+ TAM_PLANE, (90)- TAM_PLANE);
			p.z = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((20)+ TAM_PLANE, (90)- TAM_PLANE);
			
			
			if ((abs(p.x)>70)||(abs(p.z)>70)){
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (70)- TAM_PLANE);
				printf("PRE 1 X %f, Z %f, Y %f\n", p.x, p.z, p.y);
				
			} else if ((abs(p.x)>50)||(abs(p.z)>50)){
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((30)+ TAM_PLANE, (80)- TAM_PLANE);
				printf("PRE 2 X %f, Z %f, Y %f\n", p.x, p.z, p.y);
				
			} else if ((abs(p.x)>40)||(abs(p.z)>40)) {
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((100)+ TAM_PLANE, (125)- TAM_PLANE);
				printf("PRE 3 X %f, Z %f, Y %f\n", p.x, p.z, p.y);
				
			} else if ((abs(p.x)<41)&&(abs(p.z)<41)){
				p.y = pow(-1.0f,int(ofRandom(1.5, 2.5)))*ofRandom((115)+ TAM_PLANE, (165)- TAM_PLANE);
				printf("PRE 4 X %f, Z %f, Y %f\n", p.x, p.z, p.y);
			}					
			break;
	}
	x = p.x;
	y = p.y;
	z = p.z;
}

void Plane::draw(){
	ofSetColor(planeColor);
	GLfloat vertices[] ={p.x, p.y, p.z, p.x+TAM_PLANE, p.y, p.z, p.x, p.y+TAM_PLANE, p.z, p.x+TAM_PLANE, p.y+TAM_PLANE, p.z};
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

void Plane::drawLine(Plane *plane){
	ofSetColor(lineColor);
	GLfloat vertices[] = {plane->x+TAM_PLANE/2, plane->y+TAM_PLANE/2, plane->z, p.x+TAM_PLANE/2, p.y+TAM_PLANE/2, p.z};
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glDrawArrays(GL_LINE_STRIP, 0, 2);
}

void Plane::rotated(float speed, ofxVec3f rotation){
	p = p.rotated(speed, rotation);
	x = p.x;
	y = p.y;
	z = p.z;
}