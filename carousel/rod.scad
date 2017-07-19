module rod(h=2, sup=60, th=2, gap=0.3){

	translate([0,0,sup/2+h]){
		rotate(a=90,v=[0,1,0]){
		    cube([sup+2*h,th-gap,th-gap],center=true);
			rotate(a=90,v=[0,1,0]){
				cylinder(h=sup,d=th*sqrt(2), center=true, $fn=32);
			}
		}
	}

}

rod();