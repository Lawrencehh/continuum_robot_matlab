% Test Instance for Inverse Kinematics
tic;

% 定义初始 theta 值
theta_initial = [pi*-2/360, pi*3/360, pi*2/360, pi*1/360, pi*5/360, pi*6/360];

% 使用正运动学得到期望的位置和方向
T_end_desired = forwardKinematicsFor3SegmentsDH(theta_initial);
desired_position = T_end_desired(1:3, 4);
desired_orientation = rotm2eul(T_end_desired(1:3, 1:3), 'XYZ');

% 调用逆运动学求解器
theta_output = solveInverseKinematicsFor3SegmentsDH(desired_position, desired_orientation);

% 显示输出结果
disp('Output Theta Values:');
disp(theta_output);

disp('theta_initial FK T:');
disp(forwardKinematicsFor3SegmentsDH(theta_initial));

disp('Output Theta FK T:');
disp(forwardKinematicsFor3SegmentsDH(theta_output));

toc;

