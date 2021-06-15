function m_distance = distance(v,alpha,h)
  m_distance=v*cos(alpha)/9.8066*(v*sin(alpha)+sqrt(v*sin(alpha)*v*sin(alpha)+2*9.8066*h));
  #m_distance=v*v/2*9.8066*(1+sqrt(1+2*9.8066*h/v/v/sin(alpha)/sin(alpha)))*sin(2*alpha);
  end
