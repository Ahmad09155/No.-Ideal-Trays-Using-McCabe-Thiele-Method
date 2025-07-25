% Calculation of binary distillation using McCabe - Thiele method

%Made By: Ahmad M. Hasssan


 %Inputs
alpha = input('Enter the relative volatility (alpha): ');
q = input('Enter feed quality factor (q): ');
zf = input('Enter mole fraction in the feed (zF): ');
xd = input('Enter distillate mole fraction (xD): ');
xb = input('Enter bottom mole fraction (xB): ');
R = input('Enter reflux ratio (R): ');

%Feed point intersection
xq = ((R+1)*zf + (q-1)*xd) / (R+q); %The point of three lines intersection in x-axis
yq = (R*zf + q*xd) / (R + q); %The point of three lines intersection in y-axis

%plotting the equlibrium curve
figure
x = linspace(0, 1, 1000);
y = (alpha .* x) ./ (1 + (alpha-1).*x);
plot(x,y,'g')
hold on
axis([0 1 0 1]);

plot(zf,zf,'o') %F point
plot(xd,xd,'o') %D point
plot(xb,xb,'o') %B point

%Diagonal line
line ([0 1],[0 1])

%Plotting operating lines
line ([0 1],[0 1]) % Plotting the diogonal line
line([xd xq],[xd yq],'color',[0 0 0]); %Rectifying section line
line([xb xq],[xb yq],'color',[1 0 1]); %Stripping section line
line([zf xq],[zf yq],'color',[1 0 0]); %Feed line
grid on
grid minor

%Number of stages calculation:

y_ROL = @(x) (R/(R+1))*x + xd/(R+1); %Rectifying section line equation
mS = (yq - xb)/(xq - xb); %slope of stripping section line
y_SOL = @(x) mS*(x-xb) + xb; %Stripping section line equation

x_curr = xd;
y_curr = xd;
trays = 0;

while x_curr > xb
    % Horizontal to equilibrium curve
    y_next = y_curr;
    x_next = y_next / (alpha + (1 - alpha) * y_next);
    plot([x_curr x_next], [y_curr y_curr], 'k')

    % Vertical to operating line
    if x_next >= xq
        y_curr = y_ROL(x_next);
    else
        y_curr = y_SOL(x_next);
    end
    plot([x_next x_next], [y_next y_curr], 'k')

    % Update values
    x_curr = x_next;
    trays = trays + 1;
end
xlabel('x - liquid mole fraction')
ylabel('y - vapour mole fraction')
title('Number of Ideal Trays Using McCabe Theile Method')
legend('Equlibrium Curve','F Point','D point','B Point','The Diogonal Line'
,'Rectifying Section Line','Stripping Section Line','Feed Line','location','southeast')

fprintf('\n  Number of ideal trays = %1.d trays\n',trays)

%Calculate minimum number of trays
minimum_trays(alpha,xd,xb)

%Calculate minimum reflux ratio
min_reflux(alpha,zf,xd)
