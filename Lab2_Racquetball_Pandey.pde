//Global variables
//the distance between the bottom of the window and the paddle
float gap;
//width of the paddle
float w;
//for displaying the points
PFont f;
PFont i;
//the center of the ball
float x;
float y= 30;
//speed of the ball along the x axis
float speedx=1;
//speed of the ball along the y axis
float speedy=1;
//direction of the balll along the x axis 
float directionx=1;
//direction of the ball along the y axis 
float directiony=1;
//to randomize the ball's initial direction
float r = random (1000000);
//variable for score
int score = 0;

//switches
boolean menu;
boolean game;
boolean gameover;

void setup () {
  size (640, 360);
  background (0);
  gap = height-30;
  x= random (width);
  f = createFont ("Arial", 32, true);
  i = createFont ("Arial", 12, true);
  //random direction at the start: L/R
  if (r <=500000) {
    directionx = 1;
  } else {
    directionx = -1;
  }
  //initializing the switches
  menu = true;
  game= false;
  gameover = false;
} 


//void draw 

void draw() {
  if (menu == true && game == false && gameover == false) {
    background (0);
    textFont (f);
    fill (255, 0, 0);
    textAlign (LEFT);
    text ("Instructions:", 10, 30);
    textFont (i);
    fill (255, 255, 0);
    textAlign (LEFT);
    text ("This game is to be played continuously.", 10, 50);
    text ("A ball will be bouncing within the display screen", 10, 70);
    text ("Your aim is to make sure that the ball doesn't fall down through the bottom of the screen by using the paddle", 10, 90); 
    text ( " You can move your paddle only to the left or right, and not up or down.", 10, 110); 
    text ("With every save your points, displayed at the top right of the window, increases.", 10, 130);
    text ("And with every increase in your points, the speed of the bouncing ball will also increase!", 10, 150);
    text ("Also, you can enjoy the 'Crazy Rainbow Ball' effect everytime your mouse is pressed!", 10, 170);
    text ("But first of all, you'll have to choose the paddle size. Remember, wider the paddle", 10, 190);
    text ("higher will be the starting speed of the bouncing ball!", 10, 210);


    //choosing paddle size
    //three boxes 
    rectMode (CENTER);
    stroke (0, 255, 0);
    noFill ();

    //paddle size = 100 pixels wide
    rect (80, 260, 100, 40);
    textFont (f);
    fill (255, 0, 0);
    textAlign (CENTER);
    text ("100", 80, 270);

    //paddle size = 200 pixels wide
    noFill ();
    rect (280, 260, 100, 40);
    textFont (f);
    fill (255, 0, 0);
    textAlign (CENTER);
    text ("200", 280, 270);

    //paddle size = 300 pixels wide
    noFill ();
    rect (480, 260, 100, 40);
    textFont (f);
    fill (255, 0, 0);
    textAlign (CENTER);
    text ("300", 480, 270);


    //choosing paddle size 
    //size 100
    if ( mouseX>= 30 && mouseX <= 130 && mouseY >= 240 && mouseY <=280 && mousePressed) {
        w = 100;
        speedx = 1;
        speedy = 1;
        menu = false;
        game = true;
        gameover = false;
        
      }

    //size 200
    if ( mouseX >= 230 && mouseX <= 330 && mouseY >= 240 && mouseY <=280 && mousePressed) {
        w= 200;
        speedx = 1.75;
        speedy = 1.75;
        menu= false;
        game = true;
        gameover = false;
    }

    //size 300
    if ( mouseX >= 430 && mouseX <= 530 && mouseY >= 240 && mouseY <=280 && mousePressed) {
        w= 300;
        speedx = 2.5;
        speedy = 2.5;
        menu= false;
        game = true;
        gameover = false;
    }
  }



  //game boolean 
  if ( game == true && menu == false && gameover == false) {
    // black background
    if (!mousePressed) {
      background (0);
    }

    //point at the top right
    textFont (f);
    fill (0, 0, 255);
    textAlign (LEFT);
    text ("Points:", 500, 50);
    text (score, 600, 50);


    //paddle
    //setting the paddle mode to Center
    rectMode (CENTER);
    //white paddle
    fill (255);
    mouseX= (int) constrain (mouseX, w/2, width-(w/2));
    rect(mouseX, gap, w, 20);

    //ball, bounce
    //ball random color
    stroke (255);
    fill (random (255), random (255), random (255));
    // ellipseMode (CENTER);
    ellipse (x, y, 30, 30);
    //hits the paddle
    if ((x <= (mouseX) + (w/2)) && (x >= ((mouseX)-(w/2))) && y == (height-50)) {
      directiony = -1;
      //increasing score
      score++;
      //increasing speed
      speedx= speedx+2;
      speedy= speedy+2;
    } else if (y < 0) {
      directiony = 1;
    } else if (x >width) {
      directionx= -1;
    } else if (x <0) {
      directionx= 1;
    }
   
    
    //GAME OVER
    else if (y > width) {
      //display game over
      game = false;
      gameover = true;
      menu = false;
    }
    x= x + (speedx* directionx);
    y= y + (speedy*directiony);
  }

  
  //boolean gameover
  if (gameover == true && menu == false && game == false) {
    //display game over
    background (0);
    textFont (f);
    fill (0, 0, 255);
    textAlign (CENTER);
    text ("GAME OVER", width/2, height/2);
    text ("Press any key to continue", (width/2), (height/2)+ 50);
  
    if (keyPressed ==true) {
      gameover = false;
      menu = true;
      game = false;
      y = 30;
      score = 0;
      speedx=1;
      speedy=1;
    }
  }
}
