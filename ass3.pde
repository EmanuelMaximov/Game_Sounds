import processing.sound.*;

Env env;
Env env2;


TriOsc triangle;
TriOsc triangle_sec;
SqrOsc square;
SawOsc saw;
SinOsc sine;
Pulse pulse;

WhiteNoise noise;
LowPass lowPass;
HighPass highPass;
Reverb reverb;
Reverb reverb_sec;
Delay delay;

float attackTime;
float sustainTime;
float sustainLevel;
float releaseTime;

float freq=0;

void setup() {
  frameRate(5);
  size(640, 360);
  background(255);
    
  // Envs:
  env  = new Env(this); 
  env2  = new Env(this); 
  
  // Oscillators:
  triangle = new TriOsc(this);
  triangle_sec = new TriOsc(this);
  saw = new SawOsc(this);
  square = new SqrOsc(this);
  sine = new SinOsc(this);
  pulse = new Pulse(this);
  
  // Noises:
  noise = new WhiteNoise(this);
  
  // Effects:
  //leaves low freq
  lowPass = new LowPass(this);
  //leaves high freq
  highPass = new HighPass(this);
  reverb = new Reverb(this);
  reverb_sec = new Reverb(this);
  delay = new Delay(this);
  
  
  //play recieves the amp
  
  
  
  
  //noise.play();
  
  
}      

void draw() {
  
    
}

void mousePressed() {
 
}

void keyPressed() {
  
  
  
  //coin pick up 2:30
  
  // First coin sound Layer
  attackTime = 0.001;
  sustainTime = 0.01;
  sustainLevel = 0.5;
  releaseTime = 0.3;
  triangle.play();
  triangle.freq(14000);
  reverb.process(triangle);
  reverb.room(0.7);
  reverb.wet(0.4);
  env.play(triangle, attackTime, sustainTime, sustainLevel, releaseTime);
  
  //Second coin sound Layer
  triangle_sec.play();
  triangle_sec.freq(11000);
  reverb_sec.process(triangle_sec);
  reverb_sec.room(0.9);
  reverb_sec.wet(0.1);
  delay.process(triangle_sec,5,0.067);
  env2.play(triangle_sec, 0.001, 0.3, 0.1, 0.3);
 
}
