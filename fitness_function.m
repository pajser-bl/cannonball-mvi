function fscore=fitness_function(value,target)
  fscore=(2-abs(value-target))/4;
end