use <rprizma.scad>
use <perimeter.scad>

module base(
    base_w = 80, 
    base_d = 160, 
    base_h = 4,
    
    belt_bottom = 50,
    
    uphole_width = 24,
    uphole_deep = 12,
    
    deep = 30,
    width = 50,
    height = 7,
    wall = 2,
    
    mortize_width = 6,
){
 
    hole_d = 2;
    hole_padding = 3;
    
    
    translate([0,0,-height/2-base_h/2+wall]){
        difference(){
            translate([0,base_d/2-belt_bottom+deep/2+wall,0]){
                difference(){
                    rprizma([base_w, base_d, base_h],2,2,2,2);
                    perimeter(
                        width = base_w,
                        deep = base_d,
                        height = base_h*2,
                        hole_padding = hole_padding,
                        hole_d = hole_d
                    );
                }
            }
            
            translate([0,deep/2-uphole_deep/2-wall,0]){
                cube([uphole_width, uphole_deep, base_h*2], center=true);
            }
            
//            perimeter(
//                width = width+hole_padding*2,
//                deep = deep+hole_padding*2,
//                height = base_h*2,
//                hole_padding = hole_padding,
//                hole_d = hole_d
//            );
            
        }    
    }
    
}

base();