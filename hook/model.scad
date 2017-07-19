W = 17;
L = 29;
thickness = 5;
height = 5;
gap = 0.1;

$fn=64;

diameter = W+2*thickness;
cube_wg = diameter+gap;
cube_dg = diameter+gap;
cube_hg = height+gap;


s1w = L-W/2;

union(){
	
    translate([W/2+thickness/2,,0]){
		difference(){
		    cylinder(h=height, d=diameter, center=true);
		    cylinder(h=height+gap, d=W, center=true);
			translate([0,cube_dg/2,0]){
				cube([cube_wg,cube_dg,cube_hg],center=true);
			}
			translate([0,-cube_dg/2*sqrt(2),0]){
                rotate(a=45,v=[0,0,1]){
				    #cube([cube_wg,cube_dg,cube_hg],center=true);
                }
			}
		}
	}

    translate([0,(L-W)/2,0]){
	    cube([thickness,L-W,height], center=true);
    }

	translate([diameter/2-thickness/2,(L-W),0]){
		difference(){
		    cylinder(h=height, d=diameter, center=true);
		    cylinder(h=height+gap, d=W, center=true);
			translate([0,-cube_dg/2,0]){
				cube([cube_wg,cube_dg,cube_hg],center=true);
			}
		}
	}
    
    translate([W+thickness/2+thickness/2,(L-W)/2,0]){
		cube([thickness,L-W,height], center=true);
	}

	section_w = 2;

	hook_d = diameter/2-thickness/2+diameter-thickness;

	translate([hook_d,L-W,0]){
		difference(){
		    cylinder(h=height, d=diameter, center=true);
		    cylinder(h=height+gap, d=W, center=true);
			translate([0,cube_dg/2,0]){
				cube([cube_wg,cube_dg,cube_hg],center=true);
			}
			translate([cube_dg/2,0,0]){
				cube([cube_wg,cube_dg,cube_hg],center=true);
			}
		}
	}

	section_h = height;
	translate([hook_d+section_h/2,L-W-diameter/2+thickness/2,0]){
		cube([section_h,thickness,height], center=true);
	}

	translate([hook_d+section_h,L-W,0]){
		difference(){
		    cylinder(h=height, d=diameter, center=true);
		    cylinder(h=height+gap, d=W, center=true);
			translate([0,cube_dg/2,0]){
				cube([-cube_wg,cube_dg,cube_hg],center=true);
			}
			translate([-cube_dg/2,0,0]){
				cube([cube_wg,cube_dg,cube_hg],center=true);
			}
		}
	}

	translate([hook_d+section_h,L-W+W/2+thickness/2,0]){
		rotate(a=90,v=[1,0,0]){
			difference(){
			    cylinder(h=thickness, d=height, center=true, $fn=32);
				translate([cube_dg/2,0,0]){
					cube([cube_wg,cube_dg,cube_hg],center=true);
				}
		    }
		}
	}
}
