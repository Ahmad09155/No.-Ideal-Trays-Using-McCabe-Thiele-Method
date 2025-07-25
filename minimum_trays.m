%This function calculate minimum number of trays in a distillation coulmn
% for binary mixture using McCabe Thiele method

%Made By: Ahmad M. Hassan

function Nmin = minimum_trays(alpha,xd,xb)

%Equilibrium curve
x = linspace(0,1,1000);
y = (alpha .* x) ./ (1 + (alpha-1).*x);
figure
plot(x,y,'g');
 hold on;
axis([0 1 0 1]);

%The diogonal line (equilibrium operating line at total reflux)
line([0 1],[0 1]);

%Calculate minimum trays by stepping between y=x and equilibrium curve
x_curr = xd;
y_curr = xd;
trays = 0;

while x_curr > xb
    % Horizontal to equilibrium curve
    y_next = y_curr;
    x_next = y_next / (alpha + (1 - alpha) * y_next);
    plot([x_curr x_next], [y_curr y_curr], 'k')

    % Vertical to operating line y=x (total reflux)
    y_curr = x_next;
    plot([x_next x_next], [y_next y_curr], 'k')

    % Update for next step
    x_curr = x_next;
    trays = trays + 1;
end

xlabel('x - liquid mole fraction')
ylabel('y - vapour mole fraction')
title('McCabe-Thiele for Minimum Number of Trays');
legend('Equilibrium Curve', 'Operating line at Total Reflux','location','southeast');
grid on
grid minor

fprintf('  Minimum number of trays at total reflux = %d\n',trays);

