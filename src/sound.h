/*
 *  sound.h
 *  iPhone AI Dawn classes
 *
 *  Created by Rez on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _SOUND_H_
#define _SOUND_H_

#include "ofMain.h"
#include "ofxALSoundPlayer.h"
enum	  soundType {BEGIN,RESET_CONFIRMED,MAX_PLANES_REACHED,NORMAL_HIT,SPECIAL_HIT,NEWSTAGE,GAMEOVER};

class Sound  {
	


	public:
	
		Sound(ofSimpleApp *parent);	
		void set(soundType soundFlag);
		void setStage(int level);

		ofxALSoundPlayer  bso1; //sound player
	    ofxALSoundPlayer  bso2; //sound player
		ofxALSoundPlayer  bso3; //sound player
		ofxALSoundPlayer  bso4; //sound player	
		ofxALSoundPlayer  gameOver;   //sound player
		ofxALSoundPlayer  connection; //sound player
		ofxALSoundPlayer  tenunits;   //sound player
	
		soundType soundFlag;
			
};

#endif