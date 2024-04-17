// TALLER 2 //
PImage fondoUno, instrucciones, mision;

//fuentes//
PFont pirate;
// Botones //

PImage botPlayUno, botExitUno, botsaltar;
int pantallas;
int tsaltar=0;
// segunda pantalla//
PImage fidos, fmapa, cajas, barriles, tonel;
// booleanos //

boolean bomba=false;
int cant;
int lim;

//variable tiempo//

int tiempo; 

// arreglo para bombas// 

int [] bombx;
int [] bomby;

// matriz //

int [][] mapa = {
  {
    1, 1, 1, 3, 1, 3, 0, 1, 1, 3
  }
  , 
  {
    1, 3, 3, 3, 3, 1, 0, 3, 0, 3
  }
  , 
  {
    1, 0, 1, 0, 0, 3, 0, 1, 0, 1
  }
  , 
  {
    1, 0, 1, 0, 1, 1, 0, 0, 0, 1
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    1, 0, 1, 0, 1, 1, 0, 1, 0, 1
  }
  , 
  {
    1, 0, 1, 0, 1, 0, 0, 0, 0, 1
  }
  , 
  {
    0, 0, 0, 0, 1, 0, 1, 1, 0, 0
  }
  , 
  {
    0, 1, 1, 0, 0, 0, 1, 0, 0, 1
  }
  , 
  {
    2, 0, 1, 0, 1, 1, 1, 0, 0, 1
  }
  ,
};

// variables posiciones en matrices //
int x, y, Mx, My, mx, my;


// arreglos para los personajes //
int numcapred=2;
PImage capRed [] = new PImage [4];


void setup () {



  size (1024, 720);
  fondoUno= loadImage("fondo1.jpg");
  instrucciones = loadImage ("instrucciones.jpg");
  mision = loadImage ("mision.png");
  botPlayUno = loadImage("bot1.png");
  botExitUno = loadImage("bot2.png");
  botsaltar = loadImage ("botsaltar.png");
  fmapa= loadImage ("fondo_mapa.jpg");
  cajas= loadImage ("cajas.png");
  barriles =  loadImage ("barriles.png");
  fidos = loadImage ("fondointerfazdos.jpg");
  pirate = createFont ("PiratesWriters.ttf", 45);
  tonel = loadImage ("tonel.png");

  tiempo=frameCount;

  lim = 50;
    cant=0;
  bombx = new int [lim];
  bomby = new int [lim];
  
  for (int my=0; my<10; my++) {
    for (int mx=0; mx<10; mx++) {
      if (mapa[my][mx]==2) {
        My=my;
        Mx=mx;
        x=mx*62;
        y=my*62;
      }
    }
  }

  capRed [0]= loadImage ("capred1.png");
  capRed [1]= loadImage ("capred2.png");
  capRed [2]= loadImage ("capred3.png");
  capRed [3]= loadImage ("capred4.png");
}

void draw () {
  background(255);



  switch (pantallas) {

  case 0:
    image(fondoUno, 0, 0, 1024, 720);
    image (botPlayUno, 340, 460, 201, 73);
    image (botExitUno, 340, 560, 201, 73);

    break;
  case 1:
    image (fidos, 0, 0, 1024, 720);
    image (fmapa, 17, 84, 620, 620);



    for (int f=0; f<10; f++) {
      for (int c=0; c<10; c++) {
        if (mapa [f][c]==0) {
          fill(255, 255, 255, 0);
        } else if (mapa [f][c] == 1)
        {
          image (barriles, c*62+17, f*62+84, 62, 62);
        } else if (mapa [f][c] == 3)
          image (cajas, c*62+8, f*62+75, 242/3, 242/3);
      }
    }
    for (int nb=0; nb<cant; nb++){
 
      
      if (bomba==true){
        
     image (tonel, bombx[nb], bomby[nb],768/11,953/11);
       bombx[cant]=x+13;
      bomby[cant]=y+60;  
 
   }
    }
 

   // image (tonel,x, y,768/11,953/11);
   
    
  
    
  
    fill (255);
    textSize(40); 
    textFont (pirate);
    text (frameCount, 450, 50);
    image (capRed[numcapred], x+17, y+45, 889/14, 1447/14);


    break;
  case 2:
    image (instrucciones, 0, 0, 1024, 720);
    image (botsaltar, 820, 10, 764/4, 278/4);


    break;
  case 3:
    image (mision, 0, 0, 1024, 720);
    image (botsaltar, 820, 10, 764/4, 278/4);
    if (frameCount%250==0) {
      tsaltar=1;
    }
    break;
  }


  // CONDICIONES AREA SENSIBLE INTERFAZ INICIAL  

  // AREA SENSIBLE BOTÓN JUGAR
  if (mouseX>= 350 && mouseX <= 530 && mouseY >= 460 && mouseY<= 530 && pantallas==0) {
    image (botPlayUno, 330, 455, 201*1.1, 73*1.1);
  }
  // AREA SENSIBLE BOTÓN SALIR 
  if (mouseX>= 350 && mouseX <= 530 && mouseY >= 560 && mouseY<= 630 && pantallas==0) {
    image (botExitUno, 330, 555, 201*1.1, 73*1.1);
  }

  // AREA SENSIBLE BOTÓN SALTAR PANTALLA INSTRUCCIONES 
  if (mouseX>= 820 && mouseX <= 1010 && mouseY >= 10 && mouseY<= 76 && pantallas==2) {
    image (botsaltar, 815, 8, 764/3.8, 278/3.8);
  }

  // AREA SENSIBLE BOTÓN SALTAR PANTALLA MISION 
  if (mouseX>= 820 && mouseX <= 1010 && mouseY >= 10 && mouseY<= 76 && pantallas==3) {
    image (botsaltar, 815, 8, 764/3.8, 278/3.8);
  }



  println (mouseX, mouseY, pantallas, tsaltar, bomba);
}


void mouseClicked() {


  // CONDICIÓN CAMBIO DE PANTALLA JUGAR A PANTALLA DE INSTRUCCIONES

  if (mouseX>= 350 && mouseX <= 530 && mouseY >= 460 && mouseY<= 530 && pantallas==0) {
    pantallas=1;
  }

  // CONDICIÓN CAMBIO DE PANTALLA SALIR DEL JUEGO 
  if (mouseX>= 350 && mouseX <= 530 && mouseY >= 560 && mouseY<= 630 && pantallas==0) {
    exit();
  }

  // BOTÓN SALTAR PANTALLA INSTRUCCIONES //


  if (mouseX>= 820 && mouseX <= 1010 && mouseY >= 10 && mouseY<= 76 && pantallas==2) { 
    pantallas=3;
  }


  // BOTÓN SALTAR PANTALLA MISIÓN //

  if (mouseX>= 820 && mouseX <= 1010 && mouseY >= 10 && mouseY<= 76 && pantallas==3 && tsaltar==1) {
    pantallas=1;
  }
}



void keyPressed() { 
  if (keyCode ==UP && pantallas ==1) {
    numcapred=3;
    if (My-1>-1 && mapa[My-1][Mx] ==0) {
      My-=1;
      y-=62;
    }
  }

  if (keyCode == DOWN && pantallas ==1 ) {
    numcapred=2;
    if (My+1<10 && (mapa [My+1][Mx]==0 || mapa [My+1][Mx]==2)) {
      My+=1;
      y+=62;
    }
  }

  if (keyCode == RIGHT && pantallas== 1) {
    numcapred=1;
    if (Mx+1<10 && mapa [My][Mx+1] ==0) {
      Mx+=1;
      x+=62;
    }
  }
  if (keyCode ==LEFT && pantallas ==1) {
    numcapred=0;
    if (Mx-1>-1 && (mapa [My][Mx-1] ==0 || mapa [My][Mx-1]==2)) {
      Mx-=1;
      x-=62;
    }
  }

  if (keyCode == ENTER && pantallas== 1) {

    bomba=!bomba;
  cant++;
  }
}

