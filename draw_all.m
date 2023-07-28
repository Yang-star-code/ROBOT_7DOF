%%
%   函数说明：画出所有物体
%   输入：    机械臂关节变量
%   输出：    无
%%

function draw_all(Variable,fcla)

set_variable_in_DH_table(Variable);
FK_calculate_joint_matrix_in_world();

%draw_cylinder_as_capsule();
draw_spheres();
draw_robot();
draw_box();
plot3(0,0,0,'ro');  %画出原点

%% 画图设置
grid on;
% view(134,12);
axis([-1500,1500,-500,5000,-1500,1500]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
% pic=getframe;
if(fcla)
    cla;
end
%%画出货架
%画柜子
cabinet_p1=[-250,2500,0,200,400];%柜子的x,y,第一层z,第二层z，第三层z
cabinet_width=400;
cabinet_lenth=500;
cabinet_height=50;

x=[cabinet_p1(1)  cabinet_p1(1)    cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)+cabinet_width     cabinet_p1(1)+cabinet_width    cabinet_p1(1)      cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width       cabinet_p1(1)    cabinet_p1(1)     cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width   cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width];
y=[cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)+cabinet_lenth];
z=[ cabinet_p1(4)     cabinet_p1(4)     cabinet_p1(4)+cabinet_height     cabinet_p1(4)+cabinet_height   cabinet_p1(4)      cabinet_p1(4)+cabinet_height    cabinet_p1(4)+cabinet_height       cabinet_p1(4)     cabinet_p1(4)   cabinet_p1(4)       cabinet_p1(4)+cabinet_height    cabinet_p1(4)+cabinet_height     cabinet_p1(4)   cabinet_p1(4)    cabinet_p1(4)+cabinet_height   cabinet_p1(4)+cabinet_height cabinet_p1(4)   cabinet_p1(4)   cabinet_p1(4) ];
plot3(x,y,z,'b');

x1=[cabinet_p1(1)  cabinet_p1(1)    cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)+cabinet_width     cabinet_p1(1)+cabinet_width    cabinet_p1(1)      cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width       cabinet_p1(1)    cabinet_p1(1)     cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width   cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width];
y1=[cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)  cabinet_p1(2) cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)+cabinet_lenth];
z1=[cabinet_p1(3)  cabinet_p1(3)     cabinet_p1(3)+cabinet_height     cabinet_p1(3)+cabinet_height   cabinet_p1(3)     cabinet_p1(3)+cabinet_height    cabinet_p1(3)+cabinet_height       cabinet_p1(3)   cabinet_p1(3)       cabinet_p1(3)+cabinet_height      cabinet_p1(3)+cabinet_height    cabinet_p1(3)+cabinet_height     cabinet_p1(3)  cabinet_p1(3)   cabinet_p1(3)+cabinet_height   cabinet_p1(3)+cabinet_height cabinet_p1(3)  cabinet_p1(3)  cabinet_p1(3)];
plot3(x1,y1,z1,'b');

x2=[cabinet_p1(1)  cabinet_p1(1)    cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)      cabinet_p1(1)+cabinet_width     cabinet_p1(1)+cabinet_width    cabinet_p1(1)      cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width       cabinet_p1(1)    cabinet_p1(1)     cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width   cabinet_p1(1)+cabinet_width  cabinet_p1(1)+cabinet_width];
y2=[cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)  cabinet_p1(2) cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth   cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)  cabinet_p1(2)+cabinet_lenth];
z2=[ cabinet_p1(5)     cabinet_p1(5)    cabinet_p1(5)+cabinet_height    cabinet_p1(5)+cabinet_height   cabinet_p1(5)     cabinet_p1(5)+cabinet_height    cabinet_p1(5)+cabinet_height       cabinet_p1(5)   cabinet_p1(5)       cabinet_p1(5)+cabinet_height      cabinet_p1(5)+cabinet_height    cabinet_p1(5)+cabinet_height     cabinet_p1(5)  cabinet_p1(5)   cabinet_p1(5)+cabinet_height   cabinet_p1(5)+cabinet_height cabinet_p1(5)  cabinet_p1(5)  cabinet_p1(5)];
plot3(x2,y2,z2,'b');

x3=[cabinet_p1(1)+cabinet_width        cabinet_p1(1)+cabinet_width    cabinet_p1(1)+cabinet_width     cabinet_p1(1)+cabinet_width   cabinet_p1(1)+cabinet_width  ];
y3=[cabinet_p1(2)+cabinet_lenth     cabinet_p1(2)  cabinet_p1(2)    cabinet_p1(2)+cabinet_lenth  cabinet_p1(2)+cabinet_lenth];
z3=[cabinet_p1(5)+cabinet_height       cabinet_p1(5)+cabinet_height       cabinet_p1(3)        cabinet_p1(3)      cabinet_p1(5)+cabinet_height];
plot3(x3,y3,z3,'b');
hold on;

cabinet_p2=[250,250,0,200,400];%柜子的x,y,第一层z,第二层z，第三层z
cabinet_width=400;
cabinet_lenth=500;
cabinet_height=50;

x4=[cabinet_p2(1)  cabinet_p2(1)    cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)+cabinet_width     cabinet_p2(1)+cabinet_width    cabinet_p2(1)      cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width       cabinet_p2(1)    cabinet_p2(1)     cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width   cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width];
y4=[cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)+cabinet_lenth];
z4=[ cabinet_p2(4)     cabinet_p2(4)     cabinet_p2(4)+cabinet_height     cabinet_p2(4)+cabinet_height   cabinet_p2(4)      cabinet_p2(4)+cabinet_height    cabinet_p2(4)+cabinet_height       cabinet_p2(4)     cabinet_p2(4)   cabinet_p2(4)       cabinet_p2(4)+cabinet_height    cabinet_p2(4)+cabinet_height     cabinet_p2(4)   cabinet_p2(4)    cabinet_p2(4)+cabinet_height   cabinet_p2(4)+cabinet_height cabinet_p2(4)   cabinet_p2(4)   cabinet_p2(4) ];
plot3(x4,y4,z4,'b');

x5=[cabinet_p2(1)  cabinet_p2(1)    cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)+cabinet_width     cabinet_p2(1)+cabinet_width    cabinet_p2(1)      cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width       cabinet_p2(1)    cabinet_p2(1)     cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width   cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width];
y5=[cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)  cabinet_p2(2) cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)+cabinet_lenth];
z5=[cabinet_p2(3)  cabinet_p2(3)     cabinet_p2(3)+cabinet_height     cabinet_p2(3)+cabinet_height   cabinet_p2(3)     cabinet_p2(3)+cabinet_height    cabinet_p2(3)+cabinet_height       cabinet_p2(3)   cabinet_p2(3)       cabinet_p2(3)+cabinet_height      cabinet_p2(3)+cabinet_height    cabinet_p2(3)+cabinet_height     cabinet_p2(3)  cabinet_p2(3)   cabinet_p2(3)+cabinet_height   cabinet_p2(3)+cabinet_height cabinet_p2(3)  cabinet_p2(3)  cabinet_p2(3)];
plot3(x5,y5,z5,'b');

x6=[cabinet_p2(1)  cabinet_p2(1)    cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)      cabinet_p2(1)+cabinet_width     cabinet_p2(1)+cabinet_width    cabinet_p2(1)      cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width       cabinet_p2(1)    cabinet_p2(1)     cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width   cabinet_p2(1)+cabinet_width  cabinet_p2(1)+cabinet_width];
y6=[cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)  cabinet_p2(2) cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth   cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)  cabinet_p2(2)+cabinet_lenth];
z6=[ cabinet_p2(5)     cabinet_p2(5)    cabinet_p2(5)+cabinet_height    cabinet_p2(5)+cabinet_height   cabinet_p2(5)     cabinet_p2(5)+cabinet_height    cabinet_p2(5)+cabinet_height       cabinet_p2(5)   cabinet_p2(5)       cabinet_p2(5)+cabinet_height      cabinet_p2(5)+cabinet_height    cabinet_p2(5)+cabinet_height     cabinet_p2(5)  cabinet_p2(5)   cabinet_p2(5)+cabinet_height   cabinet_p2(5)+cabinet_height cabinet_p2(5)  cabinet_p2(5)  cabinet_p2(5)];
plot3(x6,y6,z6,'b');

x7=[cabinet_p2(1)+cabinet_width        cabinet_p2(1)+cabinet_width    cabinet_p2(1)+cabinet_width     cabinet_p2(1)+cabinet_width   cabinet_p2(1)+cabinet_width  ];
y7=[cabinet_p2(2)+cabinet_lenth         cabinet_p2(2)  cabinet_p2(2)    cabinet_p2(2)+cabinet_lenth  cabinet_p2(2)+cabinet_lenth];
z7=[cabinet_p2(5)+cabinet_height       cabinet_p2(5)+cabinet_height       cabinet_p2(3)        cabinet_p2(3)      cabinet_p2(5)+cabinet_height];
plot3(x7,y7,z7,'b');
hold on;

end


