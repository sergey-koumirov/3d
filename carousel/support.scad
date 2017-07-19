module support(h=2, sup = 80, th=3, gap=0.3){

    delta = 1.7*th;

    p1 = [0,0];
    p2 = [sup,0];
	
	p21 = [sup,gap];
	p22 = [sup+h,gap];
	p23 = [sup+h,th-gap];
	p24 = [sup,th-gap];
	
	p25 = [sup,sup/2-th+gap];
	p26 = [sup+h,sup/2-th+gap];
	p27 = [sup+h,sup/2-gap];
	p28 = [sup,sup/2-gap];

    p3 = [sup,sup/2];
    
	p4 = [0,sup/2];
	
	p41 = [0,sup/2-gap];
	p42 = [-h,sup/2-gap];
	p43 = [-h,sup/2-th+gap];
	p44 = [0,sup/2-th+gap];
	
	p45 = [0,th-gap];
	p46 = [-h,th-gap];
	p47 = [-h,gap];
	p48 = [0,gap];
	
	
    p5 = [th,delta];
    p6 = [th,sup/2-delta];
    p7 = [(sup-delta)/2,sup/4];
	
    p8 = [sup-th,sup/2-delta];
    p9 = [sup-th,delta];
    p10 = [(sup+delta)/2,sup/4];
	
    p11 = [delta,th];
    p12 = [sup-delta,th];
    p13 = [sup/2,(sup-delta)/4];
	
    p14 = [delta,sup/2-th];
    p15 = [sup-delta,sup/2-th];
    p16 = [sup/2,(sup+delta)/4];

	outer  = [p1,p2, p21,p22,p23,p24, p25,p26,p27,p28, p3,p4, p41,p42,p43,p44, p45,p46,p47,p48];
	outerN = [0,1,2,3,4,5,6,7,8,9,10,11, 12,13,14,15, 16,17,18,19];
	
	inner1  = [p5,p6,p7];
	inner1N = [20,21,22];
	
	inner2  = [p8,p9,p10];
	inner2N = [23,24,25];
	
	inner3  = [p11,p12,p13];
	inner3N = [26,27,28];
	
	inner4  = [p14,p15,p16];
	inner4N = [29,30,31];

	all = concat(outer, inner1, inner2, inner3, inner4);

	translate([0,-th/2+gap/2,h]){
		rotate(a=-90,v=[0,0,1]){
			rotate(a=-90,v=[0,1,0]){
				linear_extrude(th-gap){
					polygon(
						all,
					    [outerN,inner1N,inner2N,inner3N,inner4N]
					);
				}
			}
		}
	}	    

}

support();