%This function calculate minimum number of trays in a distillation coulmn
% for binary mixture using McCabe Thiele method if the data given is x-y data

%Made By: Ahmad M. Hassan

function Nmin = minimum_trays_xy(xd,xb,x,y)
  %note: x and y are vectors here

figure
plot(x,y,'g') %plotting the equlibrium curve
hold on
axis([0 1 0 1]);
grid on
grid minor

line ([0 1],[0 1]) % Plotting the diogonal line

x_curr = xd;
y_curr = xd;
trays = 0;
while x_curr > xb
    % Horizontal to equilibrium curve
    y_next = y_curr; %y_next = y value at the next stage
    x_next = interp1(y,x,y_next,'linear'); %x_eq = x value at the equlibrium curve
    plot([x_curr x_next], [y_curr y_curr], 'k')

    % Vertical to operating line y=x (total reflux)
    y_curr = x_next;
    plot([x_next x_next], [y_next y_curr], 'k')

    % Update for next step
    x_curr = x_next;
    trays = trays + 1
end

xlabel('x - liquid mole fraction')
ylabel('y - vapour mole fraction')
title('McCabe-Thiele for Minimum Number of Trays');
legend('Equilibrium Curve', 'Operating line at Total Reflux','location','southeast');
grid on
grid minor

fprintf('  Minimum number of trays at total reflux = %d\n',trays);
end
