/*
            Terrain Generator
    Created by Yoctobyte and MrJoCrafter
*/

//Amount of zoom. Higher = More zoom
float s = 1;

//Amount of land. Higher = Less land
float l = 0.5;

//Amount of beach. Higher = More beach
float bc = 0.04;

//Speed of generation. Set lower if you have a potato.
float speed = 10000;

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
float bl = 0.6;
float bb = 0.01;
float wr0 = 1;
float wt0 = 5;
float wt1 = 5;
float wc0 = 0.01;
float wc1 = 0.01;
float wl = 0.50;
float wb = 0.05;
float tr0 = 1;
float tt0 = random(10);
float tt1 = random(10);
float tc0 = 0.01;
float tc1 = 0.01;
float tl = 0.5;

//Set the window size and certain other parameters
void setup(){
  frameRate(120);
  size(1000,800); 
  background(0); 
  noStroke(); 
}

//Generate the terrain
void draw() { for(int i = 0; i < speed; i ++) {
  r0 = noise(t0,t1);
  br0 = noise(bt0,bt1);
  wr0 = noise(wt0,wt1);
  tr0 = noise(tt0,tt1);
  if(r0 > l*2){
    // Mountain
    fill(60);
  }else if(r0 > l*1.9){
    // Mountain
    fill(70);
  }else if(r0 > l*1.8){
    // Mountain
    fill(80);
  }else if(r0 > l*1.7){
    // Mountain
    fill(95);
  }else if(r0 > l*1.6){
    // Mountain
    fill(110);
  }else if(r0 > l*1.5){
    // Mountain
    fill(155);
  }else if(r0 > l ){ 
    // Plains Biome
    fill(0,255,0);
    if(tr0 < tl-.1){
      if(wr0 > wl){ 
      // Desert Biome
      fill(255,255,80); 
      } 
      if(wr0 > wl-wb && wr0 < wl){ 
      // Desert Transition Biome
      fill(240,240,100); 
      } 
    }else if(tr0 > tl+.1){
      if(wr0 > wl){ 
      // Winter Biome
      fill(255,255,255); 
      } else if(wr0 > wl-wb && wr0 < wl){ 
      // Winter Transition Biome
      fill(225,235,245); 
      }
    }else{
      // Darkgrass Biome
      fill(0,240,0);
    }
    if(br0 > bl){ 
    // Forest Biome
    fill(0,200,0); 
    } 
    if(br0 > bl-bb && br0 < bl){ 
    // Forest Transition
    fill(0,220,0); 
    } 
  }else if(r0 > (l-bc) && r0 < l){ 
    // Beach
    fill(240,240,100); 
  }else if(r0 < l*0.5){
    // Deep Ocean
    fill(0,0,230);
  }else{
    // Ocean
    fill(0,0,255);
  }
    rect(x,y,s,s); x += s;
  if(x > width) { x = 0; y += s; t0 = 1;  t1 += c1; bt1 += bc1; bt0 = 1; wt1 += wc1; wt0 = 1; tt1 += tc1; tt0 = 1;}
  t0 += c0; bt0 += bc0; wt0 += wc0; tt0 += tc0;} }
