/*
 *  constant.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _CONSTANT_H_
#define _CONSTANT_H_


#include "ofMain.h"
#include "ofxMultiTouch.h"
#include "ofxVectorMath.h"
#include "ofxALSoundPlayer.h"
#include "newlevel.h"
#include "glu.h"

#define MAX_STRING		255
#define MAX_N_PTS		101
#define TAM_PLANE		10
#define RESET_POS_X		240
#define RESET_POS_Y		465
#define RESET_HEIGHT	10
#define RESET_WIDTH		73
#define ERR				0
#define OK				1
#define WIDTH			ofGetWidth()
#define HEIGHT			ofGetHeight()
//constants for circle
#define RADIUS_CIRCLE	10
#define DEGREES_TO_RADIANS(x) (3.14159265358979323846 * x / 180.0)
#define RANDOM_FLOAT_BETWEEN(x, y) (((float) rand() / RAND_MAX) * (y - x) + x)
//constants for cubes
#define ZEC 5

//constants for last stage
#define TIME_LIMIT      44

//stage text/button constant
#define TEXT_INTRO_Y	50
#define OK_POS_X		135
#define OK_POS_Y		315
#define OK_WITH			50
#define OK_HEIGHT		50

#define VOLUMEMAX (4/3)*PI*40000*300

//keyboard
enum	alphabet {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X_KEY,Y_KEY,Z_KEY,SPACE,BACK,INTRO};
#define  FONTSIZE    6 
#define  KEYSIZE     25
#define  KEYDISTANCE 25
#define  ZEROROW_Y   294
#define  FIRSTROW_Y  ZEROROW_Y+33
#define  SECONDROW_Y FIRSTROW_Y+33
#define  THIRDROW_Y	 SECONDROW_Y+33
#define  FOURTHROW_Y THIRDROW_Y+33

//a borrar...

#define COLORRESET 0x505050



#endif