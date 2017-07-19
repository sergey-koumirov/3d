module perimeter(
    width = 80,
    deep = 160,
    height = 4,
    hole_padding = 3,
    hole_d = 2
    
){
    x_cnt = ceil(width/hole_padding)-1;
    x_shift = (width-hole_padding*(x_cnt-1))/2;
    
    for(d = [0:x_cnt-1]){
        translate([
            -width/2+x_shift+d*hole_padding,
            -deep/2+hole_d/2+(hole_padding-hole_d),
            0
        ]){
            cylinder(height*2, d=hole_d, center=true, $fn=16);
        }
        
        translate([
            -width/2+x_shift+d*hole_padding,
            deep/2-hole_d/2-(hole_padding-hole_d),
            0
        ]){
            cylinder(height*2, d=hole_d, center=true, $fn=16);
        }
    }
    
    y_cnt = ceil(deep/hole_padding)-3;
    y_shift = (deep-hole_padding*(y_cnt-1))/2;
    
    for(d = [0:y_cnt-1]){
        translate([
            -width/2+hole_d/2+(hole_padding-hole_d),
            -deep/2+y_shift+d*hole_padding,
            0
        ]){
            cylinder(height*2, d=hole_d, center=true, $fn=16);
        }
        
        translate([
            width/2-hole_d/2-(hole_padding-hole_d),
            -deep/2+y_shift+d*hole_padding,
            0
        ]){
            cylinder(height*2, d=hole_d, center=true, $fn=16);
        }
    }

    //%cube([width,deep,height],center=true);
    
}

perimeter();