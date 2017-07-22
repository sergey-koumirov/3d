use <plug.scad>

xd=60;
zd=25;

d=6;

thick = 4;

gap = 0.3;

dots = [
			[-d,-d],
			[d,-d],
			[xd/2+d,zd],
			[xd/2+d/2,zd+d],
			[-xd/2-d/2,zd+d],		
			[-xd/2-d,zd],	
		];
		
hw = 30;
hh = 5;	
shelf = 40;	
angle = 15;
hole_pos = 0.7;

rotate(v=[1,0,0],a=90){
	difference(){
		union(){
			linear_extrude(thick){
				polygon(dots);
			}

			translate([0,0,thick-gap/100]){
				plug(r=d/2, gap=gap);	
			}
			translate([-xd/2,zd,thick-gap/100]){
				plug(r=d/2, gap=gap);	
			}
			translate([+xd/2,zd,thick-gap/100]){
				plug(r=d/2, gap=gap);	
			}
		}
		
		translate([0,hole_pos*zd,0]){
			rotate(v=[0,0,1],a=-angle){
				cube([hw+gap,hh+gap,100],center = true);
			}
		}
	}
}

translate([0,thick+shelf/2,hole_pos*zd]){
	rotate(v=[0,1,0],a=angle){
		cube([hw,thick+shelf,hh],center = true);
		translate([0,shelf/2,hh+hh/2-gap/100]){
			cube([hw,thick,2*hh],center = true);
		}

		translate([hw/2,shelf/2+thick/2,-hh/2+gap/100]){
	        rotate(v=[0,0,1],a=180){
				rotate(v=[0,1,0],a=90){
		  	        linear_extrude(thick){
					    polygon([ [0,shelf], [0,0], [shelf/3,shelf] ]);
				    }
				}
		    }
		}
	}
}

