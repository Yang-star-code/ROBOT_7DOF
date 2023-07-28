function draw_box()

global Link;

length = 100;
width = 200;
height = 150;

y = Link(2).A(2,4) + 150;

X = [-length, length, length, -length, -length; -length, length, length, -length, -length];
Y = [y, y, y+width, y+width, y; y, y, y+width, y+width, y];
Z = [-100, -100, -100, -100, -100; -100+height, -100+height, -100+height, -100+height,-100+height];

surf(X, Y, Z);

end