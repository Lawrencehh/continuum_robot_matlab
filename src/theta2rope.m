function Rope_length = theta2rope (theta)

%定义各间隙变量，相应地赋予固定值
Gap_1(1:12) = [0,0,0,0,0,0,0,0,0,0,0,0]; %第1个间隙
Gap_2(1:12) = [29.63,29.63,29.09,29.09,29.63,29.63,29.63,29.63,29.09,29.09,29.63,29.63]; %第2个间隙, 固定值
Gap_3(1:12) = [0,0,0,0,0,0,0,0,0,0,0,0]; %第3个间隙
Gap_4(1:12) = [29.63,29.63,29.09,29.09,29.63,29.63,29.63,29.63,29.09,29.09,29.63,29.63]; %第4个间隙, 固定值
Gap_base(1:12) = [24.57,24.57,26.11,26.11,28.12,28.12,28.12,28.12,26.11,26.11,24.57,24.57];%基座圆盘处绳长，固定值

Rope_length=zeros(1, 12); %12根绳长的当前长度
beta = pi*50/180; % gap1和gap3的初始角度
R_Gap_1(1:12) = [23.03,23.03,18.82,18.82,13.33,13.33,13.33,13.33,18.82,18.82,23.03,23.03]; % 代表每个孔心在Gap1处到旋转轴的垂线长度
R_Gap_3(1:12) = [13.33,13.33,18.82,18.82,23.03,23.03,23.03,23.03,18.82,18.82,13.33,13.33]; % 代表每个孔心在Gap3处到旋转轴的垂线长度

% 第一节代表根部关节；
% 1，2,11,12

% 第一节的
%对12根绳都需计算
for N = 1:5
    for i = 1:12
        if i > 6
            Gap_1(i) = sin((beta-theta(1))/2) * 2*R_Gap_1(i);
        end
        if i <= 6
            Gap_1(i) = sin((beta+theta(1))/2) * 2*R_Gap_1(i);
        end

        if mod(i,2) ==1
            Gap_3(i) = sin((beta-theta(2))/2) * 2*R_Gap_3(i);
        end
        if mod(i,2) ==0
            Gap_3(i) = sin((beta+theta(2))/2) * 2*R_Gap_3(i);
        end

        Rope_length(i) = Rope_length(i) + Gap_1(i) + Gap_2(i) + Gap_3(i) + Gap_4(i)+Gap_base(i);
    end
end

% 第二节的
% 除了1,2,11,12
for N = 1:5
    for i = 1:12
        if(i==1 | i==2 | i ==11 | i ==12)
            Rope_length(i) = Rope_length(i) +0;

        else
            if i > 6
                Gap_1(i) = sin((beta-theta(3))/2) * 2*R_Gap_1(i);
            end
            if i <= 6
                Gap_1(i) = sin((beta+theta(3))/2) * 2*R_Gap_1(i);
            end

            if mod(i,2) ==1
                Gap_3(i) = sin((beta-theta(4))/2) * 2*R_Gap_3(i);
            end
            if mod(i,2) ==0
                Gap_3(i) = sin((beta+theta(4))/2) * 2*R_Gap_3(i);
            end

            Rope_length(i) =  Rope_length(i) + Gap_1(i) + Gap_2(i) + Gap_3(i) + Gap_4(i);
        end
    end
end

% 第三节的
% 除了1,2,11,12, 3,4,9,10
for N = 1:5
    for i = 1:12
        if(i == 1 | i == 2 | i == 11 | i == 12 | i == 3 | i == 4 | i == 9 | i == 10  )
            Rope_length(i) = Rope_length(i) +0;
        else
            if i > 6
                Gap_1(i) = sin((beta-theta(5))/2) * 2*R_Gap_1(i);
            end
            if i <= 6
                Gap_1(i) = sin((beta+theta(5))/2) * 2*R_Gap_1(i);
            end

            if mod(i,2) ==1
                Gap_3(i) = sin((beta-theta(6))/2) * 2*R_Gap_3(i);
            end
            if mod(i,2) ==0
                Gap_3(i) = sin((beta+theta(6))/2) * 2*R_Gap_3(i);
            end

            Rope_length(i) =  Rope_length(i) + Gap_1(i) + Gap_2(i) + Gap_3(i) + Gap_4(i);
        end
    end
end



% 特殊情况，每个关节和下一个关节连接处的圆盘内绳长（即绿色块内的绳长）需减掉一截Gap_4
for i = 1:12
    Rope_length(i) = Rope_length(i) - Gap_4(i);
end

end

