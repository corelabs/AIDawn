/*
 *  introStage.h
 *  AIDawn
 *
 *  Created by Rez on 3/10/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _INTROSTAGE_H_
#define _INTROSTAGE_H_

#include "ofMain.h"
#include "keyboardManager.h"
#include "constant.h"


class IntroStage {
	private:
		//vars
		ofTrueTypeFont 	tempesta;
		ofTrueTypeFont 	frabk;
		int				textColor;
		int				buttonColor;
		int				stageLevel;
		float			totalTime;
		
	public:
		//vars
		KeyboardManager *keyboard;
		int				lineColor;
		
		//constructor
		IntroStage();
		
		//methods
		void			draw(); 
		void			setLevel(int level);
		void			setFinalTime(float time);
		void			setTextColor(int color);
		void			setButtonColor(int color);
};


#endif