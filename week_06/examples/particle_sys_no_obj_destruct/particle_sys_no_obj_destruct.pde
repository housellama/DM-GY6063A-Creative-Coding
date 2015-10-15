/**
* WARNING: THIS APPLICATION WILL PURPOSELY SLOW DOWN TREMENDOUSLY
* It is meant to demonstrate the need for object destruction
* And the impact that objects creation have on RAM
**/
ArrayList<Particle> particles;
int numInitialParticles = 2500;
void setup(){
  size(500,500);
  particles = new ArrayList<Particle>();
  
  for (int i=0; i < numInitialParticles; i++){
    particles.add(new Particle(new PVector(width/2, height/2)));
  }
}
void draw(){
  background(0);
  
  //we set the title bar to be our current app
  // frame rate
  frame.setTitle(int(frameRate) + " fps");
  
  //we add a new particle to our ArrayList once per frame
  particles.add(new Particle(new PVector(width/2, height/2)));  
  
  //notice how we use particles.size(), instead of particles.length
  for(int i=0; i < particles.size(); i++)
  {
    //notice how we access ArrayList elements by get(i)
    particles.get(i).update();
    particles.get(i).display();
  }
  String numOfParticles = particles.size() + " particles";
  text(numOfParticles, 20, height-100);
}