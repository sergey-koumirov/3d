D = 17.5+0.25;
N=100;
T = 1.5;
wall=1;

w = wall*2 + D;
h = 0.9*D;
in_d = N*T;
d = wall + in_d;

rod_d=2; 
rod_deep = 5;

gap = 0.3;

k=0.825;

$fn = 64;

difference(){
    
	translate([0,0,h/2]){
		cube([w,d,h],center=true);
	}

	translate([0,-in_d/2-wall/2,D/2-(D-h)/2]){
		rotate(a=90, v=[1,0,0]){
			cylinder(h=in_d*2, d=D, center=true);
		}
	}

	translate([0,d/2-wall-T/2,h/2+wall+D/2]){
		cube([D,T,h],center=true);
	}
	
	for(dx =[-1,1]){
		for(dz =[-1,1]){
			translate([dx*w/2*k,rod_deep/2-in_d/2-wall/2, dz*h/2*k+h/2]){
				rotate(a=90, v=[1,0,0]){
					cylinder(h=rod_deep+gap, d=rod_d, center=true);
				}
			}
		}
	}
	
}

translate([0,-d/2-rod_deep,h/2]){
	cube([w,wall,h],center=true);
	for(dx =[-1,1]){
		for(dz =[-1,1]){
			translate([dx*w/2*k,rod_deep/2, dz*h/2*k]){
				rotate(a=90, v=[1,0,0]){
					cylinder(h=rod_deep+gap, d=rod_d-gap, center=true);
				}
			}
		}
	}
}

