function height = height_at_x(x,v,alpha)
  h=0.2;
  t=time_at_x(x,v*cos(alpha));
  height = v*t*sin(alpha)-1/2*9.8066*t*t+h;
end