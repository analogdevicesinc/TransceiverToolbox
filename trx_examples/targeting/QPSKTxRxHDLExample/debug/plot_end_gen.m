

reset = load('reset.mat');
end_gen = load('end_gen.mat');


reset = reset.reset.Data;
end_gen = end_gen.end_gen.Data;

stem(reset); hold on;
stem(end_gen,'r'); hold off;

indexes = 1:length(reset);
found_reset_indexes = indexes(reset > 0);
found_end_gen_indexes = indexes(end_gen > 0);

for i = 1:length(found_reset_indexes)
    fr = found_reset_indexes(i);

    [a,feg_first] = find(found_end_gen_indexes > fr, 1, 'first');

    end_point = found_end_gen_indexes(feg_first);
    disp(end_point - fr);

end