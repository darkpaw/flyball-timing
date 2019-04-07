
pipe_id = 56.0;
pipe_length = 660.0;

element_od = pipe_id - 4;

base_height = 5;
element_length = 65 + 5 + base_height;

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
        
       difference(){ 
           minkowski(){
                union(){
                    
                    difference(){
                        circle(r=element_od / 2 - 2, $fn=360);
                        union(){

                            for(y=[-1,1]){    
                                // battery 
                                union(){
                                    translate([0, 12 * y,0])
                                        circle(r=9.6 + 2);                                
                                    translate([0,24 * y,0])
                                        square([22.5,20], center=true);
                                }
                                
                                
                                
                            }
                            
                            square([8, 50], center=true);
                            
                            
                        }

                    }
                }
                circle(2);
            }
            
            
//   
//             for(y=[-1,1]){    
//                
//                for(x=[-1,1]){    
//                    translate([14 * x, 12 * y, 0])
//                        circle(r=1.6);
//                }
//                
//             } 
       
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
             
              for(y=[-1,1]){    
                
                for(x=[-1,1]){    
                    translate([14 * x, 12 * y, element_length - 6])
                        cylinder(r=1.6, h = 6.1, $fn=30);
                }
                
             } 
             
                
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

    
    
    
    