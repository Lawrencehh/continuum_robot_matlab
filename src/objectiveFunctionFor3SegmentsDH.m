function error = objectiveFunctionFor3SegmentsDH(theta, desired_position, desired_orientation)
    % 调用正运动学函数
    T_end = forwardKinematicsFor3SegmentsDH(theta);
    
    % 提取实际位置和方向
    actual_position = T_end(1:3, 4);
    actual_orientation = rotm2eul(T_end(1:3, 1:3), 'XYZ');
    
    % 计算位置和方向的误差
    position_error = norm(desired_position - actual_position);
    orientation_error = norm(desired_orientation - actual_orientation);
    
    % 总误差
    error = position_error + orientation_error;
end
