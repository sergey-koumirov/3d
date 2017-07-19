module holder_hole(
    width = 50,
    deep = 30,
    height = 7,
    wall = 2,
    hole_length = 20,
    cover_mortize_length = 4,
    gap = 5
){
    union(){
    
        translate([-width/2+wall+gap/2,-deep/2+wall+gap/2,-height/2+wall]){
            cube([width-2*wall-gap,deep-2*wall-gap,2*height],center=false);
        }
        
        translate([-hole_length/2+gap/2,-deep,-height/2+wall]){
            cube([hole_length-gap,deep,2*height],center=false);
        }
        
        translate([-width,-deep/2+wall+gap/2,height/2-wall]){
            cube([width*2,cover_mortize_length-gap,wall*2],center=false);
        }
        
        cvr_bottom_mortize_len = hole_length + cover_mortize_length*2;
        translate([-cvr_bottom_mortize_len/2+gap/2,-deep/2-wall/2,height/2-wall]){
            cube([cvr_bottom_mortize_len-gap,wall*2,wall*2],center=false);
        }
    }
}

holder_hole(gap=2);
%holder_hole(gap=0);