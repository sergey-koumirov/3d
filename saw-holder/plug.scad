module plug(r=3.5, gap=0.3){
	
	cut = r/4;
	len = 100;
	
	difference(){
	    rotate_extrude(angle=360, $fn=32){
		    polygon([
				[0,0],
				[r-2*gap,0],
				[r-2*gap,1],
				[r+gap,2],
				[r+gap,4],
				[r/2,5],
				[0,5]
			]);
		}
		
		translate([-cut/2,-len/2,-len/2]){
			cube([cut,len,len],center=false);
		}
		
	}
	
}

plug();