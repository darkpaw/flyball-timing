
pipe_id = 65.0;
pipe_length = 660.0;

element_length = 60;

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
    
    cylinder(r1=6, r2=4, h=6, $fn=6);
  
}    


module element_body() {
        
    translate([0,0, 65]){
       $fn=50;
       minkowski(){
            union(){
                
                difference(){
                    circle(r=pipe_id/2.0 - 2 - 0.2, $fn=360);
                    union(){
                        minkowski(){
                            polygon(points=[[-32, 38], [32, 38], [12, 4], [-12, 4]]);
                            circle(3);
                        }
                        minkowski(){
                            polygon(points=[[-18, -38], [18, -38], [18, -2], [-18, -2]]);
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
                
                cylinder(r=(pipe_id/2.0) - 0.2, h=4, $fn=120);
                
                linear_extrude(height=element_length, convexity=6, $fn=120) {
                    element_body();
                    
                }
                
                translate([-pipe_id/2 + 8, 0, element_length - 0.5 ]) peg(); 
                translate([pipe_id/2 - 8, 0, element_length - 0.5]) peg(); 
                
            }
                
            union(){
                
                
                translate([-pipe_id/2 + 8, 0, -0.1]) peg(); 
                translate([pipe_id/2 - 8, 0, -0.1]) peg(); 

                translate([0, 0, -1]){
                    linear_extrude(height=20, $fn=60) {
                        
                        minkowski(){
                            // square([40, 40], center=true);
                            
                            polygon(points=[[-12, -20], [12, -20], [12, -6], [-12, -6]]);
                            
                            circle(3);
                        }
                        
                    }     
                }
           
            }
                
        }
        
    }
}


led_element();

//translate([-15,-20,45])
//    mosfet_breakout();
//    
////translate([0,120,5])
////    peg();
//
//translate([-10,3.1,6])
//    aluminium_t_piece();                         
    
    
//translate([0, 0, -30])
//    %cylinder(r=pipe_id/2.0, h=120, $fn=120);
//
    
    
    
    