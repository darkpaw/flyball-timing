
pipe_id = 56.0;
pipe_length = 660.0;

element_od = pipe_id - 4;

base_height = 5;
element_length = 25;
rounded = 2;



module element_body() {
        
    translate([0,0,0]){
       $fn=50;
       minkowski(){
            union(){
                
                difference(){
                    circle(r=element_od/2.0 - 2, $fn=360);
                    union(){
                        // cutout for onion2 module
                        minkowski(){
                            polygon(points=[[-12, -38], [12, -38], [12, 38], [-12, 38]]);
                            circle(3);
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
                        cylinder(r=element_od/2.0, h=base_height, $fn=240);
                    }
                }
                
                linear_extrude(height=element_length, convexity=6, $fn=240) {
                    element_body();
                    
                }
                
                
            }
                
            union(){
                
                translate([-element_od/2 + 6, 0, -0.1]) cylinder(r=4.2, h=80); 
                translate([element_od/2 - 6, 0, -0.1]) cylinder(r=4.2, h=80); 

                
                // Cutout for wires to pass through bottom.
                translate([0, 0, -1]){
                    linear_extrude(height=20, $fn=60) {
                        
                        minkowski(){
                            polygon(points=[ [8, -16], [8, 14], [-8, 14], [-8, -16]]);
                            circle(3);
                        }
                        
                    }     
                }

                
            }
                
        }
        
    }
}


onion_element(true);


    
    
    