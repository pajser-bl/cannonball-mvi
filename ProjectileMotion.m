classdef ProjectileMotion
  properties
    _angle
    _velocity
    _score
  end
  
  methods
    function projectileMotion=ProjectileMotion(wall_distance,target_distance);
      alpha_degrees=90*rand();
      velocity=22*rand();
      alpha=deg2rad(alpha_degrees);
      projectileMotion._angle = alpha;
      projectileMotion._velocity=velocity;
      distance=distance(velocity,alpha,0.2);
      target_score=fitness_function(distance,target_distance+2);
      wall_score=fitness_function(height_at_x(wall_distance,velocity,alpha),8);
      projectileMotion._score=target_score+wall_score-abs(target_score+wall_score);
    end
    
    function value=eq(pm1,pm2)
      if pm1._angle==pm2._angle && pm1._velocity==pm2._velocity
        value=true;
      else
        value=false;
      end
    end
    
   end
   
end