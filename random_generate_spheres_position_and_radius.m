%%
%   输入：    无
%   输出：    无，存储为全局变量  
%%

function random_generate_spheres_position_and_radius()

clear;clc;
%把球的原点坐标与半径搞成全局变量，因为感觉在后面的很多地方需要用到
global Sphr
Sphr = [];

%% 随机生成10个球的参数，最后一个球必须离某一个球小于200mm

theta = rand * pi * 2;
x = randi(400)-250;
y = randi(250)+2500;
z = randi(50)+400;
radius = rand*25 + 25;

Sphr = [x; y; z; radius];
while size(Sphr, 2) < 16
    
theta = rand * pi * 2;
x = randi(400)-250;
y = randi(250)+2500;
z = randi(50)+400;
radius = rand*25 + 25;
    
    if size(Sphr, 2) < 15
        pnt = [x, y, z, radius]';
        Sphr = [Sphr, pnt];
    else
        for i = 1:size(Sphr, 2)
            dis = ((x-Sphr(1, i))^2 + (y-Sphr(2, i))^2 + (z-Sphr(3, i))^2)^(1/2);
            if 50 <= dis && dis <= 500
                pnt = [x, y, z, radius]';
                Sphr = [Sphr, pnt];
                break;
            end
        end
    end
end

            
            