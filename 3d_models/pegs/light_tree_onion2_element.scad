
pipe_id = 56.0;
pipe_length = 660.0;

base_height = 5;
element_length = 120;

front_aperture_width = 40;
rounded = 2;


module peg() {
    
    cylinder(r1=5, r2=4, h=5, $fn=36);
  
}    

module onion2() {
    
    cube([46, 70, 20]);
  
}    


module element_body() {
        
    translate([0,0,0]){
       $fn=50;
       minkowski(){
            union(){
                
                difference(){
                    circle(r=pipe_id/2.0 - 2 - 0.2, $fn=360);
                    union(){
                        // cutout for onion2 module
                        minkowski(){
                            polygon(points=[[-12, -38], [10, -38], [10, 30], [-12, 30]]);
                            circle(3);
                        }
                        
                        for(y=[-1,1]){   
                            
                            translate([-20, 16 * y, 0])
                                square([10,10], center=true); 
                                
                            for(x=[-1,1]){    
                                translate([20 * x, 16 * y, 0])
                                    circle(r=6);
                            }
                        }
                       
                        
                       
                    }

                }
            }
            circle(2);
        }
    }
}

module onion_element(with_base=false) {

    color("teal"){
        
        difference(){
                
            union(){
                
                if(with_base) {
                    difference(){
                        cylinder(r=(pipe_id/2.0) - 0.2, h=base_height, $fn=240);
                        
                        union(){
                            translate([14,-25,-0.1], center=true)
                                cube([20,50, base_height+.2]);
                        }
                    }
                }
                
                linear_extrude(height=element_length, convexity=6, $fn=240) {
                    element_body();
                    
                }
                
                translate([-pipe_id/2 + 8, 0, element_length - 0.5 ]) peg(); 
                translate([pipe_id/2 - 8, 0, element_length - 0.5]) peg(); 
                
            }
                
            union(){
                
                if(with_base) {
                    translate([-pipe_id/2 + 8, 0, -0.1]) peg(); 
                    translate([pipe_id/2 - 8, 0, -0.1]) peg(); 
                } else {
                    translate([-30,-20,-.10])
                        cube([40,60,30]);
                }
                
                // Cutout for wires to pass through bottom.
                translate([0, 0, -1]){
                    linear_extrude(height=20, $fn=60) {
                        
                        minkowski(){
                            polygon(points=[ [6, -16], [6, 14], [-8, 14], [-8, -16]]);
                            circle(3);
                        }
                        
                    }     
                }

                
            }
                
        }
        
    }
}


//translate([80,0,0]) element_body();
//
//translate([14,-22,76]) 
//    rotate([-90,0,95])
//        %onion2();

// translate([-80,0,0]) onion_element(false);
onion_element(true);

// onion_element(false);


    
    
    