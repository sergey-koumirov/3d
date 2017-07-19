use <round_cube.scad>;
use <holder_hole.scad>;

module cover(
    width = 50,
    deep = 30,
    height = 7,
    wall = 2,
    hole_length = 20,
    cover_mortize_length = 4,
    gap = 0,
    uphole_width = 30,
    uphole_deep = 12
){
    render(){    
        difference(){
            intersection(){
                round_cube([width,deep,height], radius = 1);
                
                translate([0,0,height-wall]){
                    cube([width*2,deep*2,height],center=true);
                }
                
                holder_hole(
                    width = width,
                    deep = deep,
                    height = height,
                    wall = wall,
                    hole_length = hole_length,
                    cover_mortize_length = cover_mortize_length,
                    gap = gap
                );
                
            }
            
            translate([0,deep/2-wall,height/2]){
                cube([uphole_width, uphole_deep*2, height],center=true);
            }
        }
    }    
        
}

cover();