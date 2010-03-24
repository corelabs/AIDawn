/*
 *  keyboardManager.mm
 *  AIDawn
 *
 *  Created by Rez on 3/15/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "keyboardManager.h"

//--------------------------------------------------------

KeyboardManager::KeyboardManager(){
	//allocate memory for buttons
	button = new Button*[29];
	for(int i = 0; i < 29; i++){
		button[i] = new Button(i);
	}
	
	
	//setup screen text
	ofBackground(30, 30, 30);
	strcpy(name, "NAME");
	
	inputName.loadFont(ofToDataPath("pf_tempesta_seven.ttf"),FONTSIZE);
	
	okPressed	= false;
}

void KeyboardManager::update(){

}

void KeyboardManager::draw(){
	
	ofSetColor(255, 200, 0);

	// TEXT INPUT
	ofRect(8,ZEROROW_Y-15, 305, KEYSIZE);
	ofSetColor(30,30,30);
	ofRect(9,ZEROROW_Y-14, 303, KEYSIZE-2);
	
	ofSetColor(255,0,0);
	inputName.drawString(name, 10, ZEROROW_Y);
	
	//print keyboard
	for (int i=0; i<29; i++) {
		//dirty tweak to avoid "BACK" space
		if (strcmp(button[i]->character,"SPACE")!=0){
			button[i]->draw();
		}
	}
	
	if(okPressed){
		//Waiting panel
		ofSetColor(0xFF0000);
		ofRect(30, TEXT_INTRO_Y+160, 78+KEYDISTANCE*7, KEYSIZE*2);
		ofSetColor(30,30,30);
		inputName.drawString("Sending info ...", 120, TEXT_INTRO_Y+160+KEYSIZE);
	}
}

void KeyboardManager::exit() {
	printf("exit()\n");
}

void KeyboardManager::mousePressed(int x, int y, int button){
	
	//char[1] letter;
	
	//strcpy(name, letter);

}

void KeyboardManager::checkHit(int x, int y){
	int wKey = KEYSIZE;
	for (int i=0; i<29; i++) {		
		//SPACE//OK//RETURN
		if(button[i]->boxY >= FOURTHROW_Y-15){wKey=60;}
		if((x >= button[i]->boxX) && (x <= button[i]->boxX+wKey) && (y >= button[i]->boxY) && (y <= button[i]->boxY+KEYSIZE)){
			button[i]->setButtonColor(0XFF0000);
			if (wKey==60) {
				actionText(i);
			}else{
				if(strlen(name)<255) 
					strcat(name, button[i]->character);
			}
			
			lastClicked = i;
		}

	}
}


void KeyboardManager::actionText(int i){
		switch (button[i]->name) {
			//case SPACE:	strcat(name, " ");					break;
			case BACK:	if(strlen(name)>0){
				char a[255];
				bzero(a, 254);
				strcpy(a, name);
				bzero(name, 254);
				memcpy(name, a, strlen(a)-1);
				printf("TEXTO BACK %s\n", name);}
															break;
			case INTRO: //Waiting panel
				//printf("IN WAITINNNNNGG!!!\n");
				okPressed=true;
				sendPoints();								break;
			default:
				break;
		}
}

void KeyboardManager::sendPoints(){
	
	char points[10];
	sprintf(points, "%.2f", puntuation);
	sprintf(responseText, "ERROR! - Can't send information to server.\n Check your connections!");
	UploadManager *uploader = new UploadManager();
	if (uploader->send(name, points) == ERR){
		printf("%s\n", responseText);
		//printAlert(errorText);
	}else {
		sprintf(responseText, "Score uploaded!");
		printf("%s\n", responseText);
	}
}

void KeyboardManager::keyReleassed(){
	button[lastClicked]->setButtonColor(0XFFDE00);
}
