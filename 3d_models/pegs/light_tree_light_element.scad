
pipe_id = 56.0;
pipe_length = 660.0;

base_height = 5;
element_length = 60 + base_height;

front_aperture_width = 40;
rounded = 2;


module aluminium_t_piece() {

    union(){
        translate([9,-20,0])
            cube([2, 20, 50]);
        cube([20, 2, 50]);
    }
}    


module mosfet_breakout() {

    rotate([90,0,0])
        cube([30, 10, 1]);

}    

module peg() {
    
    cylinder(r1=5, r2=4, h=5, $fn=36);
  
}    


module element_body() {
        
    translate([0,0, 65]){
       $fn=50;
       minkowski(){
            union(){
                
                difference(){
                    circle(r=pipe_id/2.0 - 2 - 0.2, $fn=360);
                    union(){
                        // front cutout for LED
                        minkowski(){
                            polygon(points=[[-32, 38], [32, 38], [12, 3], [-12, 3]]);
                            circle(3);
                        }
                        // rear cutout for MOSFET module
                        minkowski(){
                            polygon(points=[[-32, -38], [32, -38], [12, -3], [-12, -3]]);
                            circle(3);
                        }
                        square([8, 50], center=true);
                    }

                }
            }
            circle(2);
        }
    }
}

module led_element() {

    color("forestgreen"){
        
        difference(){
                
            union(){
                
                cylinder(r=(pipe_id/2.0) - 0.2, h=base_height, $fn=240);
                
                linear_extrude(height=element_length, convexity=6, $fn=240) {
                    element_body();
                    
                }
                
                translate([-pipe_id/2 + 8, 0, element_length - 0.5 ]) peg(); 
                translate([pipe_id/2 - 8, 0, element_length - 0.5]) peg(); 
                
            }
                
            union(){
                
                
                translate([-pipe_id/2 + 8, 0, -0.1]) peg(); 
                translate([pipe_id/2 - 8, 0, -0.1]) peg(); 
                
                // Cutout for wires to pass through bottom.
                translate([0, 0, -1]){
                    linear_extrude(height=20, $fn=60) {
                        
                        minkowski(){
                            // square([40, 40], center=true);
                            polygon(points=[ [14, -16], [9, -8], [-9, -8], [-14, -16]]);
                            circle(3);
                        }
                        
                    }     
                }
                
                // Space for led mounting M3 bolts.
                translate([2.6,20,base_height + (element_length - base_height) / 2 + 9]){
                    rotate([90,0,0])
                        cylinder(r=4.6, h=40, $fn=120);
                }
           
                translate([-2.6,20,base_height + (element_length - base_height) / 2 - 9]){
                    rotate([90,0,0])
                        cylinder(r=4.6, h=40, $fn=120);
                }
                
                // Space for the mosfet board.
//                translate([-60,28, element_length - 46]){
//                    rotate([0,-90,180])
//                    
//                        mosfet_board_cutout();
//                }

                
            }
                
        }
        
    }
}


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

    
    
    
    