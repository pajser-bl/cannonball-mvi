clc
time_start=now();

%za random vrijendost
wall_distance=10
target_distance=10+wall_distance

pop_size    =      8;      % velicina populacije
max_iter    =    100;      % maksimalan broj iteracija
max_same    =     10;      % maksimalan broj iteracija u kojima je isto najbolje rjesenje
prob_co     =      0.90;   % vjerovatnoca ukrstanja
prob_mut    =      0.05;   % vjerovatnoca mutacije
elites      =     10;     % postotak elitnih


printf("-----------------\nFilling population...\n");
population = {};
for i=1:pop_size
  population(i)=ProjectileMotion(wall_distance,target_distance);
  printf("%d - %d° - %d km/s [%d]\n",i,population{i}._angle,population{i}._velocity,population{i}._score);
end
#parametri petlje

time_same=0;
number_of_iterations=0;
number_of_elites=round(pop_size*elites/100);
#sortiraj
  [~,index]=sort([cellfun(@(x)x._score,population)],'descend');
  population=population(index);
while time_same<=max_same && number_of_iterations<=max_iter
  next_generation=population;
  best=population{1};
  #rekombinacija sacuvaj elitne
  for i=number_of_elites+1:2:pop_size-1
    if rand()>=prob_co
      next_generation(i)=crossover_angle(population{i},population{i+1},wall_distance,target_distance);
      next_generation(i+1)=crossover_velocity(population{i},population{i+1},wall_distance,target_distance);
    end
  end  
  
  #mutiraj
  for i=number_of_elites+1:pop_size
    if rand()>=prob_mut
      next_generation(i)=mutate(population{i},wall_distance,target_distance);
    end
  end
  #sortiraj novu generaciju
  [~,index]=sort([cellfun(@(x)x._score,next_generation)],'descend');
  next_generation=next_generation(index);
  current_best=next_generation{1};
  #zbog petlje
  if best._angle==current_best._angle && best._velocity==current_best._velocity
    time_same=time_same+1;
  end
  number_of_iterations=number_of_iterations+1;
  population=next_generation;
end
printf("Number of iterations: %d\n",number_of_iterations);
printf("-----------------\nFinal generation\n");
for i=1:pop_size
    printf("%d - %d° - %d km/s [%d]\n",i,rad2deg(population{i}._angle),population{i}._velocity,population{i}._score);
end
time=now()-time_start
str_time=num2str(time);
str_wall_distance=num2str(wall_distance);
str_target_distance=num2str(target_distance-wall_distance);
str_number_of_iterations=num2str(number_of_iterations);
filename=strcat(str_wall_distance,'_',str_target_distance,'-',str_number_of_iterations,'=',str_time,'.txt');
for i=1:pop_size
  to_write=[i,population{i}._velocity,rad2deg(population{i}._angle),population{i}._score];
  dlmwrite(filename, to_write, '-append');
end
to_record=[population{1}._velocity,rad2deg(population{1}._angle),population{1}._score,number_of_iterations,time];
record_name=strcat('pop',num2str(pop_size),'-',str_wall_distance,'_',str_target_distance,'.txt');
dlmwrite(record_name, to_record, '-append');