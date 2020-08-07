function count_result = My_template_match (I, B_templates, M_templates, S_templates) 
    count_result = 0;
    for k = 8:-1:1
        for i = 37:970-35
            for j = 24:970-22
                if I(i,j)~=1
                    temp = psnr(reshape(B_templates(k,:,:),72,46),...
                        I(i-36:i+35,j-23:j+22));
                    if temp > 11
                        count_result = count_result + k;
                        for x = i-36:i+35
                            for y = j-23:j+22
                                I(x,y) = 1;
                            end
                        end
                    end
                end
            end
        end%big
        for i = 26:970-25
            for j = 17:970-16
                if I(i,j)~=1
                    temp = psnr(reshape(M_templates(k,:,:),51,33),...
                        I(i-25:i+25,j-16:j+16));
                    if temp > 11
                        count_result = count_result + k;
                        for x = i-25:i+25
                            for y = j-16:j+16
                                I(x,y) = 1;
                            end
                        end
                    end
                end
            end
        end%medium
        for i = 13:970-11
            for j = 8:970-7
                if I(i,j)~=1
                    temp = psnr(reshape(S_templates(k,:,:),24,15),...
                        I(i-12:i+11,j-7:j+7));
                    if temp > 11
                        count_result = count_result + k;
                        for x = i-12:i+11
                            for y = j-7:j+7
                                I(x,y) = 1;
                            end
                        end
                    end
                end
            end
        end%small
    end

end