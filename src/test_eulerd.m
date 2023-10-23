% 输入 theta 和 displacement 的值求解正运动学的姿态矩阵
theta = [5*pi/180,5*pi/180,5*pi/180,5*pi/180,5*pi/180,5*pi/180];
displacement = 10;
T_end = forwardKinematicsFor3SegmentsDH(theta, displacement);
disp(T_end);

%从姿态矩阵中获取旋转矩阵R(3x3)
R = T_end(1:3, 1:3)

% 导入齐次变换矩阵到欧拉角的函数
import robotics.*

% 确定欧拉角的旋转顺序以及单位
rotationOrder = 'ZYX';  % 按照需要设置旋转顺序
rotationUnit = 'rad';   % 设置欧拉角的单位，可以是 'rad' 或者 'deg'
eulerAngles = rotm2eul(R, rotationOrder)%由旋转矩阵输出得到的欧拉角
