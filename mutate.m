function mutant=mutate(projectileMotion,wall_distance,target_distance)
      alpha_degrees=rad2deg(projectileMotion._angle);
      velocity=projectileMotion._velocity;
      if rand() > 0.5
        alpha_degrees=alpha_degrees+(90-alpha_degrees).*(rand());
        velocity=velocity+(22-velocity).*rand();
      else
        alpha_degrees=alpha_degrees.*rand();
        velocity=velocity.*rand();
      end
      alpha=deg2rad(alpha_degrees);
      mutant._angle=alpha;
      mutant._velocity=velocity;
      distance=distance(velocity,alpha,0.2);
      wall_score=fitness_function(height_at_x(wall_distance,velocity,alpha),8);
      target_score=fitness_function(distance,target_distance+2);
      mutant._score=(wall_score+target_score)/2;
    end