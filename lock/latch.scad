use <rprizma.scad>;

module latch(
    width = 50,
    deep = 30,
    height = 7,
    wall = 2,
    gap = 0.25,
    mortize_legth = 12,
    latch_h_slip = 8,
    latch_v_slip = 6,
    latch_pusher_height = 5,
    hole_length = 20
){
    render(){
        inside_d = deep-2*(wall+gap);
        latch_deep = 3*latch_v_slip;
        latch_width = width-2*(wall+gap) - latch_h_slip;
        translate([latch_h_slip/2,-inside_d/2+latch_deep/2,0]){
            union(){
                difference(){
                    cube([latch_width, latch_deep, height-2*(wall+gap)], center=true);
                    translate([latch_width/2,latch_deep/3,0]){
                        cube([2*latch_h_slip, latch_deep+gap, height], center=true);
                    }
                    translate([-latch_width/2+1.5*latch_h_slip,2*latch_deep/3,0]){
                        cube([2*latch_h_slip+gap, latch_deep+gap, height], center=true);
                    }
                    translate([-latch_width/2+2*latch_h_slip,latch_deep/3,0]){
                        cube([latch_h_slip+gap, latch_deep+gap, height], center=true);
                    }
                }
                translate([0,-latch_pusher_height/2-latch_deep/2,0]){
                    rprizma(
                        [hole_length-latch_h_slip-gap, latch_pusher_height, height-2*(wall+gap)],
                        mm=3,mp=0,pp=0,pm=3
                    );
                }
            }
        }    
    }
}

latch();





