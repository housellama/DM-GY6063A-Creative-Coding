function Particle(loc) {
  this.loc = loc;
  this.acc = new p5.Vector();
  this.vel = new p5.Vector(random(-1,1), random(-2,0));
  this.lifespan = 255;
}

Particle.prototype = {
  constructor: Particle,
  update : function(){  
    this.vel.add(this.acc);
    this.loc.add(this.vel);
    this.lifespan -=2.0;
  },
  display : function(){
    stroke(0,this.lifespan);
    fill(175, this.lifespan);
    ellipse(this.loc.x, this.loc.y, 8, 8);
  }  
};

// a collection that will hold our particle objects
var particles = [];

function setup(){
  createCanvas(windowWidth,windowHeight);
  for (var i=0; i< 50; i++){
    particles[i] = new Particle(new p5.Vector(width/2, height/2));
  }
}

function draw(){
  background(0);
  for (var i=0; i < particles.length; i++){
    particles[i].update();
    particles[i].display();
  }
}