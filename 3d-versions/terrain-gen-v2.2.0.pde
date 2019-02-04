int cols,rows,scl=14,w=2200,h=1600,colsb,rowsb,x,y,xx,yy,m1,mm;
float[][] terrain; 
float[][] biome;   
float f,R,G,B,z,zb,hsd=1.5,hs;
void setup(){
   size(1000,700,P3D); 
   cols=w/scl;
   rows=h/scl;
   terrain = new float[cols][rows];
   biome = new float[colsb][rowsb];
   strokeWeight(1);
}
void draw(){
  float yo=f;
   for(y=0;y<rows;y++){
     float xo=0;
    for(x=0;x<cols;x++){
     terrain[x][y]=map(noise(xo,yo),0,1,-50,50);
     xo+=0.1;
    }
    yo+=0.1;
  }
  float yb=0;
   for(yy=0;yy<rowsb;yy++){
     float xb=0;
    for(xx=0;xx<colsb;xx++){
     biome[xx][yy]=map(noise(xb,yb),0,1,-50,50);
     xb+=0.1;
    }
    yb+=0.1;
  }
   background(150,190,255);
   translate(width/2,height/2);
   rotateX(PI/3);
   translate(-w/2,-h/2);
   for(int y=0;y<rows-1;y++){
     beginShape(TRIANGLE_STRIP);
    for(int x=0;x<cols;x++){
      if(z > 17){
        stroke(100);
        fill(75);
        hs = hsd * 3;
      } else if(z > 15){
        stroke(100);
        fill(75);
      } else {
        fill(50,255,50);
        stroke(0,180,0);
        hs = hsd;
      }
      if(z<-2.5){
        stroke(200,200,60);
        fill(255,255,100);
        hs = hsd;
      }
      
      z=terrain[x][y];
      vertex(x*scl,y*scl,z*hs);
      z=terrain[x][y+1];
      vertex(x*scl,(y+1)*scl,z*hsd);
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
