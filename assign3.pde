final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
PImage groundhogDown,groundhogIdle,groundhogLeft,groundhogRight;
final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
boolean upPressed, downPressed, rightPressed, leftPressed;

float groundhogIdleX=320;
float groundhogIdleY=80;
float groundhogDownX=1000,groundhogDownY=-1000;
float  groundhogLeftX=1000,groundhogLeftY=-1000;
float groundhogRightX=1000,groundhogRightY=-1000;
float groundhogIdleSpeed=80;
float groundhogIdleWidth=80;
float groundhogIdleHeight=80;
int soil0X,soil0Y;
PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
int lifeCount=5;
int numSoil=6;
PImage soil[]=new PImage[numSoil];
PImage stone1,stone2;
PImage life;
// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
  stone1=loadImage("img/stone1.png");
  stone2=loadImage("img/stone2.png");
     life=loadImage("img/life.png");
 groundhogLeft= loadImage("img/groundhogLeft.png");
  groundhogRight= loadImage("img/groundhogRight.png");
  groundhogDown= loadImage("img/groundhogDown.png");
  groundhogIdle= loadImage("img/groundhogIdle.png");

//setupImageSoil
for(int i=0;i<numSoil;i++){
    soil[i]=loadImage("img/soil"+i+".png");};

  
}
  
void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game
    
		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
	
    for(int i=0;i<8;i++){
      for(int j=0;j<4;j++){
        float x=80*i;
        for(int z=0;z<numSoil;z++){
        float y=320*z+160+80*j;
    image(soil[z],x,y);
    }
  }
}
//1-8
  for(int i=0;i<8;i++){
   
      float x=80*i;
      
  image(stone1,x,160+80*i);
 }
//9-16
pushMatrix();
translate(-80,0);

  for(int i=0;i<9;i+=4){  
    for(int j=0;j<8;j+=4){
    float x=80*i;
    float y=800+80*j;
    float y2=y+80;
    image(stone1,x,y);
    image(stone1,x+80,y);
    }
  }
  for(int i=0;i<9;i+=4){
    for(int j=3;j<8;j+=4){
  float x=80*i;
    float y=800+80*j;
    float y2=y+80;
    image(stone1,x,y);
    image(stone1,x+80,y);
    }
  
  }

   for(int i=2;i<8;i+=4){  
    for(int j=1;j<8;j+=4){
    float x=80*i;
    float y=800+80*j;
    image(stone1,x,y);
    image(stone1,x+80,y+80);
    image(stone1,x+80,y);
    image(stone1,x,y+80);
 
    }
  
  }
 popMatrix();
 //17-24  
for(int k=-8;k<8;k+=3){
 for (int i=0;i<8;i++){
   float x=80*i+80*k;
   float y=2000-80*i;
   image(stone1,x,y);
 
 }
 }
 for(int k=-8;k<8;k+=3){
 for (int i=0;i<8;i++){
   float x=80*i-80+80*k;
   float y=2000-80*i;
   image(stone1,x,y);
 
 }
 }
 for(int k=-8;k<8;k+=3){
 for (int i=0;i<8;i++){
   float x=80*i-80+80*k;
   float y=2000-80*i;
   image(stone2,x,y);
 
 }
 }
 
 

		// Player
image(groundhogIdle,groundhogIdleX,groundhogIdleY);
image(groundhogDown,groundhogDownX,groundhogDownY);
image(groundhogLeft,groundhogLeftX,groundhogLeftY);
image(groundhogRight,groundhogRightX,groundhogRightY);
if(downPressed){
groundhogIdleY += groundhogIdleSpeed;

downPressed=false;

if(groundhogIdleY + groundhogIdleHeight> 2080) 
{groundhogIdleY = 2080 - groundhogIdleHeight;}
}
if(leftPressed){
groundhogIdleX -= groundhogIdleSpeed;
if(groundhogIdleX< 0){ groundhogIdleX= 0;}
leftPressed=false;
}
if(rightPressed){
groundhogIdleX+= groundhogIdleSpeed;
if(groundhogIdleX + groundhogIdleWidth > width)
{
groundhogIdleX = width -groundhogIdleWidth;}
rightPressed=false;

}
		// Health UI

   for(int i=0;i<playerHealth;i++){
  image(life,10+i*70,10);
   }

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
switch(keyCode){
case DOWN:
downPressed = true;

break;
case RIGHT:
rightPressed = true;

break;
case LEFT:
leftPressed = true;

break;}

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
    switch(keyCode){
case UP:
upPressed = false;
break;
case DOWN:
downPressed = false;
break;
case RIGHT:
rightPressed = false;
break;
case LEFT:
leftPressed = false;
break;
    }
   
}
