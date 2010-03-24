/*
 *  clock.mm
 *  AIDawn
 *
 *  Created by CORE LABS on 3/11/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "clock.h"

/* Constructor countup */
Clock::Clock(){
	countDown = false;
	end = 0;
	init = 0;
	total = -1;
	limit = -1;
	acc = 0;
	stoped = true;
	

}

/* Constructor countdown */
Clock::Clock(int time_limit){
	stoped = true;
	countDown = true;
	total = time_limit;
	limit = time_limit;
}

//methods
void Clock::start(){
	stoped = false;
	init = ofGetElapsedTimeMillis();
}

void Clock::stop(){
	stoped = true;
	end = ofGetElapsedTimeMillis();
}

void Clock::reset(){
	stoped = true;
	init = 0;
	end = 0;
	acc = 0;
	total = limit;
}

void Clock::cont(){
	stoped = false;
	endPause = ofGetElapsedTimeMillis();
	acc += endPause - initPause;
}

void Clock::pause(){
	stoped = true;
	end = ofGetElapsedTimeMillis();
	initPause = ofGetElapsedTimeMillis();
}

float Clock::countdown(){
	if(stoped){
		//printf("COUNTDOWN TOTAL s: %f\n", total);
		return total;
	}else{
		end = ofGetElapsedTimeMillis();
		//printf("\nCOUNTDOWN : %f\n", 44 - (((end - init)/CLOCKS_PER_SEC)*10));
		total = limit - (((end - init)/1000));
		if(total <= 0.0f){total = 0.0f;}
		return total;
	 } 
}

float Clock::time(){
	//printf("I: %f, F: %f\n", init, end);
	//printf("STOPPED: %f\n", (end-init)/CLOCKS_PER_SEC);
	//printf("!STOPPED: %f\n", (init-clock())/CLOCKS_PER_SEC);
	if(stoped){
		return (((end-init-acc)/1000));
	}else {
		end = ofGetElapsedTimeMillis();
		return (((end-init-acc)/1000));
	}

}