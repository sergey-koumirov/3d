module rod(
    width = 50,
	deep = 30,
	height=7,
	belt = 35,
	hinge_deep = 5,
	wall = 1.6,
	gap = 0.3,
	hinge_hole = 3.3
){
    hinge_width = width;
	render(){
		intersection(){
		    translate([0,deep/2+belt+hinge_deep/2,wall/2]){
		        rotate(90, [0,1,0]){
		            cylinder(hinge_width+gap, d=hinge_hole-gap,center=true, $fn=32);
		        }
		    }    
			translate([0,0,-wall]){
				cube([width*100,deep*100,height],center=true);
			}
			
		}
	}
	
}

rod();


