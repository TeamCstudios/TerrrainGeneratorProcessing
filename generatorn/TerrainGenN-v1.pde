// DO NOT CHANGE
float[][] terrain;
float[][] temperature;
float noiseScale = 0.02;
float tempScale = 0.004;

// Set to 1 for all-white terrain (easy on MSPaint)
int bnw = 0;

// Variables that modify height and temperature. 0 by default.
float tempmod = 0;
float heightmod = 0;

// Setup script
void setup(){
  background(100);
  size(900,700);
  textSize(36);
  terrain = new float[width][height];
  temperature = new float[width][height];
}

// Where it all happens.
void draw(){
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      terrain[x][y] = noise(x * noiseScale, y* noiseScale);
      temperature[x][y] = noise(x * tempScale, y* tempScale); 
    }
  }
  noStroke();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      terrain[x][y] += heightmod;
      temperature[x][y] += tempmod;
      if(terrain[x][y] > 0.81){
        fill(10);
      }else if(terrain[x][y] > 0.78){
        fill(55);
      }else if(terrain[x][y] > 0.4){
        if(temperature[x][y] > 0.6){
          //Desert
          fill(230,255,20);
        }else if(temperature[x][y] > 0.55){
          //Desert Transition
          fill(100,250,60);
        }else if(temperature[x][y] < 0.4){
          //Winter
          fill(255);
        }else if(temperature[x][y] < 0.45){
          //Winter Transition
          fill(200,255,200);
        }else{
          //Plains
          fill(50,250,50);
        }
      }else if(terrain[x][y] > 0.34){
        if(temperature[x][y] > 0.6){
          //Hot Beach
          fill(250,250,00);
        }else if(temperature[x][y] < 0.4){
          //Cold Beach
          fill(250,250,200);
        }else{
          //Beach
          fill(250,250,50);
        }
      }else{
        //Ocean
        fill(50,50,250);
      }
      if(bnw == 1){
        if(terrain[x][y] > 0.35){
          fill(255);
        }else{
          fill(0,0,255);
        } 
      }
      rect(x,y,1,1);
    }
  }
}

void keyPressed(){
  if(keyCode == UP){
    heightmod += 0.05;
  } 
  if(keyCode == DOWN){
    heightmod -= 0.05;
  }  
  if(keyCode == RIGHT){
    tempmod += 0.05;
  }  
  if(keyCode == LEFT){
    tempmod -= 0.05;
  }  
}
