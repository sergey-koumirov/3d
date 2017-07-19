module round_cube(sizes, radius){
    
    union(){
        for(xd = [-1,1]){
        for(yd = [-1,1]){
        for(zd = [-1,1]){
            translate([
                (sizes[0]/2 - radius)*xd,
                (sizes[1]/2 - radius)*yd,
                (sizes[2]/2 - radius)*zd]
            ){
                sphere(radius, $fs=0.25);
            }
        }}}
        cube([sizes[0]-radius*2,sizes[1]-radius*2,sizes[2]], center=true);
        cube([sizes[0]-radius*2,sizes[1],sizes[2]-radius*2], center=true);
        cube([sizes[0],sizes[1]-radius*2,sizes[2]-radius*2], center=true);
    
        for(d1 = [-1,1]){
        for(d2 = [-1,1]){        
            translate([
                (sizes[0]/2-radius)*d1,
                (sizes[1]/2-radius)*d2,
                0
            ]){
                cylinder(h=sizes[2]-radius*2, r=radius, center=true, $fs=0.25);
            }        
            translate([
                0,
                (sizes[1]/2-radius)*d1,
                (sizes[2]/2-radius)*d2            
            ]){
                rotate(a=[0,90,0]){
                    cylinder(h=sizes[0]-radius*2, r=radius, center=true, $fs=0.25);
                }    
            }        
            translate([
                (sizes[0]/2-radius)*d1,
                0,
                (sizes[2]/2-radius)*d2            
            ]){
                rotate(a=[90,0,0]){
                    cylinder(h=sizes[1]-radius*2, r=radius, center=true, $fs=0.25);
                }    
            }        
        }}
    }
}


module upround_cube(sizes, radius){
    
	intersection(){
	    union(){
	        for(xd = [-1,1]){
	        for(yd = [-1,1]){
	            translate([
	                (sizes[0]/2 - radius)*xd,
	                (sizes[1]/2 - radius)*yd,
	                (sizes[2]/2 - radius)*1]
	            ){
	                sphere(radius, $fs=0.5);
	            }
	        }}
        
	        cube([sizes[0]-radius*2,sizes[1]-radius*2,sizes[2]], center=true);
        
	        translate([0,0,-radius/2]){
	            cube([sizes[0]-radius*2,sizes[1],sizes[2]-radius], center=true);
	        }
	        translate([0,0,-radius/2]){
	            cube([sizes[0],sizes[1]-radius*2,sizes[2]-radius], center=true);
	        }
    
	        for(d1 = [-1,1]){
	        for(d2 = [-1,1]){        
	            translate([
	                (sizes[0]/2-radius)*d1,
	                (sizes[1]/2-radius)*d2,
	                -radius/2
	            ]){
	                cylinder(h=sizes[2]-radius, r=radius, center=true, $fs=0.5);
	            }        
	        }}

	        for(d1 = [-1,1]){
	            translate([
	                (sizes[0]/2-radius)*d1,
	                0,
	                (sizes[2]/2-radius)*1            
	            ]){
	                rotate(a=[90,0,0]){
	                    cylinder(h=sizes[1]-radius*2, r=radius, center=true, $fs=0.5);
	                }    
	            }
	            translate([
	                0,
	                (sizes[1]/2-radius)*d1,
	                (sizes[2]/2-radius)*1            
	            ]){
	                rotate(a=[0,90,0]){
	                    cylinder(h=sizes[0]-radius*2, r=radius, center=true, $fs=0.5);
	                }    
	            }        
                    
	        }
	    }
		cube(sizes,center=true);
	}
	
    
}

round_cube([30,50,7], radius = 1);

translate([40,0,0]){
    upround_cube([30,50,30], radius = 5);
}
