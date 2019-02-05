int cols,rows,scl=14,w=2200,h=2000;
float[][] terrain;
float f,R,G,B,z,hs=1.8,z0,bch;
float xb,yb;
float bi;
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
     xo+=0.05;
    }
    yo+=0.05;
  }
   background(150,190,255);
   translate(width/2,height/2);
   rotateX(PI/3);
   translate(-w/2,-h/2);
   yb=0;
   xb=0;
   for(int y=0;y<rows-1;y++){
     beginShape(TRIANGLE_STRIP);
     xb=0;
     yb+=0.05;
    for(int x=0;x<cols;x++){
      xb+=0.05;
      bi=noise(xb/10,yb/10+f/10);
      fill(50,255,50);
      stroke(0,180,0);
      if(z<-3){stroke(200,200,60);fill(255,255,100);}
      z=terrain[x][y];
      if(z>14&&!(bi>0.1&&bi<=0.5)){bch=1;z0=z;stroke(50);fill(100);if(z<-3){stroke(160,160,100);fill(170,170,110);}}
      if(z>15&&!(bi>0.1&&bi<=0.5)){bch=1;z0=z;z*=3;stroke(50);fill(100);if(z<-3){stroke(160,160,100);fill(170,170,110);}}
      if(bi>0.175&&bi<=0.425){z0=z;z*=0.75;}
      if(bi>0.2&&bi<=0.4){z0=z;z*=0.5;stroke(200,200,60);fill(255,255,100);}
      vertex(x*scl,y*scl,z*hs);
      z=terrain[x][y+1];
      if(z>14&&!(bi>0.1&&bi<=0.5)){bch=1;z0=z;stroke(50);fill(100);if(z<-3){stroke(160,160,100);fill(170,170,110);}}
      if(z>15&&!(bi>0.1&&bi<=0.5)){bch=1;z0=z;z*=3;stroke(50);fill(100);if(z<-3){stroke(160,160,100);fill(170,170,110);}}
      if(bi>0.175&&bi<=0.425){z0=z;z*=0.75;}
      if(bi>0.2&&bi<=0.4){z0=z;z*=0.5;stroke(200,200,60);fill(255,255,100);}
      if(z>14.9&&!(bi>0.1&&bi<=0.5)){
        vertex(x*scl,(y+1)*scl,z0*hs);
      }else{
        vertex(x*scl,(y+1)*scl,z*hs);
      }
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
