clear
load('/home/HDUSER/Desktop/DataSet/Dataset4a/1000Hz/Sub1/data_set_IVa_aa_mat/1000Hz/data_set_IVa_aa.mat')


% function [min_v,max_v] = minimum(vec)
% %     print("Inside");
%     vec
%     n= length(vec)
%     min_v = vec(1)
%     max_v = vec(1)
%     for i=2:n
%         if(vec(i) < min_v)
%             min_v = vec(i)
%         elseif(vec(i) > max_v)
%             max_v = vec(i)
%         end
%     end
% 
% 
% 
% function ph = find_phi(total_channels, Mew, beta)
%         min_mew = min(Mew)
%         max_mew = max(Mew)
%         min_beta = min(beta)
%         max_beta = max(beta)
%         for i=1:total_channels
%             ph(i) = (Mew(i)*beta(i) -min_mew*min_beta)/ (max_mew*max_beta)  
%         end
% end
% 
% 
% 
% function bta = find_beta(total_channels)
%         for i=1:total_channels
%             bta(i) = (P0.5to2(i) - P2to2.5(i))*100/P0.5to2.5
%         end
% end
% 



ref_x = nfo.xpos(54);
ref_y = nfo.ypos(54);
kernel_radius = 30;
eucd_dist =0;
channel_no =0;
channel_count =0
while(eucd_dist <= kernel_radius)
    if(channel_no == 53)
        channel_no = channel_no +1;
    end
    channel_count = channel_count + 1
    channel_no = channel_no+1;
    ch_x = nfo.xpos(channel_no);
    ch_y = nfo.ypos(channel_no);
    chdst_frmRef(channel_count) = sqrt((ref_x - ch_x)^2+(ref_y -ch_y)^2)
    eucd_dist = eucd_dist + chdst_frmRef(channel_count);
    
end
i=1
while( i <= channel_count)
   Mew(i) =  1/chdst_frmRef(i);
   i=i+1;
end
for i=1:channel_count
    fprintf("%.2f\t",Mew(i))
end
i=1
no_of_iterations =280
for i=1:no_of_iterations
    if (i~=1)
%         band_power = find_Band_Power
        beta =find_beta(channel_count)
        phi = find_phi(channel_count,Mew,beta)
        for j =1:channel_count
            Mew(j) = Mew(j) + phi(j)
        end
    end
end
