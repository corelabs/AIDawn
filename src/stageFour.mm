/*
 *  stageFour.mm
 *  AIDawn
 *
 *  Created by CORE LABS on 3/17/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "stageFour.h"

StageFour::StageFour(){
	//colors
	textColor = 0xFFDE00;
	buttonColor = 0xFFDE00;
	
	//font
    tempesta.loadFont("pf_tempesta_seven.ttf", 6);
	frabk.loadFont("pf_tempesta_seven.ttf", 12);
	
	strcpy(sendStatusString, "No information about sent score");
	
	startXMLFlag = false;
	firstTime = true;
	

		
}


void StageFour::draw(){
	//-------- TEXT
	ofSetColor(textColor);
	
	frabk.drawString("HALL OF FAME\n", 10-ofGetWidth()/2,TEXT_INTRO_Y+10-ofGetHeight()/2);
	tempesta.drawString("these are the best hackers who achieved to free an AI", 10-ofGetWidth()/2,TEXT_INTRO_Y+50-ofGetHeight()/2);
	

	if (startXMLFlag){
		//--------PETICION DEL XML DE LA BASE DE DATOS
		if(firstTime){
			if(!rawXML.openFromURL("http://corelabs.cn/interactive/AIDawn/mySettings.xml")){errorXML=true;}
			XML.loadFromBuffer(string(rawXML.read()));
			XML.pushTag("entries", 0);
			firstTime = false;
		}
	
	
	
		//--------PARSEO Y DRAW DEL XML 
		//push into the first tag and make it the "root"

		if(!errorXML){
			for(int i = 0; i < 15; i++){
				
				//push into the second tree tag and make it the "root"
				XML.pushTag("entry", i);
				
					listrank = XML.getValue("id", 0, 0);
					sprintf(rankScore, "Rank %d ",listrank);
					tempesta.drawString(rankScore, 10-ofGetWidth()/2,TEXT_INTRO_Y+80-ofGetHeight()/2+i*10);

					listname = XML.getValue("titulo", "", 0);		
					tempesta.drawString(listname,60-ofGetWidth()/2,TEXT_INTRO_Y+80-ofGetHeight()/2+i*10);

					listtime = XML.getValue("contenido", 0.0f, 0);
					sprintf(timeScore, "Time %.2f secs ",listtime);
					tempesta.drawString(timeScore, 200-ofGetWidth()/2,TEXT_INTRO_Y+80-ofGetHeight()/2+i*10);

				XML.popTag();
				
			}
		}else {
			ofSetColor(0xFF0000);
			tempesta.drawString("Cannot load Hall Of Fame. Check your connections!!!", 20-ofGetWidth()/2,-ofGetHeight()/4);
		}

	}
	//-------- FIN DEL PARSEO Y DRAW DEL XML 
	
	
	//--------- RESTART BUTTON
	ofSetColor(buttonColor);
	ofRect(OK_POS_X-ofGetWidth()/2, OK_POS_Y-ofGetHeight()/2, OK_WITH, OK_HEIGHT);
	ofSetColor(0, 0, 0);
	tempesta.drawString("RESTART", OK_POS_X+3-ofGetWidth()/2,OK_POS_Y+25-ofGetHeight()/2);
}

void StageFour::update(){


}

bool StageFour::checkHit(int x, int y){
	return false;
}



void StageFour::reset(){

}


void StageFour::close(){
//	freeCircles();
}

void StageFour::setStatusText(char text[255]){
	strcpy(sendStatusString, text);
}

