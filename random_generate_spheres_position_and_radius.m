%%
%   ���룺    ��
%   �����    �ޣ��洢Ϊȫ�ֱ���  
%%

function random_generate_spheres_position_and_radius()

clear;clc;
%�����ԭ��������뾶���ȫ�ֱ�������Ϊ�о��ں���ĺܶ�ط���Ҫ�õ�
global Sphr
Sphr = [];

%% �������10����Ĳ��������һ���������ĳһ����С��200mm

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

            
            