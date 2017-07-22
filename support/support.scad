h = 5.5;
wall = 2;
d = 15;
gap = 0.25;
outerd = 60;

difference(){
    cylinder(wall+h, d=outerd, center = false, $fn=120);
    
    translate([0,0,wall]){
        cylinder(100, d=d+2*gap, center = false, $fn=6);
    }
    
    for(a=[0:45:359]){
        translate([(outerd/2+d/4)*cos(a),(outerd/2+d/4)*sin(a),-gap]){
            cylinder(100, d=d+2*gap, center = false, $fn=60);
        }
    }
}
