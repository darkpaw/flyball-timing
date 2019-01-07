
pipe_id = 65.0;
pipe_length = 660.0;

element_length = 60;

front_aperture_width = 40;

translate([0, 0, -30])
    %cylinder(r=pipe_id/2.0, h=pipe_length, $fn=120);

//translate([0, 0, -3])
//    %cube([100, 100, 5], center=true);
    

color("forestgreen"){
    
    difference(){
            
        union(){
                    cylinder(r=pipe_id/2.0-0.2, h=element_length, $fn=120);
        }
            
        union(){
            
            translate([-front_aperture_width / 2.0,  0,  5]){
                cube([front_aperture_width, 50, element_length + 2], center=false);
            }
            
            translate([-2,-22, -1]){
                cube([4, 22.1, element_length + 2], center=false);
            }
            
            translate([-20, -42, element_length - 20]){
                cube([40, 40, element_length + 2], center=false);
            }

            hull(){

                for(i=[0,1]){

                    translate([-11, -14 - i*5, -1]){
                        cylinder(r=6, h=element_length, $fn=30);
                    }

                    translate([11, -14 - i*5, -1]){
                        cylinder(r=6, h=element_length, $fn=30);
                    }
                }
                
            }

        }
            
    }
    
}

    
    
    
    
    
    
    
    
    