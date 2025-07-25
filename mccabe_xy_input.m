% Calculations of binary distillation using McCabe - Thiele method if data given is x-y data

%Made By: Ahmad M. Hassan


% inputs
q = input('  Enter feed quality factor (q): ');
zf = input('  Enter mole fraction in the feed (zF): ');
xd = input('  Enter distillate mole fraction (xD): ');
xb = input('  Enter mole fraction at bottom (xB): ');
R =input('  Enter reflux ratio (R): ');
x = input('  Enter x values (as a vector): ');
y = input('  Entter y values (as a vector): ');

xq = ((R+1)*zf+(q-1)*xd)/(R+q); %The point of three lines intersection in x-axis
yq = (R*zf+q*xd)/(R+q); %The point of three lines intersection in y-axis

figure
plot(x,y,'g') %plotting the equlibrium curve
hold on
axis([0 1 0 1]);
plot(zf,zf,'o') %F point
plot(xd,xd,'o') %D point
plot(xb,xb,'o') %B point
line ([0 1],[0 1]) % Plotting the diogonal line
line([xd xq],[xd yq],'color',[0 0 0]); %Rectifying section line
line([xb xq],[xb yq],'color',[1 0 1]); %Stripping section line
line([zf xq],[zf yq],'color',[1 0 0]); %Feed line
grid on
grid minor

%Number of stages calculation:
y_ROL = @(x) (R/(R+1))*x + xd/(R+1); %Rectifying section line equation
mS = (yq - xb)/(xq - xb); %slope of stripping section line
y_SOL = @(x) mS*(x-xb)+xb; %Stripping section line equation

%Initial conditions of the "while" loop
x_curr = xd;
y_curr = xd;
trays = 0;
while x_curr > xb
  y_curr > xb
   %Plotting the horizontal lines
  y_next = y_curr; %y_next = y value at the next stage
  x_eq = interp1(y,x,y_next,'linear'); %x_eq = x value at the equlibrium curve
  plot([x_curr x_eq],[y_curr y_curr],'k')
   %Plotting the vertical lines
  if x_eq >= xq
    y_curr = y_ROL(x_eq); %y values at rectifying section line
  else
    y_curr = y_SOL(x_eq); %y values at stripping section line
  end
  plot([x_eq x_eq],[y_curr y_next],'k')
  x_curr = x_eq;
  trays = trays + 1;
 end
 xlabel('x - liquid mole fraction')
ylabel('y - vapour mole fraction')
title('Number of Ideal Trays Using McCabe Theile Method')
legend('Equlibrium Curve','F Point','D point','B Point','The Diogonal Line'
,'Rectifying Section Line','Stripping Section Line','Feed Line','location','southeast')

fprintf('  Number of ideal trays = %1.d trays\n',trays)

minimum_trays_xy(xd,xb,x,y)
