class SineSphere extends DPat {
 float modelrad = sqrt((model.xMax)*(model.xMax) + (model.yMax)*(model.yMax) + (model.zMax)*(model.zMax));
 //PVector modelcenter = new PVector(model.xMax, model.yMax, model.zMax);
  Pick Sshape; 

  class Sphery {
  float f1xcenter, f1ycenter, f1zcenter, f2xcenter , f2ycenter, f2zcenter; //second three are for an ellipse with two foci
  private  SinLFO vibration; 
  private  SinLFO surface;
  private  SinLFO vx;
  private SinLFO xbounce;
  public SinLFO ybounce;
  private SinLFO zbounce;
  float vibration_min, vibration_max, vperiod;
  public BasicParameter widthparameter;
  public BasicParameter huespread;
  public BasicParameter bouncerate;
  public BasicParameter bounceamp;
  
  
 
  public Sphery(float f1xcenter, float f1ycenter, float f1zcenter, float vibration_min, float vibration_max, float vperiod) 
  {
   this.f1xcenter = f1xcenter;
   this.f1ycenter = f1ycenter;
   this.f1zcenter = f1zcenter;
   this.vibration_min = vibration_min;
   this.vibration_max = vibration_max;
   this.vperiod = vperiod;
   addParameter(bounceamp = new BasicParameter("Amp", .5));
   addParameter(bouncerate = new BasicParameter("Rate", .5));  //ybounce.modulateDurationBy(bouncerate);
   addParameter(widthparameter = new BasicParameter("Width", .1));
   addParameter(huespread = new BasicParameter("Hue", .2));
  
   addModulator( vx = new SinLFO(-4000, 10000, 100000)).trigger() ;
   //addModulator(xbounce = new SinLFO(model.xMax/3, 2*model.yMax/3, 2000)).trigger(); 
   addModulator(ybounce= new SinLFO(model.yMax/3, 2*model.yMax/3, 240000./lx.tempo.bpm())).trigger(); //ybounce.modulateDurationBy
    
   //addModulator(bounceamp); //ybounce.setMagnitude(bouncerate);
   addModulator( vibration = new SinLFO(vibration_min , vibration_max, 240000./lx.tempo.bpm())).trigger(); //vibration.modulateDurationBy(vx);
   
  }
 public Sphery(float f1xcenter, float f1ycenter, float f1zcenter, float f2xcenter, float f2ycenter, float f2zcenter, 
  float vibration_min, float vibration_max, float vperiod)  
 {
    this.f1xcenter = f1xcenter;
   this.f1ycenter = f1ycenter;
   this.f1zcenter = f1zcenter;
   this.f2xcenter = f2xcenter;
   this.f2ycenter = f2ycenter;
   this.f2zcenter = f2zcenter;
   this.vibration_min = vibration_min;
   this.vibration_max = vibration_max;
   this.vperiod = vperiod;
   //addModulator(xbounce = new SinLFO(model.xMax/3, 2*model.yMax/3, 2000)).trigger(); 
   addModulator(ybounce).trigger(); 
   addModulator( vibration = new SinLFO(vibration_min , vibration_max, lx.tempo.rampf())).trigger(); //vibration.modulateDurationBy(vx);
   addParameter(widthparameter = new BasicParameter("Width", .1));
   addParameter(huespread = new BasicParameter("Hue", .2));
  
}





float distfromcirclecenter(float px, float py, float pz, float f1x, float f1y, float f1z) 
{
   return dist(px, py, pz, f1x, f1y, f1z);
    }
 //void updatespherey(deltaMs, )
 color spheryvalue (float px, float py, float pz , float f1xc, float f1yc, float f1zc) 
 {
//switch(sShpape.cur() ) {}  
   return color(constrain(huespread.getValuef()*5*px, 0, 360) , dist(px, py, pz, f1xc, f1yc, f1zc) , 
    max(0, 100 - 100*widthparameter.getValuef()*abs(dist(px, py, pz, f1xcenter, ybounce.getValuef(), f1zcenter)
      - vibration.getValuef() ) ) ); 
 }
 color ellipsevalue(float px, float py, float pz , float f1xc, float f1yc, float f1zc, float f2xc, float f2yc, float f2zc)
  {
//switch(sShpape.cur() ) {}  
   return color(huespread.getValuef()*5*px, dist(model.xMax-px, model.yMax-py, model.zMax-pz, f1xc, f1yc, f1zc) , 
    max(0, 100 - 100*widthparameter.getValuef() *
      abs( (dist(px, py, pz, f1xc, ybounce.getValuef(), f1zc) + 
        (dist(px, py , pz, f2xc, ybounce.getValuef(), f2zc) ) )/2  
      - 1.2*vibration.getValuef() ) ) ) ; 
  }


   void run(int deltaMS) { };
  
}  


final Sphery[] spherys;
  SineSphere(GLucose glucose) 
  {
    super(glucose);
    //Sshape = addPick("Shape", 0, 1);
    spherys = new Sphery[] {
      new Sphery(model.xMax/4, model.yMax/2, model.zMax/2, modelrad/16, modelrad/8, 3000),
      new Sphery(.75*model.xMax, model.yMax/2, model.zMax/2, modelrad/20, modelrad/10, 2000),
      new Sphery(model.xMax/2, model.yMax/2, model.zMax/2,  modelrad/4, modelrad/8, 2300),
    };
  
  }

// public void onParameterChanged(LXParameter parameter)
// {


//     for (Sphery s : spherys) {
//       if (s == null) continue;
//       double bampv = s.bounceamp.getValue();
//       double brv = s.bouncerate.getValue();
//       double tempobounce = lx.tempo.bpm();
//       if (parameter == s.bounceamp) 
//       {
//         s.ybounce.setRange(bampv*model.yMax/3 , bampv*2*model.yMax/3, brv);
//       }
//       else if ( parameter == s.bouncerate )   
//       {
//         s.ybounce.setDuration(120000./tempobounce);
//       }
//     }
//   }

     void StartRun(int deltaMs) {
     float t = lx.tempo.rampf();
     float bpm = lx.tempo.bpmf();
     //spherys[1].run(deltaMs);
     //spherys[2].run(deltaMs);
     //spherys[3].run(deltaMs);
  
       


  }
  int spheremode = 0;
  
   // void keyPressed() {
   //   spheremode++;
   //     }

  color CalcPoint(xyz Px) 
  { 
       // if (spheremode == 0 )
              //{
             color c = 0;
             c = blendColor(c, spherys[1].spheryvalue(Px.x, Px.y, Px.z, .75*model.xMax, model.yMax/2, model.zMax/2), ADD);
             c = blendColor(c, spherys[0].spheryvalue(Px.x, Px.y, Px.z, model.xMax/4, model.yMax/4, model.zMax/2), ADD);
             c = blendColor(c, spherys[2].spheryvalue(Px.x, Px.y, Px.z, model.xMax/2, model.yMax/2, model.zMax/2),ADD);
             return c;
             //}
      //   else if (spheremode == 1)
      // {

      //   color c = 0;
      //   c = blendColor(c, spherys[3].ellipsevalue(Px.x, Px.y, Px.z, model.xMax/4, model.yMax/4, model.zMax/4, 3*model.xMax/4, 3*model.yMax/4, 3*model.zMax/4),ADD);
      //   return c; 
      // }
      // return color(0,0,0);
      //  // else if(spheremode ==2)
       // { color c = 0;
       //   return color(CalcCone( (xyz by = new xyz(0,spherys[2].ybounce.getValuef(),0) ), Px, mid) );

       // }

  
          } 
        
  }

 class HueTestHSB extends SCPattern{
  BasicParameter HueT = new BasicParameter("Hue", .5);
  BasicParameter SatT = new BasicParameter("Sat", .5);
  BasicParameter BriT = new BasicParameter("Bright", .5);

HueTestHSB(GLucose glucose) {
  super(glucose);
  addParameter(HueT);
  addParameter(SatT);
  addParameter(BriT);
}
  void run(double deltaMs){

  for (Point p : model.points) {
    color c = 0;
    c = blendColor(c, color(360*HueT.getValuef(), 100*SatT.getValuef(), 100*BriT.getValuef()), ADD);
    colors[p.index]= c;
  }
   int now= millis();
   if (now % 1000 <= 20)
   {
   println("Hue: " + 360*HueT.getValuef() + "Sat: " + 100*SatT.getValuef() + "Bright:  " + 100*BriT.getValuef());
   }
  }

 }