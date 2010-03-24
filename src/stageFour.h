/*
 *  stageFour.h
 *  AIDawn
 *
 *  Created by CORE LABS on 3/17/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _STAGEFOUR_H_
#define _STAGEFOUR_H_

#include "ofMain.h"
#include "constant.h"
#include "uploadManager.h"
#include "ofxXmlSettings.h"
#include "ofxiPhoneFile.h"
#include "ofxFileLoader.h"

class StageFour {
private:
	//vars
	ofTrueTypeFont 	tempesta;
	ofTrueTypeFont 	frabk;
	int				textColor;
	int				buttonColor;
	char			sendStatusString[255];
	bool			firstTime;
	bool			errorXML;

	ofxXmlSettings XML;
	ofxiPhoneFile rawXML;
	
	int		listrank;
	string	listname;		
	float	listtime;

	char  rankScore[255];
	char  timeScore[255];
	
	

	
	
public:
	//vars
	string		resultList;
	bool		startXMLFlag;
	//constructor
	StageFour();
	
	//methods
	void		draw(); //draw plane
	void		update();
	void		setStage(int level);
	bool		checkHit(int x, int y);
	void		reset();
	void		close();
	void		setStatusText(char text[255]);
	
};

#endif