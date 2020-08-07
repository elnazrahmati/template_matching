function RGB = My_insert_text (I, num) 
    templates = zeros(10,64,55,'double');
    for i = 0:9
        temp = im2double(imread(['E:\term6\machine vision\HW\HW3\Q3\insert_text\' ...
            num2str(i) '.tif']));
        templates(i+1,:,:) = reshape(temp(:,:,1),1,64,55);
    end
    RGB = zeros(1040,970,3,'double');
    RGB(:,:,1) = I(:,:);
    RGB(:,:,2) = I(:,:);
    RGB(:,:,3) = I(:,:);
    %970 250
    for i = 1:64
        for j = 1:55
            if templates(floor(num/10)+1,i,j) ~= 1
                RGB(973+i,250+j,2) = 0;
                RGB(973+i,250+j,3) = 0;
            end
        end 
    end
    %
    for i = 1:64
        for j = 1:55
            if templates(num-(floor(num/10)*10)+1,i,j) ~= 1
                RGB(975+i,305+j,2) = 0;
                RGB(975+i,305+j,3) = 0;
            end
        end 
    end
end