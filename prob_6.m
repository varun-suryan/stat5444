clear all;
clc;
close all;

original_p = [0.01:0.01:0.99];
num_trials = 10000;
num_samples = 5000;

data_n = [];
for N = [30, 50, 100];
	data = [];
	for actual_p = original_p
		actual_p
		count = 0;
		for trials = 1 : num_trials
			observation = binornd(N, actual_p);
			post_samples = sort(betarnd(0.5 + observation, N + 0.5 - observation, [1 num_samples]));
			if actual_p > post_samples(0.025 * num_samples + 1) && actual_p < post_samples(0.975 * num_samples)
				count = count + 1;
			end
		end
		data = [data count];
	end
	data_n = [data_n ; data]
end



		
