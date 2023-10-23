function theta = solveInverseKinematicsFor3SegmentsDH(desired_position, desired_orientation)
    % 初始猜测值
    initial_guess = zeros(6, 1);  % 你可能需要提供一个更好的初始猜测值
    lb = [-pi*15/360, -pi*15/360, -pi*15/360, -pi*15/360, -pi*20/360, -pi*20/360];  % Lower bounds
    ub = [pi*15/360, pi*15/360, pi*15/360, pi*15/360, pi*20/360, pi*20/360];  % Upper bounds
    % 调用 fmincon 函数求解优化问题
    options = optimoptions('fmincon','Algorithm','interior-point');  % 使用内点法
    theta = fmincon(@(x) objectiveFunctionFor3SegmentsDH(x, desired_position, desired_orientation), initial_guess, [], [], [], [], lb, ub, [], options);
end
