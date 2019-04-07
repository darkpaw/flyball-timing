
pipe_id = 56.0;
pipe_length = 660.0;

base_height = 5;
element_length = 67 + base_height;

front_aperture_width = 40;
rounded = 2;



module battery_18650() {
    
    cylinder(r=18000/1000/2, h=650/10, $fn=128);
    
}

module peg() {
    
    cylinder(r1=5, r2=4, h=5, $fn=36);
  
}    


module element_body() {
        
    translate([0,0, 85]){
       $fn=50;
       minkowski(){
            union(){
                
                difference(){
                    circle(r=pipe_id/2.0 - 2 - 0.2, $fn=360);
                    union(){

                        for(y=[-1,1]){    
                            // battery 
                            union(){
                                translate([0,16 * y,0])
                                    circle(r=9.6 + 2);                                
                                translate([0,24 * y,0])
                                    square([23,20], center=true);
                            }
                            
                            for(x=[-1,1]){    
                                translate([20 * x, 16 * y, 0])
                                    circle(r=8);
                            }
                            
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
                
            }
                
        }
        
    }
}

translate([0,0,6]) {
    translate([0,16,0]) 
        %battery_18650();
    translate([0,-16,0]) 
        %battery_18650();
}

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

    
    
    
    