use <round_cube.scad>
use <hook.scad>

module panel(
    width = 50,
	deep = 30,
	height = 7,
	belt = 35,
	gap = 0.3,
	wall = 1.6,
	hinge_hole = 3,
	hinge_deep = 5,
	latch_v_slip = 4,
	uphole_width = 24,
	uphole_deep = 12
){

    hinge_small_w = hinge_deep;
	hinge_width = width;
	panel_deep = belt+hinge_deep+wall+uphole_deep-gap;
	render(){
	
	    union(){
			translate([0,deep/2+belt+hinge_deep/2,wall/2]){
				difference(){
					union(){
						translate([0,0,(height-wall)/4]){
						    upround_cube([hinge_width-hinge_deep*2-gap*2, hinge_deep, (height-wall)/2],1);
					    }
					    rotate(90, [0,1,0]){
							cylinder(hinge_width-hinge_deep*2-gap*2, d=height-wall-gap,center=true, $fn=32);
					    }
					}
				    rotate(90, [0,1,0]){
				        cylinder(hinge_width+gap, d=hinge_hole,center=true, $fn=32);
				    }
				}
			}    
			translate([0,-panel_deep/2+deep/2+belt+hinge_deep,height/2-wall/2]){
				difference(){
					//panel
				    upround_cube([hinge_width, panel_deep,wall],1);
					//panel holes
					translate([
						hinge_width+uphole_width/2-gap,
						-panel_deep/2-uphole_deep+wall+uphole_deep+gap,
						0
					]){
					    cube([hinge_width*2,uphole_deep*2,height*2],center=true);
				    }
				
					translate([
						-1*(hinge_width+uphole_width/2-gap),
						-panel_deep/2-uphole_deep+wall+uphole_deep+gap,
						0
					]){
					    cube([hinge_width*2,uphole_deep*2,height*2],center=true);
				    }
				
					translate([
						hinge_width+hinge_width/2-hinge_small_w-gap,
						panel_deep/2+uphole_deep-hinge_deep-gap,
						0
					]){
					    cube([hinge_width*2,uphole_deep*2,height*2],center=true);
				    }
				
					translate([
						-1*(hinge_width+hinge_width/2-hinge_small_w-gap),
						panel_deep/2+uphole_deep-hinge_deep-gap,
						0
					]){
					    cube([hinge_width*2,uphole_deep*2,height*2],center=true);
				    }
				}
			}
			
			ground_len = 3;
			translate([0,deep/2-latch_v_slip-wall-ground_len-wall,height/2-wall+gap/100]){
				hook(
				    hook_w = uphole_width-gap*2,
					hook_h = height-wall,
					gap = gap,
					ground_len = ground_len,
					hook_inner_deep = 2,
					hook_inner_h = wall+2*gap,
					wall = wall
				);
			}
			
		}
	}

}

panel();