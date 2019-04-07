
pipe_od = 60.0;
pipe_id = 56.0;
cap_od = 66.0;


module cap(){
    difference(){
        
        cylinder(r=cap_od / 2, h=24, $fn=180); 
        
        union(){

            difference(){
                
                translate([0,0,6])
                    cylinder(r=pipe_od / 2 + 0.2, h=25, $fn=180);        
                translate([0,0,6])
                    cylinder(r=pipe_id / 2 - 0.2, h=25, $fn=180);        
            }
                       
            translate([0,0,-2])
                cylinder(r=4.2, h=40, $fn=180);       

            translate([0,0,6])
                cylinder(r=pipe_id / 2 - 12, h=46, $fn=180);        
                       
            translate([0,0,12])
                cylinder(r=pipe_id / 2 - 5, h=40, $fn=180);       
            
        }
        
    
    }
    
}

cap();