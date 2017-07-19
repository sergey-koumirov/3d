use <BezierScad.scad>

module curly(sizes = [50,30,10], width=1){

    
    r = sizes[1] / (2*sqrt(2));
    
    translate([-sizes[0]/2,-sizes[1]/2,-sizes[2]/2]){
        translate([r,0,sizes[2]/2]){
            difference(){
                cylinder(h=sizes[2], r=r, center=true, $fs = 0.2);
                cylinder(h=2*sizes[2], r=r-width, center=true, $fs = 0.2);
                
                translate([r,r,0]){
                    cube([2*r,4*r,2*sizes[2]],center=true);
                }
                translate([0,-r,0]){
                    cube([4*r,2*r,2*sizes[2]],center=true);
                }
                
            }        
        };
        
        translate([r,sizes[1],sizes[2]/2]){
            difference(){
                cylinder(h=sizes[2], r=r, center=true, $fs = 0.2);
                cylinder(h=2*sizes[2], r=r-width, center=true, $fs = 0.2);
                translate([r,-r,0]){
                    cube([2*r,4*r,2*sizes[2]],center=true);
                }
                translate([0,r,0]){
                    cube([4*r,2*r,2*sizes[2]],center=true);
                }
            }        
        };
        
        translate([sizes[0]-r,sizes[1]/2,sizes[2]/2]){
            difference(){
                cylinder(h=sizes[2], r=r, center=true, $fs = 0.2);
                cylinder(h=2*sizes[2], r=r-width, center=true, $fs = 0.2);
                translate([-r,0,0]){
                    cube([2*r,4*r,2*sizes[2]],center=true);
                }
            }        
        };
        
        p1 = [r,r];
        p2 = [sizes[0]-r+width/5,sizes[1]/2-r+width];
        linear_extrude(height = sizes[2], center=false){
            BezLine(
                [
                    p1,
                    [p1[0] + (p2[0]-p1[0])/4, p1[1] ],
                    [p1[0] + (p2[0]-p1[0])*3/4, p2[1] ],
                    p2,
                ],
                width = [width],
                showCtls = false
            );
        }
        
        t1 = [r,sizes[1]-r+width];
        t2 = [sizes[0]-r+width/5,sizes[1]/2+r];
        linear_extrude(height = sizes[2], center=false){
            BezLine(
                [
                    t1,
                    [t1[0] + (t2[0]-t1[0])/4, t1[1] ],
                    [t1[0] + (t2[0]-t1[0])*3/4, t2[1] ],
                    t2,
                ],
                width = [width],
                showCtls = false
            );
        }
        
        
    }
    
    
    
}

curly();

translate([60,0,0]){
    curly([30,30,10],2);    
}
translate([60,30,0]){
    curly([30,30,10],2);    
}
translate([60,60,0]){
    curly([30,30,10],2);    
}