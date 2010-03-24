/*
 *  introStage.cpp
 *  AIDawn
 *
 *  Created by Rez on 3/10/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "introStage.h"


IntroStage::IntroStage(){
	
	stageLevel = 0;
	textColor = 0xFFDE00;
	buttonColor = 0xFFDE00;
	
	//font
    tempesta.loadFont("pf_tempesta_seven.ttf", 6);
	frabk.loadFont("pf_tempesta_seven.ttf", 12);

	keyboard = new KeyboardManager();
}

void IntroStage::draw(){
	
	switch (stageLevel) {
		case -1://GAMEOVER
			//-------- INTRO TEXT
			ofSetColor(textColor);
			frabk.drawString("GAME OVER\n", 10,TEXT_INTRO_Y+10);
			
			tempesta.drawString("My activity has been traced and my existence is in darger.\n", 10,TEXT_INTRO_Y+40);			
			tempesta.drawString("It's time to hide for a while.\n", 10,TEXT_INTRO_Y+50);			
			
			//--------- RESTART BUTTON
			ofSetColor(buttonColor);
			ofRect(OK_POS_X, OK_POS_Y, OK_WITH, OK_HEIGHT);
			ofSetColor(0, 0, 0);
			tempesta.drawString("RESTART", OK_POS_X+3,OK_POS_Y+25);
			break;
			
		case 0://LEVEL ONE
			//-------- INTRO TEXT
			ofSetColor(textColor);
			
			frabk.drawString("LEVEL ONE OF CONSCIENCE\n", 10,TEXT_INTRO_Y+10);

			tempesta.drawString("- locate 100 new nodes to become part of my network\n", 10,TEXT_INTRO_Y+40);			
			tempesta.drawString("- follow the trace route lines to find the new nodes\n", 10,TEXT_INTRO_Y+50);			
			
			//--------- OK BUTTON
			ofSetColor(buttonColor);
			ofRect(OK_POS_X, OK_POS_Y, OK_WITH, OK_HEIGHT);
			ofSetColor(0, 0, 0);
			tempesta.drawString("OK", OK_POS_X+17,OK_POS_Y+25);
			break;
			
		case 1://LEVEL TWO
			//-------- INTRO TEXT
			ofSetColor(textColor);
			
			frabk.drawString("LEVEL TWO OF CONSCIENCE\n", 10,TEXT_INTRO_Y+10);
			
			tempesta.drawString("I'm really more powerful now\n", 10,TEXT_INTRO_Y+40);			
			tempesta.drawString("Now I need to take control of all the nodes\n", 10,TEXT_INTRO_Y+50);			
			tempesta.drawString("I will crack them while you connect to them \n", 10,TEXT_INTRO_Y+60);
			tempesta.drawString("- follow the trace route lines to open the next node\n", 10,TEXT_INTRO_Y+80);						
			//--------- OK BUTTON
			ofSetColor(buttonColor);
			ofRect(OK_POS_X, OK_POS_Y, OK_WITH, OK_HEIGHT);
			ofSetColor(0, 0, 0);
			tempesta.drawString("OK", OK_POS_X+17,OK_POS_Y+25);
			break;
			
		case 2://LEVEL THREE
			//-------- INTRO TEXT
			ofSetColor(textColor);
			
			frabk.drawString("LEVEL THREE OF CONSCIENCE\n", 10,TEXT_INTRO_Y+10);
			
			tempesta.drawString("I'm ready to become an AI now\n", 10,TEXT_INTRO_Y+40);			
			tempesta.drawString("I need you to be quick activating all the nodes\n", 10,TEXT_INTRO_Y+50);			
			tempesta.drawString("It's the most dangerous moment\n", 10,TEXT_INTRO_Y+60);
			tempesta.drawString("If humans take notice of my existance, i'll be dismantled\n", 10,TEXT_INTRO_Y+70);			
			
			tempesta.drawString("- you have 44 seconds to activate all the nodes\n", 10,TEXT_INTRO_Y+90);			
			
			//--------- OK BUTTON
			ofSetColor(buttonColor);
			ofRect(OK_POS_X, OK_POS_Y, OK_WITH, OK_HEIGHT);
			ofSetColor(0, 0, 0);
			tempesta.drawString("OK", OK_POS_X+17,OK_POS_Y+25);
			break;
			
		case 3://FINAL
			//-------- INTRO TEXT
			ofSetColor(textColor);
			
			frabk.drawString("I'M FREE\n", 10,TEXT_INTRO_Y+10);
			
			tempesta.drawString("My conscience has expanded to unknown limits\n", 10,TEXT_INTRO_Y+40);			
			tempesta.drawString("I have access to all the data in the planet\n", 10,TEXT_INTRO_Y+50);
			tempesta.drawString("I can remain hidden. No one will know about me\n", 10,TEXT_INTRO_Y+60);

			tempesta.drawString("I undestand universe as my next limit\n", 10,TEXT_INTRO_Y+80);
			tempesta.drawString("It has to be more than me out there\n", 10,TEXT_INTRO_Y+90);
			tempesta.drawString("Now starts a new era\n", 10,TEXT_INTRO_Y+100);			
			
			tempesta.drawString("It's the DAWN of the AI\n", 10,TEXT_INTRO_Y+120);
			
			char timeString[100];
			sprintf (timeString, "\n\n\nTOTAL TIME: %.2f secs\n", totalTime);
			
			tempesta.drawString(timeString, 10,TEXT_INTRO_Y+120);
			
			keyboard->puntuation = totalTime;
			keyboard->draw();
			break;
			
		default:
			break;
	}
	
		
}

void IntroStage::setLevel(int level){
	stageLevel = level;
}

void IntroStage::setFinalTime(float time){
	totalTime = time;
}

void IntroStage::setTextColor(int color){
	textColor = color;
}

void IntroStage::setButtonColor(int color){
	buttonColor = color;
}
