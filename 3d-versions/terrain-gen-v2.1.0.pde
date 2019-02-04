/* Terrain Generator 3D 

  Created by
  Yoctobyte and MrJoCrafter
                              */
                              

int cols,rows,scl=14,w=2200,h=1600;
float[][] terrain;
float f,R,G,B,z,hs=1.65;
void setup(){
   size(1000,700,P3D); 
   cols=w/scl;
   rows=h/scl;
   terrain = new float[cols][rows];
   strokeWeight(1);
}
void draw(){
  float yo=f;
   for(int y=0;y<rows;y++){
     float xo=0;
    for(int x=0;x<cols;x++){
     terrain[x][y]=map(noise(xo,yo),0,1,-50,50);
     xo+=0.1;
    }
    yo+=0.1;
  }
   background(150,190,255);
   translate(width/2,height/2);
   rotateX(PI/3);
   translate(-w/2,-h/2);
   for(int y=0;y<rows-1;y++){
     beginShape(TRIANGLE_STRIP);
    for(int x=0;x<cols;x++){
      fill(50,255,50);
      stroke(0,180,0);
      if(z<-3){stroke(200,200,60);fill(255,255,100);}
      z=terrain[x][y];
      vertex(x*scl,y*scl,z*hs);
      z=terrain[x][y+1];
      vertex(x*scl,(y+1)*scl,z*hs);
    }
    endShape();
  }
  fill(0,0,255);
  stroke(0,0,200);
  for(int y=0;y<rows-1;y++){
     beginShape(TRIANGLE_STRIP);
    for(int x=0;x<cols;x++){
      vertex(x*scl,y*scl,-10);
      vertex(x*scl,(y+1)*scl,-10);
    }
    endShape();
  }
  f-=0.1;
}
