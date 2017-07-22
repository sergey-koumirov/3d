use <holder.scad>
use <cover.scad>
use <latch.scad>
use <spring.scad>
use <rod.scad>
use <lock_panel.scad>

width = 50;
deep = 36;
height = 8;
wall = 1.8;
hole_length = 20;
cover_mortize_length = 4;
mortize_width = 6;
mortize_legth = 14;
gap = 0.3;

uphole_width = 24;
uphole_deep = 12;

latch_h_slip = wall*4;
latch_v_slip = (deep-2*wall-mortize_legth-wall)/4;
latch_pusher_height = wall+gap+latch_v_slip;

base_w = 80; 
base_d = 160; 
base_h = 2;
belt_bottom=50;
belt=35;
hinge_hole = 2.5+1.6*gap;
hinge_deep = 6;

//hi = [0,10,20,40,50,30];
//v = [true,true,true,true,true,true];

hi = [0,0,0,20,0,0];
v = [false,false,false,false,true,false];

if(v[0]==true){
    color([1,0.5,0,1]){
        translate([0,0,hi[5]]){
            panel(
                width = width,
                deep = deep,
                height = height,
                belt = belt,
                gap = gap,
                wall = wall,
                hinge_hole = hinge_hole,
                hinge_deep = hinge_deep,
                latch_v_slip = latch_v_slip,
                uphole_deep = uphole_deep,
                uphole_width = uphole_width
            );
        }    
    }
}

if(v[1]){
    color([1,0,0.5,1]){
        translate([0,0,hi[4]]){
            rod(
                width = width,
                deep = deep,
                height = height,
                belt = belt,
                hinge_deep = hinge_deep,
                wall = wall,
                gap = gap,
                hinge_hole = hinge_hole
            );
        }    
    }
}

if(v[2]){
    color([1,0,0,1]){
        translate([0,0,hi[2]]){
            spring(
                width = width,
                deep = deep,
                height = height,
                wall = wall,
                gap = gap,
                mortize_width = mortize_width,
                mortize_legth = mortize_legth,
                latch_v_slip = latch_v_slip
            );
        }    
    }
}

if(v[3]){
    color([0.5,0.5,0,1]){
        translate([-latch_h_slip*sin(180*$t),0,hi[1]]){
            latch(
                width = width,
                deep = deep,
                height = height,
                wall = wall,
                gap = gap,
                mortize_legth = mortize_legth,
                latch_h_slip = latch_h_slip,
                latch_v_slip = latch_v_slip,
                latch_pusher_height = latch_pusher_height,
                hole_length = hole_length
            );  
        }
    }
}

if(v[4]){
    translate([0,0,hi[0]]){
        holder(
            width = width,
            deep = deep,
            height = height,
            wall = wall,
            hole_length = hole_length,
            cover_mortize_length = cover_mortize_length,
            mortize_width = mortize_width,
            mortize_legth = mortize_legth,
            uphole_width = uphole_width,
            uphole_deep = uphole_deep,
            latch_h_slip = latch_h_slip,
            latch_v_slip = latch_v_slip,
            gap=gap,
            base_w = base_w, 
            base_d = base_d,
            base_h = base_h,
            belt_bottom = belt_bottom,
            belt = belt,
            hinge_hole = hinge_hole,
            hinge_deep = hinge_deep
        );
    }
}

if(v[5]){
    color([0,0.5,0.5,1]){
        translate([0,0,hi[3]]){
            cover(
                width = width,
                deep = deep,
                height = height,
                wall = wall,
                hole_length = hole_length,
                cover_mortize_length = cover_mortize_length,
                gap = gap,
                uphole_width = uphole_width,
                uphole_deep = uphole_deep
            );
        }
    }
}