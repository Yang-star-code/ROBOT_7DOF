function t_min = calculate_min_time(path)

[row, clu] = size(path);%注意这里的路径总共是n*7的矩阵
max = 0;
for i = 2 : clu
    for j = 1 : (row-1)
        value = abs(path(j+1, i) - path(j, i));
        if value > max, max = value; end
    end
end

t_min = max/180;%这里是将角度转弧度

end

