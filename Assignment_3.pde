import processing.sound.*;

Env env;
Env env2;

TriOsc triangle;
TriOsc triangle_sec;

WhiteNoise noise;
WhiteNoise noise_sec;
LowPass lowPass;
Reverb reverb;
Reverb reverb_sec;
Delay delay;
BandPass bandPass;

void setup() {
  color blue = color(70,130,190);
  color white = color(255,255, 255);
  size(400, 350);
  background(white);
  
  //Draw Menu for sound choosing
  fill(blue);
  rect(30, 130, 340, 80, 28);
  fill(blue);
  rect(30, 250, 340, 80, 28);
  textSize(60);
  fill(blue);
  text("Sound Effects", 27, 80); 
  textSize(50);
  fill(white);
  text("Coin Pick Up", 65, 185); 
  textSize(50);
  fill(white);
  text("Monster Attack", 45, 305); 
  
  
  // Envs:
  env  = new Env(this); 
  env2  = new Env(this); 
  
  // Oscillators:
  triangle = new TriOsc(this);
  triangle_sec = new TriOsc(this);
  
  // Noises:
  noise = new WhiteNoise(this);
  noise_sec = new WhiteNoise(this);
  
  // Effects:
  lowPass = new LowPass(this);
  reverb = new Reverb(this);
  reverb_sec = new Reverb(this);
  delay = new Delay(this);
  bandPass = new BandPass(this);
  
}      

void draw() {     
}

void mousePressed() {
  
  // Coin Pick Up Sound
  if (mouseX>=30 && mouseX <=370 && mouseY>=130 && mouseY<=210){
      // First Layer
      float attackTime = 0.001;
      float sustainTime = 0.01;
      float sustainLevel = 0.5;
      float releaseTime = 0.3;
      triangle.play();
      triangle.freq(14000);
      reverb.process(triangle);
      reverb.room(0.7);
      reverb.wet(0.4);
      env.play(triangle, attackTime, sustainTime, sustainLevel, releaseTime);
      
      //Second Layer
      triangle_sec.play();
      triangle_sec.freq(11000);
      reverb_sec.process(triangle_sec);
      reverb_sec.room(0.9);
      reverb_sec.wet(0.4);
      delay.process(triangle_sec,5,0.08);
      env2.play(triangle_sec, 0.001, 0.1, 0.2, 0.3);
  }
  
  // Monster Attack Sound
  if (mouseX>=30 && mouseX <=370 && mouseY>=250 && mouseY<=330){
    // First Layer
    noise.play();
    reverb_sec.process(noise);
    lowPass.process(noise, 6500);
    reverb_sec.room(0.9);
    reverb_sec.damp(0.001);
    reverb_sec.wet(0.001);
    env.play(noise, 0.001, 0.09, 0.1, 0.09);
    
    // Second Layer
    noise_sec.play();
    bandPass.process(noise_sec);
    bandPass.set(3000, 3000);
    env2.play(noise_sec, 0.001, 0.05, 0.1, 0.04);
  }
}
