//global variable 

PImage backGround;
int bgX = 0;
ArrayList<Coin> goldCoinList = new ArrayList();
int spawnTimer= 0;
Bird larry;
int score = 0;

final int PLAY = 0; //states of this program
final int STOP = 1;
int gameMode = PLAY;

void setup()
{
  size(500,400);
backGround = loadImage("gameBackground.jpg");
backGround.resize(width, height);


 timer = new CountDown(60); //call CountDown constructor – 60 secs
 
 for(int i = 0; i < 10; i++){
    goldCoinList.add(new Coin (width+(int)random(400), (int) random(450) ) );
    
    larry = new Bird(20,20);
    
  }
 
}
void draw() //repeat 60 times a second
 {
    larry.render();
   drawBackground();
   text("TIME REMAINING:"+timer.getRemainingTime(), 10,10); //display seconds remaining top left
  
  if (timer.getRemainingTime()==0)
  {                                    
  text("GAME OVER",width/3+40,height/2);}  //when timer hits 0 display game over
  
  
  if (gameMode==PLAY)
  {
  playingGame();
  }                                    
  if (timer.getRemainingTime()==0)//stop game when timer hits 0
  { gameMode=STOP; } //stop game
  
  if (gameMode == PLAY) {
    spawnTimer++;
    if (spawnTimer % 60 == 0){
    goldCoinList.add(new Coin (width+(int)random(400), (int) random(450) ) );
    } 
  
    
   
    }
  
  
      for (int i=0; i < goldCoinList.size(); i++){
    Coin currentGoldCoin = goldCoinList.get(i);
    
    currentGoldCoin.update(); 
    
     if(larry.crash(currentGoldCoin) || currentGoldCoin.x < 0){
      goldCoinList.remove(i); //crashing in to a coin it gets removed off screen
     
       
       if(larry.crash(currentGoldCoin)){
         score=score+1;}//crashing in to a coin adds one to the score
       
     }
      }
       
   
    
    
   text("SCORE:"+score,10,50); // display score 
    
}//end of void draw


void drawBackground() {
  image(backGround, bgX, 0); //draw background twice
  image(backGround, bgX+backGround.width, 0);
  bgX -=4; //move background 4 pixels to left
  if (bgX == -backGround.width) 
    bgX=0; //wrap background
    
      
  if (timer.getRemainingTime()==0)
  {                                    
  background(0,0);} // when timer hits 0 it changes background to black
}


void playingGame()
{

 //go inside redCharacter call render method
larry.render();

}

void keyPressed(){   // coding key presses
  if(key== CODED){
    if (keyCode == UP && larry.y > 0)
     larry.y -=5;
    else if (keyCode == DOWN &&  larry.y <height - 45)
     larry.y +=5;
      else if (keyCode == RIGHT &&  larry.x < width -20 )
     larry.x +=5;
      else if (keyCode == LEFT &&  larry.x > 0 )
     larry.x -=5;
    
  }
}
