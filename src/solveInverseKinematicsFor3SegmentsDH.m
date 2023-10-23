function q = solveInverseKinematicsFor3SegmentsDH(desired_position, desired_orientation)
    % 初始猜测值
    initial_guess = zeros(7, 1);  % 你可能需要提供一个更好的初始猜测值
    lb = [0, -pi*25/360, -pi*25/360, -pi*25/360, -pi*25/360, -pi*25/360, -pi*25/360];  % Lower bounds
    ub = [2000, pi*25/360, pi*255/360, pi*255/360, pi*25/360, pi*25/360, pi*25/360];  % Upper bounds
    % 调用 fmincon 函数求解优化问题
    options = optimoptions('fmincon','Algorithm','interior-point');  % 使用内点法
    q = fmincon(@(x) objectiveFunctionFor3SegmentsDH(x, desired_position, desired_orientation), initial_guess, [], [], [], [], lb, ub, [], options);
end
