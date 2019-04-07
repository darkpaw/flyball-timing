
pipe_id = 56.0;
pipe_length = 660.0;

element_od = pipe_id - 4;

base_height = 5;
element_length = 5 + base_height;

front_aperture_width = 40;
rounded = 2;



module battery_18650() {
    
    cylinder(r=18000/1000/2, h=650/10, $fn=128);
    
}

module peg() {
    
    cylinder(r1=5, r2=4, h=5, $fn=36);
  
}    

//
//module element_body() {
//        
//    translate([0,0, 85]){
//       $fn=50;
//        
//       difference(){ 
//           minkowski(){
//                union(){
//                    
//                    difference(){
//                        circle(r=element_od / 2 - 2, $fn=360);
//                        union(){
//
////                            for(y=[-1,1]){    
////                                // battery 
////                                union(){
////                                    translate([0, 12 * y,0])
////                                        circle(r=9.6 + 2);                                
//////                                    translate([0,24 * y,0])
//////                                        square([22.5,20], center=true);
////                                }
////                                
////                                
////                                
////                            }
//                            
//                            square([8, 50], center=true);
//                            
//                            
//                        }
//
//                    }
//                }
//                circle(2);
//            }
//            
//            
////   
////             for(y=[-1,1]){    
////                
////                for(x=[-1,1]){    
////                    translate([14 * x, 12 * y, 0])
////                        circle(r=1.6);
////                }
////                
////             } 
//       
//       } 
//         
//    }
//}

module led_element() {

    color("forestgreen"){
        
        difference(){
                
            union(){
                
                cylinder(r=element_od / 2, h=base_height, $fn=240);

                // Cylinder to align with 18650 +ve end.
                translate([0, 12, 0]) cylinder(r=8.2, h=7, $fn=120); 
                translate([0, -12, 0]) cylinder(r=8.2, h=7, $fn=120);              
                
            }
                
            union(){                
                
                translate([-element_od/2 + 6, 0, -0.1]) cylinder(r=4.2, h=80, $fn=36); 
                translate([element_od/2 - 6, 0, -0.1]) cylinder(r=4.2, h=80, $fn=36);              

                // Holes for attaching lid with M3 screws.
                for(y=[-1,1]){    
                    for(x=[-1,1]){    
                        translate([14 * x, 12 * y, -0.1]){
                            cylinder(r=1.6, h = 6.1, $fn=30);
                            // Countersink.
                            translate([0,0,-0.1])
                                cylinder(r1=3.6, r2=1.6, h = 2.1, $fn=30);
                        }
                    }
                } 

                // Subtract volume for 18650 +ve terminal.
                translate([0, 12, 6]) cylinder(r=3.2, h=1.1, $fn=120); 
                translate([0, -12, 6]) cylinder(r=3.2, h=1.1, $fn=120);              

                translate([0, 0, -0.1]) cylinder(r=4.2, h=10, $fn=120);              
                
            }
                
        }
        
    }
}

//translate([0,0,6]) {
//    translate([0,16,0]) 
//        %battery_18650();
//    translate([0,-16,0]) 
//        %battery_18650();
//}

// element_body();

led_element();

//    
////translate([0,120,5])
////    peg();
//


//translate([-10,3.1,6])
//    aluminium_t_piece();                         
//translate([-15,-20,45])
//    mosfet_breakout();
//translate([0, 0, -30])
//    %cylinder(r=pipe_id/2.0, h=120, $fn=120);

    
    
    
    