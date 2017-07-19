use <section.scad>
use <support.scad>
use <rod.scad>

w = 200;
support_width = 60;
thickness = 3;
gap=0.5;
h=3;

support_delta = w/2+support_width/4 - thickness/2;

for(i=[0:7]){

    rotate(a=45*i,v=[0,0,1]){
        section(w=w, h=h, sup=support_width, th=thickness, gap=gap);
		translate([support_delta-support_width/2+thickness,0,0]){
			support(h=h, sup = support_width, th=thickness, gap=gap);
		}
		translate([w-thickness*2,0,0]){
			rod(h=h, sup = support_width, th=thickness, gap=gap);
		}	
	};

}

translate([0,0,support_width+h]){
	for(i=[0:7]){
	    rotate(a=45*i,v=[0,0,1]){
			
			if(i==2 || i==1 ){
				translate([cos(22.5)*10,sin(22.5)*10,0]){
					section(w=w, h=h, sup=support_width, th=thickness, gap=gap);
				}
			}else{
				section(w=w, h=h, sup=support_width, th=thickness, gap=gap);				
			}
			
		}

	}

}

