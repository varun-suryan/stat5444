clear all;
clc;
close all;

original_p = [0.01:0.01:0.99];
num_trials = 10000;

for N = [30 50 100];
	total_data = zeros(size(original_p));
	for trial = 1 : num_trials
		observations = binornd(N, original_p);
		p_hat = observations/N;
		total_data = total_data + (abs(original_p - p_hat) <= 1.96 * sqrt( p_hat .* (1 - p_hat) / N ));
	end
	
	if N == 30
		scatter(original_p, total_data, '+');
	end
	
	if N ==50
		scatter(original_p, total_data, 'o');
	end
	
	if N == 100
		scatter(original_p, total_data, 'd');
	end
	hold on;
end


