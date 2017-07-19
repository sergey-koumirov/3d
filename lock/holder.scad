use <round_cube.scad>;
use <holder_hole.scad>;
use <holder_base.scad>;

module holder(
    width = 50,
    deep = 30,
    height = 7,
    wall = 2,
    hole_length = 20,
    cover_mortize_length = 4,
    mortize_width = 6,
    mortize_legth = 14,
    uphole_width = 30,
    uphole_deep = 12,
    latch_h_slip = 8,
    latch_v_slip = 3,
    gap = 0.2,
    base_w = 80, 
    base_d = 160, 
    base_h = 4,
    belt_bottom = 50,
    belt = 35,
    hinge_hole = 3,
    hinge_deep = 5
){
    render(){
    
        inside_d = deep-2*(wall+gap);
        latch_deep = 3 * latch_v_slip;
        latch_width = width-2*(wall+gap) - latch_h_slip;
        
        hinge_width = width;
        
        union(){
            translate([0,deep/2+belt+hinge_deep/2,0]){
                difference(){
                    upround_cube([hinge_width,hinge_deep,height],1);
                    cube([hinge_width-2*hinge_deep,hinge_deep*2,height*2] ,center=true);
                    translate([0,0,wall/2]){
                        rotate(90, [0,1,0]){
                            cylinder(hinge_width+gap, d=hinge_hole ,center=true, $fn=16);
                        }
                    }
                }
            }

            difference(){
                upround_cube([width,deep,height], radius = 1);
                holder_hole(
                    width = width,
                    deep = deep,
                    height = height,
                    wall = wall,
                    hole_length = hole_length,
                    cover_mortize_length = cover_mortize_length,
                    gap = 0
                );
                
                translate([0,deep/2-wall,height-wall]){
                    cube([uphole_width, uphole_deep*2, height],center=true);
                }
                translate([0,deep/2-uphole_deep/2-wall,0]){
                    cube([width-2*(wall+mortize_width+wall+wall+gap), uphole_deep, height*2],center=true);
                }    
                
            }
            
            mortize_shift = width/2-wall-wall/2-mortize_width;
            translate([-mortize_shift,deep/2-mortize_legth/2-wall,0]){
                cube([wall,mortize_legth,height-2*wall],center=true);
            }
            translate([mortize_shift,deep/2-mortize_legth/2-wall,0]){
                cube([wall,mortize_legth,height-2*wall],center=true);
            }
            
            translate([width/2-wall-latch_h_slip/2,-deep/2+wall+2*latch_deep/3+gap,0]){
                cube([latch_h_slip,2*latch_deep/3,height-2*wall],center=true);
            }
            
            stub_deep = latch_deep/3;
            translate([
                -latch_width/2+1.5*latch_h_slip-gap/4,
                -deep/2+wall+stub_deep/2 + 2*latch_deep/3+gap,
                0
            ]){
                cube([latch_h_slip-gap/2, stub_deep,height-2*wall],center=true);
            }
            
            base(
                base_w = base_w, 
                base_d = base_d, 
                base_h = base_h,
                belt_bottom = belt_bottom,
                uphole_width = uphole_width,
                uphole_deep = uphole_deep,
                deep = deep,
                height= height,
                wall = wall
            );    
            
        }
    }
}

holder();