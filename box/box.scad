x = 88;
y = 58;
z = 53;

wall=1;

f = 3;
d = wall/tan(67.5);
fd= f+d;
skip = 2.5;

outer = [
  [f,0],
  [0,f],
  
  [0,y-f],
  [f,y],
  
  [x/2-skip/2-f,y],
  [x/2-skip/2,y-f],
  [x/2+skip/2,y-f],
  [x/2+skip/2+f,y],
  
  [x-f,y],
  [x,y-f],
  
  [x,f],  
  [x-f,0],
  
  [x/2-skip/2-f,0],
  [x/2-skip/2,f],
  [x/2+skip/2,f],
  [x/2+skip/2+f,0],
];
outerN = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];

inner = [
  [fd,wall],
  [wall,fd],
  
  [wall,y-fd],
  [fd,y-wall],
  
  [x/2-skip/2-fd,y-wall],
  [x/2-skip/2-d,y-f-wall],
  [x/2+skip/2+d,y-f-wall],
  [x/2+skip/2+fd,y-wall],
  
  [x-fd,y-wall],
  [x-wall,y-fd],
  
  [x-wall,fd],  
  [x-fd,wall],
  
  [x/2+skip/2+fd,wall],
  [x/2+skip/2+d,f+wall],
  [x/2-skip/2-d,f+wall],
  [x/2-skip/2-fd,wall],
];
innerN = [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];

all = concat(outer,inner);

linear_extrude(z){
    polygon(
        all,
        [outerN,innerN]
    );    
}

linear_extrude(wall){
    polygon(
        outer
    );    
}
