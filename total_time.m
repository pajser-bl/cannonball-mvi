function time_of_flight=total_time(alpha,v,h)
  vsina=v*sin(alpha);
  time_of_flight=( vsina + sqrt(vsina*vsina+2*9.8066*h))/9.8066;
end