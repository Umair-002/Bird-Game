class Bird
{
int x,y; //members
PImage img1,img2,img3; //Image class
int counter=0;
Bird(int x, int y) //create and load images
{
this.x = x;
this.y = y;
img1 = loadImage("bird1.png");
img1.resize(50,50); //100 x 100 pixels
img2 = loadImage("bird2.png");
img2.resize(50,50); //100 x 100 pixels
img3 = loadImage("bird3.png");
img3.resize(50,50); //100 x 100 pixels
}

void render()
{
  //pick next image in sequence - change image every 10 calls
  
  if(counter>=0 && counter<10)
  {image(img1,this.x,this.y);} //dislay image on screen
  else if(counter>=10 && counter <20)
  {image(img2,this.x,this.y);}
  else if (counter>=20 && counter <30)
  {image(img3,this.x,this.y);}
  else if(counter==30)
  {
  image(img3,this.x,this.y);
  counter=0;//reset to go through images again
  }
  counter++;
}

boolean crash(Coin coin) {
    return abs(this.x-coin.x) < 30 && abs(this.y - coin.y) < 30; // creating crash method for coin
}

}
