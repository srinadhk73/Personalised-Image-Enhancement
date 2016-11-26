function out_img = autopreprocess(in_img)
out_img = autowhitebal(in_img);
out_img = autocontrastadj(out_img);
end

function out_img = autowhitebal(in_img)
out_img = zeros(size(in_img));
Kvals = zeros(3,1);
for i = 1:3
    temp = in_img(:,:,i);
    sort_temp = sort(temp(:),'descend');
    sort_temp = sort_temp(1:ceil(0.05*size(sort_temp,1)));
    Kvals(i) = mean(sort_temp);
end
out_img(:,:,1) = (Kvals(2)/Kvals(1)).*in_img(:,:,1);
out_img(:,:,2) = in_img(:,:,2);
out_img(:,:,3) = (Kvals(2)/Kvals(3)).*in_img(:,:,3);
end

function out_img = autocontrastadj(in_img)
out_img = imadjust(in_img,stretchlim(in_img),[]);
end