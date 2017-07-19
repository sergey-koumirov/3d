use <BezierScad.scad>
use <curly.scad>

module spring(
    width = 50,
    deep = 30,
    height = 7,
    wall = 1.6,
    gap = 0.25,
    mortize_width = 6,
    mortize_legth = 12,
    latch_v_slip = 3,
){
    render(){        
        inner_h = height-2*wall-2*gap;
        spr_dx = width/2-wall-gap;
        curly_thickness = wall /3;
        
        translate([0, deep/2-wall-mortize_legth-wall/2-latch_v_slip+gap, 0]){
            difference(){
                cube([width-2*wall-2*gap,wall,inner_h],center=true);
                translate([-width/2+mortize_width+2.5*wall+gap,0,0]){
                    cylinder(h=inner_h*2, r=wall/4, center=true, $fs=0.2);
                }
                translate([width/2-mortize_width-2.5*wall-gap,0,0]){
                    cylinder(h=inner_h*2, r=wall/4, center=true, $fs=0.2);
                }
            }
            
            curly_cnt=3;
            curly_h = (mortize_legth+latch_v_slip)/curly_cnt;
            
            for(i=[0:curly_cnt-1]){
                translate([
                    -spr_dx+mortize_width/2-gap,
                    wall/2 + curly_h/2 +i*curly_h - gap/100,
                    0
                ]){
                    mirror([1,0,0]){
                        curly([mortize_width-2*gap, curly_h, inner_h],curly_thickness);
                    }    
                }
                
                translate([
                    spr_dx-mortize_width/2+gap,
                    wall/2 + curly_h/2 +i*curly_h - gap/100,
                    0
                ]){
                    curly([mortize_width-2*gap, curly_h, inner_h],curly_thickness);                
                }
            }
           
            
            translate([
                -width/2+wall+wall/2+mortize_width+wall+gap,
                mortize_legth/2+wall/2,
                0
            ]){
                cube([wall,mortize_legth,inner_h],center=true);
            }
            
            translate([
                width/2-wall-wall/2-mortize_width-wall-gap,
                mortize_legth/2+wall/2,
                0
            ]){
                cube([wall,mortize_legth,inner_h],center=true);
            }
            
            translate([
                0,
                mortize_legth,
                0
            ]){
                temp_w = width-2*wall-2*gap-2*mortize_width-2*wall-2*wall;
                difference(){
                    cube([temp_w,wall,inner_h],center=true);
                    translate([0,-wall,inner_h/2]){
                        rotate(a=-45,v=[1,0,0]){
                            cube([temp_w+gap,wall,inner_h*2],center=true);
                        }
                    }
                    
                    translate([0,0,-inner_h+wall]){
                        cube([temp_w+gap,2*wall,inner_h],center=true);
                    }
                }
            }
            
        }
    }    
}

spring();
