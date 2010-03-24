#include "testApp.h"


//--------------------------------------------------------------
void testApp::setup(){
	//set stage
	//ofSetFrameRate(35);
	ofBackground(30, 30, 30);	
	
	//initialize vars
	menuInicio		= new InitMenu();
	menuReset		= new ResetMenu();
	menuItems		= new ItemsMenu();
	stageManager	= new StageManager();
	introStage		= new IntroStage();
	clockUp			= new Clock();
	clockDown		= new Clock(TIME_LIMIT);
	
	//set level for introStage=begin
	level = -1;
	
	counter = 0;
	globalcounter = 0;
	zoomIn = 0.0f;
	
	//Allocate memory for printScreen
	screen.allocate(ofGetWidth(), ofGetHeight(), GL_RGB);
	
	initVars();
	
    //set sound and bso
	soundSystem = new Sound(this);

	//touch
	//ofxMultiTouch.addListener(this);
}


//--------------------------------------------------------------
void testApp::update(){
	/// FUNCION CAMBIO DE ESTADO
	stageManager->update();
	
	if((!loaded) && (level==3) && (introStage->keyboard->okPressed)){
		printf("OKPRESSEED\n");
		stageManager->stageFour->startXMLFlag = true;
		loaded = true;
		introStage->keyboard->okPressed = false;
	}
	//control countdown
	checkCountDownFinish();
	
	//update chronometer
	menuItems->setTime(clockUp->time());
}

//--------------------------------------------------------------
void testApp::draw(){
	/*if(alertMessage == true){
		ofSetColor(255,0,0);
		tempesta.drawString(alertText, ofGetWidth()*0.10,ofGetHeight()*0.70);
	}*/
	if (menuScene){
		//MENU INICIO
		menuInicio->draw();
	}else
	{
		if(!checkChangeStage()){
			//control reset option
			checkResetPressed();
			
			//print Scene	
			drawScene();
			
			//control printScreen
			checkPrintScreen();	
		}
	}

}

//--------------RESET LEVEL ------------------------------------

void testApp::resetLevel() {
	counter = 0;
	menuItems->setCounter(counter);
	if(end){
		end = false;
		level = (level+1) % 5;
		stageManager->setStage(level);
		introStage->setLevel(level);
		introStageFlag = true;
		if (level==2){/*activate countdown*/menuItems->countDown = true;}
		if (level==3){
			clockDown->pause();
			introStageFlag = false;
			endStage = true;
			menuItems->countDown = false;
			soundSystem->setStage(level);
			introStage->setFinalTime(clockUp->time());
			//sendPoints();
			clockUp->reset();			
		}
				
	}else{
		level = 0;
		initVars();
		menuScene				= false;
		menuItems->countDown	= false;
		introStageFlag			= true;
		introStage->setLevel(level);
		stageManager->setStage(level);
		stageManager->resetStage(); //o changeStage(level);
		soundSystem->setStage(level);
		globalcounter = 0;
		menuItems->setGlobalCounter(globalcounter);
	}
			
}

//--------------CHECK HIT---------------------------------------

void testApp::checkHit (int x, int y){
	printf("Frame Rate %f\n",	ofGetFrameRate());
		
	//Initial menu
	if ((menuScene)&&(checkBeginButton(x, y))){
		checkHitMenuInicio();
	
	//Intro stage	
	}else if((introStageFlag)&&(checkBeginButton(x, y))){
		checkHitIntroStage();
	
	//Keyboard	
	}else if (endStage) {
		introStage->keyboard->checkHit(x, y);
		if (introStage->keyboard->okPressed) {
			//introStage->keyboard->okPressed = false;
			stageManager->setStatusText(introStage->keyboard->responseText);
			endStage = false;
			introStageFlag = false;
			resultStage = true;
		}
	}
	
	//GameOver
	if(((gameOver) || (resultStage)) && (checkBeginButton(x, y))){
		printf("IN CHECK GAMEOVER!!!\n");
		gameOver = false;
		resultStage = false;
		clockDown->reset();
		clockUp->reset();
		resetLevel();
		soundSystem->set(RESET_CONFIRMED);
	}
	
	
	//Reset menu
	if (resetPressed){
		checkResetMenu(x, y);
		
	//Reset button
	}else if (checkResetButton(x,y)){
	    printf("ASKING FOR RESET RESET!!!\n");
		resetPressed = true;
		//clockUp->pause();
	}
	
	

	
	//Planes hit
    //Limit planes
    if(counter+1 == MAX_N_PTS){
		end = true;
		clockUp->pause();
		clockDown->pause();
	}else 
		//Plane HIT
		if (stageManager->checkHit(x, y)){
			printf("--------------------------------------------------------------------------- HIT!\n");
			
			soundSystem->set(NORMAL_HIT);
			
			//check if init game
			if (counter == 0) {
				if (level == 0){clockUp->start();}
				else{
					if (level == 2) {
						//clockDown->start();
						//clockUp->cont();
					}else{clockUp->cont();}
				}
			}
			counter++;
			globalcounter++;
			menuItems->setCounter(counter);
			menuItems->setGlobalCounter(globalcounter);
			stageManager->setCounter(counter);
			stageManager->createItem();
			//createPlane();
			 
			 //  si counter es multiplo de 10
			 if (int(counter)%10==0)
				 soundSystem->set(SPECIAL_HIT);
		 }
}

//--------------------------------------------------------------
void testApp::keyPressed  (int key){
	
}
//--------------------------------------------------------------
void testApp::touchDown(float x, float y, int touchId, ofxMultiTouchCustomData *data){
	//printf("touchDown: %i, %i %i\n", x, y, touchId);
}
//--------------------------------------------------------------
void testApp::touchMoved(float x, float y, int touchId, ofxMultiTouchCustomData *data){
	//printf("touch %i moved at (%i,%i)\n", touchId, x,y);
}
//--------------------------------------------------------------
void testApp::touchUp(float x, float y, int touchId, ofxMultiTouchCustomData *data){
	//printf("touch %i up at (%i,%i)\n", touchId, x,y);
}
//--------------------------------------------------------------
void testApp::touchDoubleTap(float x, float y, int touchId, ofxMultiTouchCustomData *data){
	//printf("touch %i double tap at (%i,%i)\n", touchId, x,y);
}
//--------------------------------------------------------------
void testApp::keyReleased  (int key){
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
	
	checkHit(x,y);		
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
	if (level == 3) {
		introStage->keyboard->keyReleassed();
	}
}
//--------------------------------------------------------------
void testApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void testApp::checkResetMenu(int x, int y){
	if ((x >= CONFIRMRESETBUTTON_X) && (x <= CONFIRMRESETBUTTON_X+CONFIRMRESETBUTTON_WIDTH) && 
		(y >= CONFIRMRESETBUTTON_Y) && (y <= CONFIRMRESETBUTTON_HEIGHT+CONFIRMRESETBUTTON_Y)) {
		printf("\nRESET CONFIRMED\n");
		resetOption(RESET);
		
	}else if ((x >= ABORTCONFIRMRESETBUTTON_X) && (x <= ABORTCONFIRMRESETBUTTON_X+ABORTCONFIRMRESETBUTTON_WIDTH) && 
			  (y >= ABORTCONFIRMRESETBUTTON_Y) && (y <= ABORTCONFIRMRESETBUTTON_Y+ABORTCONFIRMRESETBUTTON_HEIGHT)) {
		printf("\nRESET ABORTED\n");
		resetOption(CONTINUE);
	}else if ((x >= PRINT_SCREEN_BUTTON_X) && (x <= PRINT_SCREEN_BUTTON_X+PRINT_SCREEN_BUTTON_WIDTH) && 
			  (y >= PRINT_SCREEN_BUTTON_Y) && (y <= PRINT_SCREEN_BUTTON_Y+PRINT_SCREEN_BUTTON_HEIGHT)) {
		printf("\nPRINT SCREEN\n");
		resetOption(SCREEN);
	}else {
		resetOption(NON);
	}
}
	
//--------------------------------------------------------------
void testApp::resetOption(resetMenuType option){
	switch (option) {
		case RESET:
			clockDown->stop();
			clockUp->reset();
			resetLevel();
			soundSystem->set(RESET_CONFIRMED);
			resetPressed = false;
			break;
		case CONTINUE:
			resetPressed = false;
			break;
		case SCREEN:
			//resetPressed = false;
			//printScreen = true;
			break;
		default:
			break;	
	}
}

//--------------------------------------------------------------
bool testApp::checkBeginButton(int x, int y){
	if((x>=BEGIN_POS_X)&&(x<=BEGIN_POS_X+BEGIN_WITH)&&(y>=BEGIN_POS_Y)&&(y<=BEGIN_POS_Y+BEGIN_HEIGHT))
		return true;
	return false;
}

//--------------------------------------------------------------
bool testApp::checkResetButton(int x, int y){
	if((x > RESET_POS_X) && (x < RESET_POS_X+RESET_WIDTH) && (y > RESET_POS_Y) && (y <RESET_POS_Y+RESET_HEIGHT))
		return true;
	return false;
}

//--------------------------------------------------------------
void testApp::initVars(){
	//initialize boolean vars
	menuScene		= true;
	resetPressed	= false;
	end				= false;
	printScreen		= false;
	introStageFlag	= false;
	alertMessage	= false;
	endStage		= false;
	gameOver		= false;
	resultStage		= false;
	loaded			= false;
}

//--------------------------------------------------------------
void testApp::checkHitMenuInicio(){
	// disable menu
	menuScene=false;
	introStage->setLevel(level+1);
	introStageFlag = true;
	printf("MENU DISABLED\n");
}

//--------------------------------------------------------------
void testApp::checkHitIntroStage(){
	if(level == -1){
		soundSystem->set(BEGIN);
		level++;
	}else{
		if (level == 2) {
			clockDown->start();
			clockUp->cont();
		}
		soundSystem->setStage(level);
	}
	introStageFlag = false;
	
}

//--------------------------------------------------------------
void testApp::checkCountDownFinish(){
	if (level == 2) { 
		if(clockDown->total == 0.0f){
			introStage->setLevel(-1); //GameOver
			if(!gameOver){soundSystem->set(GAMEOVER); gameOver = true;}
			introStageFlag=false; endStage = true;
		}else{
			menuItems->setCountDown(clockDown->countdown());
		}
	}
}

//--------------------------------------------------------------
void testApp::checkPrintScreen(){
	if(printScreen){
		screen.loadScreenData(0, 0, ofGetWidth(), ofGetHeight());
		printScreen = false;
		//screen.draw(-ofGetWidth()/2, -ofGetHeight()/2);
	}
}

//--------------------------------------------------------------
void testApp::drawScene(){
	if(level != 3){menuItems->draw();}
	//control final stage
	if (end) {
		zoomIn += 0.1f;
		glTranslatef(WIDTH/2, HEIGHT/2, pow(zoomIn, 3)*(50));
		//if((zoomIn += 40) > 500){
		if((pow(zoomIn, 3)*50) > 5000){
			//end = false;
			zoomIn = 0.0f;
			//reset game
			resetLevel();}
	}else {
		glTranslatef(WIDTH/2, HEIGHT/2, 0);
	}
	stageManager->draw();}

//--------------------------------------------------------------
bool testApp::checkChangeStage(){
	if((introStageFlag) || (endStage)){
		introStage->draw();
		return true;}
	return false;
}

//--------------------------------------------------------------
void testApp::checkResetPressed(){
	if(resetPressed)
		menuReset->draw();
}