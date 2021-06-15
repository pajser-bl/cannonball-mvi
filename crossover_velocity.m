function child=crossover_velocity(parent1, parent2,wall_distance,target_distance)
      alpha=parent2._angle;
      velocity=(parent1._velocity+parent2._velocity)/2;
      child._angle=alpha;
      child._velocity=velocity;
      distance=distance(velocity,alpha,0.2);
      wall_score=fitness_function(height_at_x(wall_distance,velocity,alpha),8);
      target_score=fitness_function(distance,target_distance+2);
      child._score=target_score+wall_score-abs(target_score+wall_score);
end