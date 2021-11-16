function beta = find_beta(channel, trial)
        p1 = periodogram_calculation(channel, trial, 500, 2000);
        p2 = periodogram_calculation(channel, trial, 2000, 2500);
        p3 = periodogram_calculation(channel, trial, 500, 2500);
        beta = ((p1 - p2)/p3)*100;
end