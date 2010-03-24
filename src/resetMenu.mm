/*
 *  resetMenu.mm
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "resetMenu.h"

ResetMenu::ResetMenu(){
	textColor = COLOR_RESET_TEXT;
	buttonColor = COLOR_RESET_BUTTON;
	tempesta.loadFont("pf_tempesta_seven.ttf", 6);
}

void ResetMenu::draw(){
	//--------- CONFIRM RESET BUTTON		
	ofSetColor(buttonColor);
	ofRect(CONFIRMRESETBUTTON_X, CONFIRMRESETBUTTON_Y, CONFIRMRESETBUTTON_WIDTH, CONFIRMRESETBUTTON_HEIGHT);
	ofRect(ABORTCONFIRMRESETBUTTON_X, ABORTCONFIRMRESETBUTTON_Y, ABORTCONFIRMRESETBUTTON_WIDTH, ABORTCONFIRMRESETBUTTON_HEIGHT);
	ofRect(PRINT_SCREEN_BUTTON_X, PRINT_SCREEN_BUTTON_Y, PRINT_SCREEN_BUTTON_WIDTH, PRINT_SCREEN_BUTTON_HEIGHT);
	ofSetColor(textColor);
	tempesta.drawString("RESET",CONFIRMRESETBUTTON_X+10,CONFIRMRESETBUTTON_Y+25);
	tempesta.drawString("CONTINUE", ABORTCONFIRMRESETBUTTON_X+1, ABORTCONFIRMRESETBUTTON_Y+25);
	tempesta.drawString("SCREEN", PRINT_SCREEN_BUTTON_X+6, PRINT_SCREEN_BUTTON_Y+25);
}

void ResetMenu::setTextColor(int color){
	textColor = color;
}

void ResetMenu::setButtonColor(int color){
	buttonColor = color;
}