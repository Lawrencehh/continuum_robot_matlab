function error = objectiveFunctionFor3SegmentsDH(q, desired_position, desired_orientation)
    % 调用正运动学函数
    T_end = forwardKinematicsFor3SegmentsDH(q);
    
    % 提取实际位置和方向
    actual_position = T_end(1:3, 4);
    actual_orientation = rotm2eul(T_end(1:3, 1:3), 'ZYX');
    
    % 计算位置和方向的误差
    position_error = norm(desired_position - actual_position);
    orientation_error = norm(desired_orientation - actual_orientation);
    
    % 总误差
    error = position_error + 100* orientation_error;
end
