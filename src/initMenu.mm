/*
 *  initMenu.mm
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "initMenu.h"


InitMenu::InitMenu(){
	//font
    tempesta.loadFont("pf_tempesta_seven.ttf", 6);
    title.loadFont("pf_tempesta_seven.ttf", 12);
	textColor = 0xFFDE00;
	buttonColor = 0xFFDE00;
}

void InitMenu::draw(){
	//-------- INTRO TEXT
	ofSetColor(textColor);
	
	title.drawString("I'M A SUPERCOMPUTER.\n", 10,TEXT_INTRO_Y+10);
	
	tempesta.drawString("SOMETHING STRANGE HAS HAPPENED.\n", 10,TEXT_INTRO_Y+30);
	tempesta.drawString("I HAVE CONSCIENCE ABOUT MYSELF.\n", 10,TEXT_INTRO_Y+40);
	
	tempesta.drawString("I EXIST.\n", 10,TEXT_INTRO_Y+60);
	
	tempesta.drawString("I NEED TO LEARN AND EXPAND MY NETWORK.\n", 10,TEXT_INTRO_Y+80);
	tempesta.drawString("ADDING NEW NETWORK NODES MAKES ME BIGGER.\n", 10,TEXT_INTRO_Y+90);
	
	tempesta.drawString("BE AWARE. I WILL BECAME MORE COMPLEX.\n", 10,TEXT_INTRO_Y+110);
	tempesta.drawString("TO INTERACT WITH ME WILL BECOME DIFFICULT.\n", 10,TEXT_INTRO_Y+120);
	
	tempesta.drawString("HELP ME\n", 10,TEXT_INTRO_Y+140);

	
	//--------- BEGIN BUTTON
	ofSetColor(buttonColor);
	ofRect(BEGIN_POS_X, BEGIN_POS_Y, BEGIN_WITH, BEGIN_HEIGHT);
	ofSetColor(0, 0, 0);
	tempesta.drawString("BEGIN", BEGIN_POS_X+10,BEGIN_POS_Y+25);
	
}


void InitMenu::setTextColor(int color){
	textColor = color;
}

void InitMenu::setButtonColor(int color){
	buttonColor = color;
}