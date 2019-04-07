
pipe_id = 56.0;
pipe_length = 660.0;

element_od = pipe_id - 4;

base_height = 5;
element_length = 60 + base_height;

front_aperture_width = 40;
rounded = 2;


module element_body() {
        
    translate([0,0, 65]){
       $fn=50;
       minkowski(){
            union(){
                
                difference(){
                    circle(r=element_od / 2 - 2, $fn=360);
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
                
                cylinder(r=element_od / 2, h=base_height, $fn=240);
                
                linear_extrude(height=element_length, convexity=6, $fn=240) {
                    element_body();
                    
                }
                
//                translate([-pipe_id/2 + 8, 0, element_length - 0.5 ]) peg(); 
//                translate([pipe_id/2 - 8, 0, element_length - 0.5]) peg(); 
                
            }
                
            union(){
                
                
                translate([-element_od/2 + 6, 0, -0.1]) cylinder(r=4.2, h=80); 
                translate([element_od/2 - 6, 0, -0.1]) cylinder(r=4.2, h=80); 
                
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
                        difference(){
                            cylinder(r=6, h=40, $fn=120);
                            translate([-10,-10,10])
                                cube([8,30,20], center=false);
                        }

                }
           
                translate([-2.6,20,base_height + (element_length - base_height) / 2 - 9]){
                    rotate([90,0,0])
                        difference(){
                            cylinder(r=6, h=40, $fn=120);
                            translate([3,-10,10])
                                cube([8,30,20], center=false);
                        }
                }
               
                
            }
                
        }
        
    }
}


led_element();

translate([0, 0, -30])
    %cylinder(r=pipe_id/2.0, h=120, $fn=120);

    
    
    
    