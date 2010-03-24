/*
 *  resetMenu.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 CORE LABS. All rights reserved.
 *
 */

#ifndef _RESETMENU_H_
#define _RESETMENU_H_

#include "ofMain.h"
#include "ofxVectorMath.h"


#define CONFIRMRESETBUTTON_X			0
#define CONFIRMRESETBUTTON_Y			400
#define CONFIRMRESETBUTTON_WIDTH		50
#define CONFIRMRESETBUTTON_HEIGHT		50

#define ABORTCONFIRMRESETBUTTON_X		CONFIRMRESETBUTTON_X+60
#define ABORTCONFIRMRESETBUTTON_Y		400
#define ABORTCONFIRMRESETBUTTON_WIDTH	50
#define ABORTCONFIRMRESETBUTTON_HEIGHT	50

#define PRINT_SCREEN_BUTTON_X			ABORTCONFIRMRESETBUTTON_X+60
#define PRINT_SCREEN_BUTTON_Y			400
#define PRINT_SCREEN_BUTTON_WIDTH		50
#define PRINT_SCREEN_BUTTON_HEIGHT		50

#define COLOR_RESET_BUTTON				0x505050
#define COLOR_RESET_TEXT		0x000000

enum resetMenuType {RESET, CONTINUE, SCREEN, NON};

class ResetMenu {
	private:
		//vars
		ofTrueTypeFont 	tempesta;
		int textColor;
		int buttonColor;
	
	public:
		//constructor
		ResetMenu();
		
		//methods
		void draw(); //draw plane
		void setTextColor(int color);
		void setButtonColor(int color);
	
};

#endif