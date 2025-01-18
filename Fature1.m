clc, clear, close all

net.mode = 'test' ;
im = imread(imagepath); 
im_ = single(im) ; 
im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
im_ = bsxfun(@minus, im_, net.meta.normalization.averageImage) ;

net.conserveMemory = 0;   
net.eval({'data', im_}) ;

feature = net.vars(net.getVarIndex('pool5')).value ;

for k = 1:2048
    feat_temp(k) = feature(:, :, k); 
end
semantic_feat = feat_temp;
binocular_semantic_feat = double(semantic_feat);
deep_feats = binocular_semantic_feat;




