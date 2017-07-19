function crossX(p1,p2,p3,p4) = ((p1[0]*p2[1]-p1[1]*p2[0])*(p3[0]-p4[0])-(p1[0]-p2[0])*(p3[0]*p4[1]-p3[1]*p4[0])) / ((p1[0]-p2[0])*(p3[1]-p4[1])-(p1[1]-p2[1])*(p3[0]-p4[0]) ) ;

function crossY(p1,p2,p3,p4) = ((p1[0]*p2[1]-p1[1]*p2[0])*(p3[1]-p4[1])-(p1[1]-p2[1])*(p3[0]*p4[1]-p3[1]*p4[0])) / ((p1[0]-p2[0])*(p3[1]-p4[1])-(p1[1]-p2[1])*(p3[0]-p4[0]) ) ;

module section(w = 250, h=2, sup=80, gap=0.2, th=3){
	
	ir = 7;
	
	ith = 8;
	
	beam_delta = 2*w/3;

	p1 = [ir,0];
	p2 = [w,0];
	p3 = [w*cos(45),w*sin(45)];
	p4 = [ir*cos(45),ir*sin(45)];

	ta1 = [ p1[0], p1[1] ] + [0, th];
	ta2 = [ p2[0], p2[1] ] + [0, th];

	tb1 = [ p2[0], p2[1] ] + [-cos(22.5)*th,-sin(22.5)*th];
	tb2 = [ p3[0], p3[1] ] + [-cos(22.5)*th,-sin(22.5)*th];

	tc1 = [ p3[0], p3[1] ] + [cos(45)*th,-sin(45)*th];
	tc2 = [ p4[0], p4[1] ] + [cos(45)*th,-sin(45)*th];

	td1 = [ p4[0], p4[1] ] + [cos(45)*(beam_delta+th),sin(45)*(beam_delta+th)];
	td2 = [ p1[0], p1[1] ] + [cos(45)*(beam_delta+th),sin(45)*(beam_delta+th)];

	te1 = [ p4[0], p4[1] ] + [cos(45)*(beam_delta),sin(45)*(beam_delta)];
	te2 = [ p1[0], p1[1] ] + [cos(45)*(beam_delta),sin(45)*(beam_delta)];

	tf1 = [ p4[0], p4[1] ] + [cos(45)*(ith),sin(45)*(ith)];
	tf2 = [ p1[0], p1[1] ] + [cos(45)*(ith),sin(45)*(ith)];

	t1 = [ crossX(td1,td2,ta1,ta2), crossY(td1,td2,ta1,ta2)];
	t2 = [ crossX(ta1,ta2,tb1,tb2), crossY(ta1,ta2,tb1,tb2)];
	t3 = [ crossX(tb1,tb2,tc1,tc2), crossY(tb1,tb2,tc1,tc2)];
	t4 = [ crossX(tc1,tc2,td1,td2), crossY(tc1,tc2,td1,td2)];

	k1 = [ crossX(te1,te2,ta1,ta2), crossY(te1,te2,ta1,ta2)];
	k2 = [ crossX(te1,te2,tc1,tc2), crossY(te1,te2,tc1,tc2)];
	k3 = [ crossX(tf1,tf2,tc1,tc2), crossY(tf1,tf2,tc1,tc2)];
	k4 = [ crossX(tf1,tf2,ta1,ta2), crossY(tf1,tf2,ta1,ta2)];

	outer  = [p1,p2,p3,p4];
	outerN = [0,1,2,3];

	inner = [t1,t2,t3,t4];
	innerN = [4,5,6,7];

	near = [k1,k2,k3,k4];
	nearN = [8,9,10,11];
	
	link_dist = [w/4,2*w/4+th*2,3*w/4];


	all = concat(outer,inner,near);

    render(){
	    difference(){
		    linear_extrude(h){
				polygon(
					all,
				    [outerN,innerN,nearN]
				);
			}
		
		    for(delta=[w/2+sup/4,w/2+sup/4-sup/2+th,w-th*2]){
				translate([delta,0,0]){
					cube([th,th,10*th],center=true);
				}
				rotate(a=45,v=[0,0,1]){
					translate([delta,0,0]){
						cube([th,th,10*th],center=true);
					}
				}
			}
			
		    for(delta=link_dist){
				translate([delta,0,0]){
					cube([th,th,10*th],center=true);
				}
			}
		}
		
	    for(delta=link_dist){
			rotate(a=45,v=[0,0,1]){
				translate([delta,0,h/2]){
					cube([th-gap,th-gap,h],center=true);
				}
			}
		}
		
	    
	
		
	}
    
    
	

	//echo( cross([0,0],[1,1));
}


section();