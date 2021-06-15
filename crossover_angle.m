function child=crossover_angle(parent1, parent2,wall_distance,target_distance)
      alpha=(parent1._angle+parent2._angle)/2;
      velocity=parent1._velocity;
      child._angle=alpha;
      child._velocity=velocity;
      distance=distance(velocity,alpha,0.2);
      wall_score=fitness_function(height_at_x(wall_distance,velocity,alpha),8);
      target_score=fitness_function(distance,target_distance+2);
      child._score=target_score+wall_score-abs(target_score+wall_score);
end