/*
 *  button.mm
 *  AIDawn
 *
 *  Created by CORE LABS on 3/15/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *y 
 */

#include "button.h"

Button::Button(int type){
	w = h = KEYSIZE;
	buttonColor = 0xFFDE00;
	setPosition(type);
	
	key.loadFont(ofToDataPath("pf_tempesta_seven.ttf"),FONTSIZE);
	
}

void Button::draw(){
	ofSetColor(buttonColor);
	ofRect(boxX, boxY, w, h);
	
	ofSetColor(30, 30, 30);
	key.drawString(character, x, y); 

	
}

void Button::setPosition(int type){  
	switch (type) {
		case A:		name = A;		boxX= 8;					boxY = FIRSTROW_Y-15;	x = 10;					y = FIRSTROW_Y;   	strcpy(character, "A");		break;
		case B:		name = B;		boxX= 18+KEYDISTANCE;		boxY = FIRSTROW_Y-15;	x = 20+KEYDISTANCE;		y = FIRSTROW_Y;		strcpy(character, "B"); 	break;
		case C:		name = C;		boxX= 28+KEYDISTANCE*2;		boxY = FIRSTROW_Y-15;	x = 30+KEYDISTANCE*2;	y = FIRSTROW_Y;		strcpy(character, "C"); 	break;
		case D:		name = D;		boxX= 38+KEYDISTANCE*3;		boxY = FIRSTROW_Y-15;	x = 40+KEYDISTANCE*3;	y = FIRSTROW_Y;		strcpy(character, "D");  	break;
		case E:		name = E;		boxX= 48+KEYDISTANCE*4;		boxY = FIRSTROW_Y-15;	x = 50+KEYDISTANCE*4;	y = FIRSTROW_Y;   	strcpy(character, "E");  	break;
		case F:		name = F;		boxX= 58+KEYDISTANCE*5;		boxY = FIRSTROW_Y-15;	x = 60+KEYDISTANCE*5;	y = FIRSTROW_Y;   	strcpy(character, "F");  	break;
		case G:		name = G;		boxX= 68+KEYDISTANCE*6;		boxY = FIRSTROW_Y-15;	x = 70+KEYDISTANCE*6;	y = FIRSTROW_Y;   	strcpy(character, "G");  	break;
		case H:		name = H;		boxX= 78+KEYDISTANCE*7;		boxY = FIRSTROW_Y-15;	x = 80+KEYDISTANCE*7;	y = FIRSTROW_Y;   	strcpy(character, "H");  	break;
		case I:		name = I;		boxX= 88+KEYDISTANCE*8;		boxY = FIRSTROW_Y-15;	x = 90+KEYDISTANCE*8;	y = FIRSTROW_Y;   	strcpy(character, "I");  	break;
		
		case J:		name = J;		boxX= 8;					boxY = SECONDROW_Y-15;	x = 10;					y = SECONDROW_Y;    strcpy(character, "J");  	break;
		case K:		name = K;		boxX= 18+KEYDISTANCE;		boxY = SECONDROW_Y-15;	x = 20+KEYDISTANCE;		y = SECONDROW_Y;    strcpy(character, "K");  	break;
		case L:		name = L;		boxX= 28+KEYDISTANCE*2;		boxY = SECONDROW_Y-15;	x = 30+KEYDISTANCE*2;	y = SECONDROW_Y;    strcpy(character, "L");  	break;
		case M:		name = M;		boxX= 38+KEYDISTANCE*3;		boxY = SECONDROW_Y-15;	x = 40+KEYDISTANCE*3;	y = SECONDROW_Y;    strcpy(character, "M");  	break;
		case N:		name = N;		boxX= 48+KEYDISTANCE*4;		boxY = SECONDROW_Y-15;	x = 50+KEYDISTANCE*4;	y = SECONDROW_Y;    strcpy(character, "N");  	break;
		case O:		name = O;		boxX= 58+KEYDISTANCE*5;		boxY = SECONDROW_Y-15;	x = 60+KEYDISTANCE*5;	y = SECONDROW_Y;    strcpy(character, "O");  	break;
		case P:		name = P;		boxX= 68+KEYDISTANCE*6;		boxY = SECONDROW_Y-15;	x = 70+KEYDISTANCE*6;	y = SECONDROW_Y;    strcpy(character, "P");  	break;
		case Q:		name = Q;		boxX= 78+KEYDISTANCE*7;		boxY = SECONDROW_Y-15;	x = 80+KEYDISTANCE*7;	y = SECONDROW_Y;    strcpy(character, "Q");  	break;
		case R:		name = R;		boxX= 88+KEYDISTANCE*8;		boxY = SECONDROW_Y-15;	x = 90+KEYDISTANCE*8;	y = SECONDROW_Y;    strcpy(character, "R");  	break;
			
		case S:		name = S;		boxX= 8;					boxY = THIRDROW_Y-15;	x = 10;					y = THIRDROW_Y;   	strcpy(character, "S");  	break;
		case T:		name = T;		boxX= 18+KEYDISTANCE;		boxY = THIRDROW_Y-15;	x = 20+KEYDISTANCE;		y = THIRDROW_Y;   	strcpy(character, "T");  	break;
		case U:		name = U;		boxX= 28+KEYDISTANCE*2;		boxY = THIRDROW_Y-15;	x = 30+KEYDISTANCE*2;	y = THIRDROW_Y;   	strcpy(character, "U");  	break;
		case V:		name = V;		boxX= 38+KEYDISTANCE*3;		boxY = THIRDROW_Y-15;	x = 40+KEYDISTANCE*3;	y = THIRDROW_Y;   	strcpy(character, "V");  	break;
		case W:		name = W;		boxX= 48+KEYDISTANCE*4;		boxY = THIRDROW_Y-15;	x = 50+KEYDISTANCE*4;	y = THIRDROW_Y;   	strcpy(character, "W");  	break;
		case X_KEY: name = X_KEY;	boxX= 58+KEYDISTANCE*5;		boxY = THIRDROW_Y-15;	x = 60+KEYDISTANCE*5;	y = THIRDROW_Y;   	strcpy(character, "X");  	break;
		case Y_KEY: name = Y_KEY;	boxX= 68+KEYDISTANCE*6;		boxY = THIRDROW_Y-15;	x = 70+KEYDISTANCE*6;	y = THIRDROW_Y;   	strcpy(character, "Y");  	break;
		case Z_KEY: name = Z_KEY;	boxX= 78+KEYDISTANCE*7;		boxY = THIRDROW_Y-15;	x = 80+KEYDISTANCE*7;	y = THIRDROW_Y;   	strcpy(character, "Z");  	break;
			
		case SPACE: name = SPACE;	boxX= 8;					boxY = FOURTHROW_Y-15;	x = 10;					y = FOURTHROW_Y;    strcpy(character, "SPACE"); w = 60; break;
		case BACK:	name = BACK;	boxX= 8;					boxY = FOURTHROW_Y-15;	x = 10;					y = FOURTHROW_Y;   	strcpy(character, "BACK");	w = 60; break;
		case INTRO: name = INTRO;	boxX= 38+KEYDISTANCE*3;		boxY = FOURTHROW_Y-15;	x = 40+KEYDISTANCE*3;	y = FOURTHROW_Y;    strcpy(character, "OK");  	w = 60; break;
			
		default:	break;
	}
}

void Button::setButtonColor(int color){
	buttonColor = color;
}