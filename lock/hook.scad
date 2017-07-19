module hook(
    hook_w = 50,
	hook_h = 6,
	gap = 0.3,
	ground_len = 10,
	hook_inner_deep = 2,
	hook_inner_h = 3,
	wall = 1.6
){

	outer_h = hook_h - hook_inner_h;
	support_w = 0.3;
	support_l = 1;

    union(){
        rotate(90,[0,1,0]){
            linear_extrude(hook_w, center=true){
                polygon([
                    [0,0],
                    [0,ground_len+wall/2-gap],
                    
                    [wall/2-gap,ground_len],
                    
                    [hook_inner_h,ground_len],
                    
                    [hook_inner_h,ground_len+hook_inner_deep],
                    
                    [hook_inner_h+outer_h/3, ground_len+hook_inner_deep],
                    
                    [hook_h,ground_len+hook_inner_deep-2*outer_h/3],
                    
                    [hook_h,ground_len/2],
                ]);
            }
        }
        translate([0,ground_len+hook_inner_deep-support_w/2,-(hook_inner_h+gap)/2+gap/2]){
			union(){
				
				for(i=[-3:3]){
					translate([i/3*(hook_w/2-support_l/2),0,0]){
						cube([support_l,support_w,hook_inner_h+gap],center=true);
					}
				}
			}            
        }
    }
    

}

hook();