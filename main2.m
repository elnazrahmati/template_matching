clc; clear; close all;

% dataset_path = 'E:\term6\machine vision\HW\HW3\Q3\Dataset\';
% s = dir(dataset_path);
% for i = 1:numel(s)
%    if s(i).isdir == 0
%        I = imread([dataset_path s(i).name]);
%        I = I(1:970,1:970);
%        I = medfilt2(I, [5 5]);
%        imwrite(I, ['E:\term6\machine vision\HW\HW3\Q3\test bench\' s(i).name]);
%    end
% end
%72*46

B_templates = zeros(8,72,46,'double');
M_templates = zeros(8,51,33,'double');
S_templates = zeros(8,24,15,'double');
for i = 1:8
    B_templates(i,:,:) = im2double(imread(['E:\term6\machine vision\HW\HW3\Q3\' ...
        num2str(i) '.tif']));
    M_templates(i,:,:) = reshape(imresize(reshape(B_templates(i,:,:),...
        72,46),0.7,'bicubic'),1,51,33);
    S_templates(i,:,:) = reshape(imresize(reshape(B_templates(i,:,:),...
        72,46),0.32,'bicubic'),1,24,15);
end

%[72 46];[51 33];[26 17]
dataset_path = 'E:\term6\machine vision\HW\HW3\Q3\test bench\';
s = dir(dataset_path);
accuracy = 0.0;
for i = 1:numel(s)
   if s(i).isdir == 0
       I = im2double(imread([dataset_path s(i).name]));
       count_result = My_template_match (I, B_templates, M_templates, S_templates);
       count = sscanf(s(i).name,"Test_%d_%d.tif");
       if(count(2) == count_result)
           accuracy = accuracy+1;
       end
       I = im2double(imread(['E:\term6\machine vision\HW\HW3\Q3\Dataset\' s(i).name]));
       RGB = My_insert_text(I,count_result);
       imwrite(RGB,['E:\term6\machine vision\HW\HW3\Q3\result\' s(i).name]);
   end
end

accuracy

