nCycle = 10;
orgFreq = 120;
x = linspace(0,nCycle,nCycle*orgFreq);

figure(10)
for ii=1:100
    sig1 = square(2*pi*x + ii/10);
    img1 = (repmat(sig1, [nCycle*orgFreq,1])+1)/2;
    sig2 = sig1((orgFreq/5)/2:(orgFreq/5):end);
    sig2 = repelem(sig2, orgFreq/5);
    img2 = (repmat(sig2, [nCycle*orgFreq,1])+1)/2;
    
    subplot(121);imshow(img1)
    subplot(122);imshow(img2)
    pause(0.1)
end

% figure(11)
% for ii=1:100
%     sig1 = sin(2*pi*x + ii/10);
%     img1 = (repmat(sig1, [nCycle*orgFreq,1])+1)/2;
%     sig2 = sig1((orgFreq/5)/2:(orgFreq/5):end);
%     sig2 = repelem(sig2, orgFreq/5);
%     img2 = (repmat(sig2, [nCycle*orgFreq,1])+1)/2;
%     
%     subplot(121);imshow(img1)
%     subplot(122);imshow(img2)
%     pause(0.1)
% end
