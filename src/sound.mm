/*
 *  sound.cpp
 *  iPhone AI Dawn classes
 *
 *  Created by Rez on 3/2/10.
 *  Copyright 2010 CORE LABS. All rights reserved.
 *
 */

#include "sound.h"
#include "ofMain.h"

//CONSTRUIR CON sound(this);

Sound::Sound(ofSimpleApp *parent){

	//setup stream and loads sounds
		
    ofSoundStreamSetup(2,0,parent);
	ofSoundStreamStart();
	
	bso1.loadLoopingSound(ofToDataPath("bso_stage1.wav"));
	bso1.setVolume(0.5f);
	bso1.stop();//in case is already playing
	
	bso2.loadLoopingSound(ofToDataPath("bso_stage2.wav"));
	bso2.setVolume(0.5f);
	bso2.stop();//in case is already playing
	
	bso3.loadLoopingSound(ofToDataPath("bso_stage3.wav"));
	bso3.setVolume(0.5f);
	bso3.stop();//in case is already playing
	
	bso4.loadLoopingSound(ofToDataPath("bso_stage4.wav"));
	bso4.setVolume(0.5f);
	bso4.stop();//in case is already playing
	
	gameOver.loadSound(ofToDataPath("game_over.wav"));
	gameOver.setVolume(0.5f);
	gameOver.stop();//in case is already playing
	
	connection.loadSound(ofToDataPath("connection.wav"));
	connection.setVolume(0.5f);
	connection.stop();//in case is already playing
	
	tenunits.loadSound(ofToDataPath("ten_units.wav"));
	tenunits.setVolume(0.75f);
	
	
}


void Sound::set(soundType soundFlag){
	
	switch (soundFlag) {
		case BEGIN:
			bso1.stop();
			bso2.stop();
			bso3.stop();
			bso4.stop();
			bso1.play();
			connection.vibrate();
			tenunits.play();
			break;
		case RESET_CONFIRMED:
			tenunits.play();
			break;
		case MAX_PLANES_REACHED:
			tenunits.play();
			break;
		case NORMAL_HIT:
			connection.play();
			connection.vibrate();
			break;
		case SPECIAL_HIT:
			connection.vibrate();
			tenunits.play();
			break;
		case NEWSTAGE:
			bso1.stop();
			bso2.play();
			connection.vibrate();
			tenunits.play();
			break;
		case GAMEOVER:
			bso1.stop();
			bso2.stop();
			bso3.stop();
			bso4.stop();
			gameOver.play();
			break;
				
		default:
			tenunits.play();
			break;
	}
	
}


void Sound::setStage(int level){
	
	switch (level) {
		case 0:
			bso1.stop();
			bso2.stop();
			bso3.stop();
			bso4.stop();
			bso1.play();
			connection.vibrate();
			tenunits.play();
			break;

		case 1:
			bso1.stop();
			bso2.stop();
			bso2.play();
			connection.vibrate();
			tenunits.play();
			break;
			
		case 2:
			bso1.stop();
			bso2.stop();
			bso3.play();
			connection.vibrate();
			tenunits.play();
			break;
		case 3:
			bso1.stop();
			bso2.stop();
			bso3.stop();
			bso4.play();
			connection.vibrate();
			tenunits.play();
			break;
		default:
			bso1.stop();
			bso2.stop();
			bso1.play();
			connection.vibrate();
			tenunits.play();
			break;
	}

}