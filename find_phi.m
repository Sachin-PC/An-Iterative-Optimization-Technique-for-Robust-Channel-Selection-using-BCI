function phi = find_phi(channel_no, Mew, beta)
        min_mew = min(Mew);
        max_mew = max(Mew);
        min_beta = min(beta);
        max_beta = max(beta);
        phi = (Mew(channel_no)*beta(channel_no) -min_mew*min_beta)/ (max_mew*max_beta);
end