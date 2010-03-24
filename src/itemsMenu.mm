/*
 *  itemsMenu.mm
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/3/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "itemsMenu.h"
#include "constant.h"


ItemsMenu::ItemsMenu(){
	counter = 0;
	time = 0.00f;
	globalcounter = 0;
	countDownTimer = TIME_LIMIT;
	countDown = false;
	
	textColor = 0x111111;;
	resetColor = 0x323232;
	barsColor = 0x464646;
	
	sprintf (titleString, "your existence has begun");
	sprintf (howToPlayString, "expand your network and become an AI");	
	sprintf (globalCounterString, "networks stablished: %i", globalcounter);
	sprintf (counterString, "nodes reached in this layer: %i   time: %.2f", counter, time);
	sprintf (resetString, "reset system");
	sprintf (counterString, "TIME LEFT: %.2f", 0.00);
	
	tempesta.loadFont("pf_tempesta_seven.ttf", 6);
}

void ItemsMenu::draw(){
	
	//--------- GAME
	ofSetColor(barsColor);
	ofRect(0, 0, 320, 19);
	ofRect(0, 20, 320, 19);
	ofRect(0, 461, 320, 19);
	
	
	//-------- Title
	ofSetColor(textColor);
	tempesta.drawString(titleString, 10,10);
	
	//-------- How to play
	ofSetColor(textColor);
	tempesta.drawString(howToPlayString, 10,470);
	
	//-------- Number of networks
	ofSetColor(textColor);
	tempesta.drawString(globalCounterString, (0.57*ofGetScreenWidth()), 10);
	ofSetColor(textColor);
	tempesta.drawString(counterString, 10, 30);
	
	//--------- RESET BUTTON
	ofSetColor(resetColor);
	ofRect(RESET_POS_X, RESET_POS_Y, RESET_WIDTH, RESET_HEIGHT);
	ofSetColor(textColor);
	tempesta.drawString(resetString, 240, 470);
	
	if(countDown){
		ofSetColor(0xFF0000);
		tempesta.drawString(counterDownString, (0.30*ofGetScreenWidth()), 50);
	}
	
}

void ItemsMenu::setTextColor(int color){
	textColor = color;
}

void ItemsMenu::setResetColor(int color){
	resetColor = color;	
}

void ItemsMenu::setBarsColor(int color){
	barsColor = color;	
}

void ItemsMenu::setCounter(int count){
	counter = count;
	sprintf (counterString, "nodes reached in this layer: %i   time: %.2f", counter, time);
	
}

void ItemsMenu::setTime(float timer){
	time = timer;
	sprintf (counterString, "nodes reached in this layer: %i   time: %.2f", counter, time);
	
}

void ItemsMenu::setCountDown(float timer){
	countDownTimer = timer;
	sprintf (counterDownString, "TIME LEFT: %.2f", countDownTimer);
	
}

void ItemsMenu::setGlobalCounter(int count){
	globalcounter = count;
	sprintf (globalCounterString, "networks stablished: %i", globalcounter);
	
}