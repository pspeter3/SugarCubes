/**
 *     DOUBLE BLACK DIAMOND        DOUBLE BLACK DIAMOND
 *
 *         //\\   //\\                 //\\   //\\  
 *        ///\\\ ///\\\               ///\\\ ///\\\
 *        \\\/// \\\///               \\\/// \\\///
 *         \\//   \\//                 \\//   \\//
 *
 *        EXPERTS ONLY!!              EXPERTS ONLY!!
 *
 * This file implements the mapping functions needed to lay out the physical
 * cubes and the output ports on the panda board. It should only be modified
 * when physical changes or tuning is being done to the structure.
 */

public Model buildModel() {

  
  // Shorthand helpers for specifying wiring more quickly
  final Cube.Wiring WFL = Cube.Wiring.FRONT_LEFT;
  final Cube.Wiring WFR = Cube.Wiring.FRONT_RIGHT;
  final Cube.Wiring WRL = Cube.Wiring.REAR_LEFT;
  final Cube.Wiring WRR = Cube.Wiring.REAR_RIGHT;
  
  // Utility value if you need the height of a cube shorthand
  final float CH = Cube.EDGE_HEIGHT;
  
  // Positions for the bass box
  final float BBY = BassBox.EDGE_HEIGHT + BoothFloor.PLEXI_WIDTH;
  final float BBX = 56;
  final float BBZ = 2;


  // The model is represented as an array of towers. The cubes in the tower
  // are represenented relatively. Each tower has an x, y, z reference position,
  // which is typically the base cube's bottom left corner.
  //
  // Following that is an array of floats. A 2-d array contains an x-offset
  // and a z-offset from the previous reference position. Typically the first cube
  // will just be {0, 0}. Each successive cube uses the position of the previous
  // cube as its reference.
  //
  // A 3-d array contains an x-offset, a z-offset, and a rotation about the
  // y-axis.
  //
  // The cubes automatically increment their y-position by Cube.EDGE_HEIGHT.
  TowerMapping[] towerCubes = new TowerMapping[] {
    
   
 
    //back left cube tower: Channel 1
    new TowerMapping(0, Cube.EDGE_HEIGHT, 70, new CubeMapping[] {
     new CubeMapping(18, -2.5, 45, WRL),
     new CubeMapping(15, -6, 45, WFR),
      new CubeMapping(-6 , 7, 5,  WRR),
      new CubeMapping(18, 11, -5, WFL)
     
   }),
    
     //second from left back tower: Channel 2
      new TowerMapping(31, Cube.EDGE_HEIGHT, 73.5, new CubeMapping[] {
       new CubeMapping( 12.5, 5.5 , 10 , WRR),
       new CubeMapping( 16.5, 2.5 , 30, WRR),
      new CubeMapping( 16.5, 3, 10, WRR),
      new CubeMapping(.5, 4.5, -10 , WFL)
    } ), 
    
          //center tower,  Channel 3
     new TowerMapping(106, Cube.EDGE_HEIGHT, 84, new CubeMapping[] {
       new CubeMapping( -3.5, -2, 10, WFL),
       new CubeMapping( -11, 5, 30, WFR),
      new CubeMapping( 13.5, 2, 15, WRR),
      new CubeMapping(20.75, -4, 35 , WRL)
    } ), 
    
        //second from back right tower,  Channel 4
   
    new TowerMapping(160, Cube.EDGE_HEIGHT, 78, new CubeMapping[] {
       new CubeMapping( -31.5, -.5 , 5 , WFR),
       new CubeMapping( 7, -.5, 60, WRL),
      new CubeMapping( -5.5, -3, 0, WFR),
      new CubeMapping(22 , 2 , 30 , WRL)
    }), 
     
    
  //back right cubes: temp Channel 5
   new TowerMapping(201, Cube.EDGE_HEIGHT, 72, new CubeMapping[] {
     new CubeMapping(7.5, 6, 25, WRL),
     new CubeMapping(-4.5, -0.5, 18, WFR),
      new CubeMapping(8.5, .5, 30,  WRL),
      new CubeMapping(-7, -14, 10, WFR)
     
   }),

    
   
   
         
       //tower to the right of BASS BOX   Channel 6
     new TowerMapping (192, Cube.EDGE_HEIGHT, 40, new CubeMapping[] {
       new CubeMapping(-6, 4, -10, WRL), 
       new CubeMapping(5 ,5 , 5, WFR ), 
       new CubeMapping(-2, .5 , -3, WFL), 
       new CubeMapping(-10, 5.5 , -20, WRR )
     }),
     
     //end right tower in middle, right of previous tower  Channel 7
      new TowerMapping (214, Cube.EDGE_HEIGHT, 37, new CubeMapping[] {
       new CubeMapping(10,0 ,  50, WRR), 
       new CubeMapping(5 ,5 , 65, WFL),
     new CubeMapping(18, -2.5, 45, WRL), // fake
     new CubeMapping(18, -2.5, 45, WRL), // fake
     }),
//    // DJ booth, from back left to back right  Channel 8
new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {
      new CubeMapping(19.625, 5.375, -22, WFR), //27
      new CubeMapping(5, 7.5, 10, WFR),  //28
    }),
    new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {
      new CubeMapping(-4, 3, -10, WRR), //29
      new CubeMapping(0, -5, 20, WRL), //30
    }),
    
 new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {  
      new CubeMapping(3, 28, 3, WFL),
      new CubeMapping(-2, 11.5, 10, WFR),
      new CubeMapping(10.5, 4.5, 40, WFR),
     
      
    }),

    
 
    new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {
      new CubeMapping(48, 4.75, -35, WRL),
      new CubeMapping(8, -15, 10, WRR),
    }),
    new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {
      new CubeMapping(78.75, 3.75, -28, WRR),
      new CubeMapping(8, -15, 10, WRR),
    }),
    
    // next two are right DJ channel
    
   new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {
      new CubeMapping(105, 20.5, 20, WRR),
      new CubeMapping(6, -6, 30, WFR),
   }),
   
      new TowerMapping(BBX, BBY, BBZ, new CubeMapping[] {
      new CubeMapping(104.75, 0, -27, WRL),
      new CubeMapping(8, -15, 10, WFL),      
    }),    
    
      //back left cubes: temp Channel 1 
  new TowerMapping(0, Cube.EDGE_HEIGHT, 72, new CubeMapping[] {
      new CubeMapping(0, 14,  -45 , WRL), 
      new CubeMapping(18, -12, -20, WFL),
      new CubeMapping(5, 9, 45, WRR),
      
    }),
   
  };
  // Single cubes can be constructed directly here if you need them
  Cube[] singleCubes = new Cube[] {
    //back left channel behind speaker
    new Cube(15, int( Cube.EDGE_HEIGHT), 39, 0, 10, 0,  WRL), 
    new Cube(-6, int(Cube.EDGE_HEIGHT),  47, 0, 20, 0, WFR), 
    new Cube(0, int(2*Cube.EDGE_HEIGHT), 46, 0, 40, 0, WRR),  
    
    // Top left Channel Above DJ booth
    new Cube(33, int(4.5*Cube.EDGE_HEIGHT ),  28, 0, 10, 0, WRR), 
    new Cube(35, int(5*Cube.EDGE_HEIGHT ),  52, 0, 10, 0, WRR), 
    new Cube(56, int(5*Cube.EDGE_HEIGHT ),  69, 0, 10, 0, WFL), 
    new Cube(76, int(5*Cube.EDGE_HEIGHT ),  61, 0, -45, 0, WRL), 
    
    //next channel to the right, same height
     new Cube(85, int(5*Cube.EDGE_HEIGHT ),  77, 0, 20, 0, WRL), 
     new Cube(92, int(6*Cube.EDGE_HEIGHT ),  63, 0,20, 0, WRR), 
     new Cube(86, int(6*Cube.EDGE_HEIGHT ),  47, 0, -45, 0, WRL), 
     new Cube(123, int(6*Cube.EDGE_HEIGHT ),  31, 0, 20, 0, WFR), 
     
     // next channel to right, same height
     new Cube(111, int(5*Cube.EDGE_HEIGHT ),  79, 0, 30, 0, WRL), 
     new Cube(125, int(6*Cube.EDGE_HEIGHT ),  76, 0,27, 0, WRL), 
     new Cube(144, int(5*Cube.EDGE_HEIGHT ),  44, 0, 45, 0, WRR), 
     new Cube(134, int(5*Cube.EDGE_HEIGHT ),  42, 0, 45, 0, WRL), 
     
     //next channel to right
      new Cube(185, int(4*Cube.EDGE_HEIGHT ),  73, 0, -45, 0, WRR), 
     new Cube(170, int(5*Cube.EDGE_HEIGHT ),  58, 0,40, 0, WRL), 
     new Cube(158, int(6*Cube.EDGE_HEIGHT ),  34, 0, 40, 0, WFR), 
     new Cube(130, int(6*Cube.EDGE_HEIGHT ),  10, 0, -5, 30, WRL), 
     
     //next channel highest to the right
      new Cube(203, int(5*Cube.EDGE_HEIGHT ),  55, 0, 35, 0, WRR), 
     new Cube(174, int(5*Cube.EDGE_HEIGHT ),  32, 0,35, 0, WFR), 
     new Cube(178, int(6.5*Cube.EDGE_HEIGHT ),  16, 0, 20 , 30, WRL), 
     new Cube(212, int(6.5*Cube.EDGE_HEIGHT ), 23, 0, 20 ,30, WRR), 
     
    //last channel
     new Cube(204, int(5*Cube.EDGE_HEIGHT ),  28, 0, 25, 0, WFR), 
     new Cube(185, int(6*Cube.EDGE_HEIGHT ),  38, 0,40, 0, WRR), 
    
    // new Cube(x, y, z, rx, ry, rz, wiring),
  };

  // The bass box!
  //BassBox bassBox = new BassBox(BBX, 0, BBZ);
  //test for Alex, should be commented out
 
  // The speakers!
  //List<Speaker> speakers = Arrays.asList(new Speaker[] {
    // each speaker parameter is x, y, z, rotation, the left speaker comes first
   // new Speaker(-12, 6, 0, 15),
   // new Speaker(TRAILER_WIDTH - Speaker.EDGE_WIDTH + 8, 6, 3, -15)
 // });

  //////////////////////////////////////////////////////////////////////
  //      BENEATH HERE SHOULD NOT REQUIRE ANY MODIFICATION!!!!        //
  //////////////////////////////////////////////////////////////////////

  // These guts just convert the shorthand mappings into usable objects
  ArrayList<Tower> towerList = new ArrayList<Tower>();
  ArrayList<Cube> tower;
  Cube[] cubes = new Cube[80];
  int cubeIndex = 1;  
  float px, pz, ny;
  for (TowerMapping tm : towerCubes) {
    px = tm.x;
    ny = tm.y;
    pz = tm.z;
    tower = new ArrayList<Cube>();
    for (CubeMapping cm : tm.cubeMappings) {
      tower.add(cubes[cubeIndex++] = new Cube(px = px + cm.dx, ny, pz = pz + cm.dz, 0, cm.ry, 0, cm.wiring));
      ny += Cube.EDGE_HEIGHT;
    }
    towerList.add(new Tower(tower));
  }
  for (Cube cube : singleCubes) {
    cubes[cubeIndex++] = cube;
  }

  return new Model(towerList, cubes, null, null);
}

/**
 * This function maps the panda boards. We have an array of them, each has
 * an IP address and a list of channels.
 */
public PandaMapping[] buildPandaList() {
  final int LEFT_SPEAKER = 0;
  final int RIGHT_SPEAKER = 1;
  
  return new PandaMapping[] {
/*    new PandaMapping(
      "10.200.1.29", new ChannelMapping[] {
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 1, 2, 3, 4 }), // J3 C0
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 5, 6, 7, 8 }), // J4 C1
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 9, 10, 11, 12 }), // J6 C2
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 13, 14, 15, 16 }), // J7 C3
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 17, 18, 19, 20 }), // J13 C4
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 21, 22, 23, 24 }), // J14 C5
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 25, 26, 1, 1 }), // J15 C6
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 27, 28, 29, 30 }), // J16 C7
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 31, 32, 33, 34 }), // J16 C7
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 35, 36, 37, 38 }), // J16 C7
        
    }),*/
    new PandaMapping( // 6 
      "10.200.1.30", new ChannelMapping[] {
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 1, 2, 3, 4 }), // J3 C0
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 5, 6, 7, 8 }), // J4 C1
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 9, 10, 11, 12 }), // J6 C2
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 13, 14, 15, 16 }), // J7 C3
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 17, 18, 19, 20 }), // J13 C4
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 21, 22, 23, 24 }), // J14 C5
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 25, 26, 27, 28 }), // J15 C6
        new ChannelMapping(ChannelMapping.MODE_CUBES, new int[] { 29, 30, 31, 32 }), // J16 C7        
    }),
    
  };  

}



class TowerMapping {
  public final float x, y, z;
  public final CubeMapping[] cubeMappings;
  
  TowerMapping(float x, float y, float z, CubeMapping[] cubeMappings) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.cubeMappings = cubeMappings;
  }
}

class CubeMapping {
  public final float dx, dz, ry;
  public final Cube.Wiring wiring;
  
  CubeMapping(float dx, float dz, Cube.Wiring wiring) {
    this(dx, dz, 0, wiring);
  }

  CubeMapping(float dx, float dz, float ry) {
    this(dz, dz, ry, Cube.Wiring.FRONT_LEFT);
  }
  
  CubeMapping(float dx, float dz, float ry, Cube.Wiring wiring) {
    this.dx = dx;
    this.dz = dz;
    this.ry = ry;
    this.wiring = wiring;
  }
}

/**
 * Each panda board has an IP address and a fixed number of channels. The channels
 * each have a fixed number of pixels on them. Whether or not that many physical
 * pixels are connected to the channel, we still send it that much data.
 */
class PandaMapping {
  
  // How many channels are on the panda board
  public final static int CHANNELS_PER_BOARD = 16;
  
  // How many total pixels on the whole board
  public final static int PIXELS_PER_BOARD = ChannelMapping.PIXELS_PER_CHANNEL * CHANNELS_PER_BOARD;
  
  final String ip;
  final ChannelMapping[] channelList = new ChannelMapping[CHANNELS_PER_BOARD];
  
  PandaMapping(String ip, ChannelMapping[] rawChannelList) {
    this.ip = ip;
    
    // Ensure our array is the right length and has all valid items in it
    for (int i = 0; i < channelList.length; ++i) {
      channelList[i] = (i < rawChannelList.length) ? rawChannelList[i] : new ChannelMapping();
      if (channelList[i] == null) {
        channelList[i] = new ChannelMapping();
      }
    }
  }
}

/**
 * Each channel on a pandaboard can be mapped in a number of modes. The typial is
 * to a series of connected cubes, but we also have special mappings for the bass box,
 * the speaker enclosures, and the DJ booth floor.
 *
 * This class is just the mapping meta-data. It sanitizes the input to make sure
 * that the cubes and objects being referenced actually exist in the model.
 *
 * The logic for how to encode the pixels is contained in the PandaDriver.
 */
class ChannelMapping {

  // How many cubes per channel xc_PB is configured for
  public final static int CUBES_PER_CHANNEL = 4;  

  // How many total pixels on each channel
  public final static int PIXELS_PER_CHANNEL = Cube.POINTS_PER_CUBE * CUBES_PER_CHANNEL;
  
  public static final int MODE_NULL = 0;
  public static final int MODE_CUBES = 1;
  public static final int MODE_BASS = 2;
  public static final int MODE_SPEAKER = 3;
  public static final int MODE_STRUTS_AND_FLOOR = 4;
  public static final int MODE_INVALID = 5;
  
  public static final int NO_OBJECT = -1;
  
  final int mode;
  final int[] objectIndices = new int[CUBES_PER_CHANNEL];
  
  ChannelMapping() {
    this(MODE_NULL);
  }
  
  ChannelMapping(int mode) {
    this(mode, new int[]{});
  }
  
  ChannelMapping(int mode, int rawObjectIndex) {
    this(mode, new int[]{ rawObjectIndex });
  }
  
  ChannelMapping(int mode, int[] rawObjectIndices) {
    if (mode < 0 || mode >= MODE_INVALID) {
      throw new RuntimeException("Invalid channel mapping mode: " + mode);
    }
    if (mode == MODE_SPEAKER) {
      if (rawObjectIndices.length != 1) {
        throw new RuntimeException("Speaker channel mapping mode must specify one speaker index");
      }
      int speakerIndex = rawObjectIndices[0];
      if (speakerIndex < 0 || speakerIndex >= glucose.model.speakers.size()) {
        //throw new RuntimeException("Invalid speaker channel mapping: " + speakerIndex);
      }
    } else if ((mode == MODE_STRUTS_AND_FLOOR) || (mode == MODE_BASS) || (mode == MODE_NULL)) {
      if (rawObjectIndices.length > 0) {
        //throw new RuntimeException("Bass/floor/null mappings cannot specify object indices");
      }
    } else if (mode == MODE_CUBES) {
      for (int rawCubeIndex : rawObjectIndices) {
        if (glucose.model.getCubeByRawIndex(rawCubeIndex) == null) {
          throw new RuntimeException("Non-existing cube specified in cube mapping: " + rawCubeIndex);
        }
      }
    }
    
    this.mode = mode;
    for (int i = 0; i < objectIndices.length; ++i) {
      objectIndices[i] = (i < rawObjectIndices.length) ? rawObjectIndices[i] : NO_OBJECT;
    }
  }
}

