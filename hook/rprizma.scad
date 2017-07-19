module rprizma(sizes, mm=10, mp=15, pp=20, pm=25){
    
    xd = sizes[0]/2;
    yd = sizes[1]/2;
    
    union(){
        if(mm>0){
            translate([-(xd-mm),-(yd-mm),0]){
                cylinder(h=sizes[2], r=mm, center=true,$fs=0.5);
            }
        }
        
        if(mp>0){
            translate([-(xd-mp),(yd-mp),0]){
                cylinder(h=sizes[2], r=mp, center=true,$fs=0.5);
            }
        }
        
        if(pp>0){
            translate([(xd-pp),(yd-pp),0]){
                cylinder(h=sizes[2], r=pp, center=true,$fs=0.5);
            }
        }
        
        if(pm>0){
            translate([(xd-pm),-(yd-pm),0]){
                cylinder(h=sizes[2], r=pm, center=true,$fs=0.5);
            }
        }
        
        linear_extrude(height=sizes[2],center=true){
            polygon(points=[
                [-(xd-mm), -yd],
                [-xd, -(yd-mm)],
                [-xd, yd-mp],
                [-(xd-mp), yd],
                [xd-pp,yd],
                [xd,yd-pp],
                [xd,-(yd-pm)],
                [xd-pm, -yd]
            ]);
        }
    }

}

rprizma([100,80,40],mm=0,mp=0,pp=0,pm=0);
//%cube([100,80,40], center=true);