

class Coin {
  //instance variables 
  int x;
  int y;
  int counter;
//loading in images
  final PImage img1 = loadImage("goldCoin1.png");
  final PImage img2 = loadImage("goldCoin2.png");
  final PImage img3 = loadImage("goldCoin3.png");
  final PImage img4 = loadImage("goldCoin4.png");

  Coin(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    move();
    render();
  }

  void move() {
    x -= random(2, 5);
    y+= random(-2,2);//random -2.0-> 1.999
  }

  void render() {
    
    
    if (counter < 10) { 
      image(img1, x, y);
    } else if (counter < 20) { 
      image(img2, x, y);
    } else if (counter < 30) { 
      image(img3, x, y);
    } else if (counter < 40) { 
      image(img4, x, y);
    } else { 
      image(img4, x, y);
      counter=0;
    }

    counter++;
  }
}
