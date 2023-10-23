% Test Instance for Inverse Kinematics


% 定义初始 q 值, 关节空间变量
q = [0, pi*-2/180, pi*3/180, pi*2/180, pi*1/180, pi*5/180, pi*6/180];

% 使用正运动学得到期望的位置和方向
T_end_desired = forwardKinematicsFor3SegmentsDH(q);
desired_position = T_end_desired(1:3, 4);
desired_orientation = rotm2eul(T_end_desired(1:3, 1:3), 'ZYX');

tic;
% 调用逆运动学求解器
q_output = solveInverseKinematicsFor3SegmentsDH(desired_position, desired_orientation);
T_end_output = forwardKinematicsFor3SegmentsDH(q_output);
output_orientation = rotm2eul(T_end_output(1:3, 1:3), 'ZYX');
toc;

% 显示输出结果
disp('desired_orientation');
disp(desired_orientation);

disp('output_orientation');
disp(rotm2eul(T_end_output(1:3, 1:3), 'ZYX'));


disp('Input q Values:');
disp(q);

disp('Output q Values:');
disp(q_output');

disp('T_end_desired:');
disp(T_end_desired);

disp('T_end_output:');
disp(T_end_output);



