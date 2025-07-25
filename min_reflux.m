%This functin calculate minmum reflux ratio in distillation coulmn for binary mixture

%Made By: Ahmad M.Hassan

function Rmin = min_reflux(alpha,zf,xd)
  Rmin  = (1/(alpha - 1))*((xd/zf) - alpha*((1 - xd)/(1 - zf)));
  fprintf('  Minimum reflux ratio = %.4f\n',Rmin)
end
