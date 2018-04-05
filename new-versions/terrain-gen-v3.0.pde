/*
            Terrain Generator
    Created by Yoctobyte and MrJoCrafter
*/

//Amount of zoom. Higher = More zoom
float s = 1;

//Amount of land. Lower = Less land
float l = 0.5;

//Amount of beach. Higher = More beach
float bc = 0.05;

//Speed of generation. Set lower if you have a potato.
float speed = 20000;

//Noise Variables (don't change)
float x = 0;
float y = -s;
float t0 = 1;
float t1 = 1;
float r0 = 1;
float c0 = 0.01;
float c1 = 0.01;
float br0 = 1;
float bt0 = 2;
float bt1 = 2;
float bc0 = 0.01;
float bc1 = 0.01;
float bl = 0.5;
float bb = 0.05;

//Set the window size and certain other parameters
void setup(){
  frameRate(60);
  size(1000,1000); 
  background(0); 
  noStroke(); 
}

//Generate the terrain
void draw() { for(int i = 0; i < speed; i ++) { 
  r0 = noise(t0,t1);
  br0 = noise(bt0,bt1);
  if(r0 > l ) { fill(0,255,0); if(br0 > bl) { fill(0,200,0); } if(br0 > bl-bb && br0 < bl) { fill(0,220,0); } } else if(r0 > (l-bc) && r0 < l) { fill(240,240,100); } else { fill(0,0,255); }
  rect(x,y,s,s); x += s;
  if(x > width) { x = 0; y += s; t0 = 1;  t1 += c1; bt1 += bc1; bt0 = 1;}
  t0 += c0; bt0 += bc0; } }
