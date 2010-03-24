/*
 *  stageManager.mm
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/4/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */


#include "stageManager.h"

StageManager::StageManager(){
	stage = 0;
	counter = 0;
	stageFour = NULL;
	setStage(stage);
}

//methods
void StageManager::draw(){
	switch (stage) {
		case 0: //level 0
			stageOne->draw();
			break;
		case 1://level 1
			stageTwo->draw();
			break;
		case 2://level 2
			stageThree->draw();			
			break;
		case 3://finalStage
			stageFour->draw();
			break;
		default:
			break;
	}
}

void StageManager::setStage(int level){
	stage = level;
	switch (level) {
		case 0: //level 0
			if (stageFour){stageFour->close();free(stageFour);}
			stageOne = new StageOne();
			break;
		case 1://level 1
			if(stageOne){stageOne->close();free(stageOne);}
			stageTwo = new StageTwo();
			break;
		case 2://level 2
			if(stageTwo){stageTwo->close();free(stageTwo);}
			stageThree = new StageThree();
			break;
		case 3://finalStage
			if(stageThree){stageThree->close();free(stageThree);}
			stageFour = new StageFour();
			break;
		default:
			break;
	}
}

void StageManager::update(){
	switch (stage) {
		case 0: //level 0
			stageOne->update();
			break;
		case 1://level 1
			stageTwo->update();
			break;
		case 2://level 2
			stageThree->update();
			break;
		case 3://finalStage
			stageFour->update();
			break;
		default:
			break;
	}
}

void StageManager::resetStage(){
	switch (stage) {
		case 0: //level 0
			stageOne->reset();
			break;
		case 1://level 1
			stageTwo->reset();
			break;
		case 2://level 2
			stageThree->reset();
			break;
		case 3://finalStage
			stageThree->reset();
			break;
		default:
			break;
	}
}
	
bool StageManager::checkHit(int x, int y){
	switch (stage) {
		case 0: //level 0
			return stageOne->checkHit(x, y);
			break;
		case 1://level 1
			return stageTwo->checkHit(x, y);
			break;
		case 2://level 2
			return stageThree->checkHit(x, y);
			break;
		case 3://finalStage
			return stageFour->checkHit(x, y);
			break;
		default:
			return false;
			break;
	}
	return false;
}

void StageManager::createItem(){
	switch (stage) {
		case 0: //level 0
			stageOne->createItem();
			break;
		case 1://level 1
			stageTwo->createItem();
			break;
		case 2://level 2
			stageThree->createItem();
			break;
		case 3://finalStage
		//	stageFour->createItem();
			break;
		default:
			break;
	}
}

void StageManager::setCounter(int count){
	switch (stage) {
		case 0: //level 0
			stageOne->counter = count;
			break;
		case 1://level 1
			stageTwo->counter = count;
			break;
		case 2://level 2
			stageThree->counter = count;
			break;
		case 3://finalStage
			//stageFour->counter = count;
			break;
		default:
			break;
	}
}
	
void StageManager::setStatusText(char status[255]){
	switch (stage) {
		case 0: //level 0
			//stageOne->s = count;
			break;
		case 1://level 1
			//stageTwo->counter = count;
			break;
		case 2://level 2
			//stageThree->counter = count;
			break;
		case 3://finalStage
			stageFour->setStatusText(status);
			break;
		default:
			break;
	}
}