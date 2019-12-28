function dataset = nn_generate_dataset(set_name)

switch set_name
    case 'circle'
        inRadius = 2;
        outRadius = [3 6];
        numPt = 500;
        dataset = GenerateCircleData(inRadius, outRadius, numPt);
    case 'gaussian'
        set1Loc = [2 2];
        set2Loc = [-2 -2];
        sigma = 1;
        numPt = 1000;
        dataset  = GenerateGaussianData(set1Loc, set2Loc, sigma, numPt);
    case 'xor'
        range = [-6 6];
        numPt = 1000;
        dataset = GenerateXorData(range, numPt);
end
end

function data = GenerateCircleData(inRadius, outRadius, numPt)

% inner circle
data.set1 = zeros(numPt,2);
count = 1;
while count<=numPt
    xin = rand*inRadius*2-inRadius;
    yin = rand*inRadius*2-inRadius;
    if xin^2 + yin^2 < inRadius^2
        data.set1(count,:) = [xin yin];
        count = count + 1;
    end
end

% outer ring
data.set2 = zeros(numPt,2);
count = 1;
while count<=numPt
    xin = rand*outRadius(2)*2-outRadius(2);
    yin = rand*outRadius(2)*2-outRadius(2);
    if (xin^2 + yin^2 < outRadius(2)^2) && (xin^2 + yin^2 > outRadius(1)^2)
        data.set2(count,:) = [xin yin];
        count = count + 1;
    end
end


end

function data = GenerateGaussianData(set1Loc, set2Loc, sigma, numPt)

data.set1 = zeros(numPt,2);
data.set1(:,1) = normrnd(set1Loc(1), sigma, [numPt 1]);
data.set1(:,2) = normrnd(set1Loc(2), sigma, [numPt 1]);

data.set2 = zeros(numPt,2);
data.set2(:,1) = normrnd(set2Loc(1), sigma, [numPt 1]);
data.set2(:,2) = normrnd(set2Loc(2), sigma, [numPt 1]);

end

function data = GenerateXorData(range, numPt)

data.set1 = zeros(numPt,2);
data.set1(:,1) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set1(:,2) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set1(:,2) = sign(data.set1(:,1)).* abs(data.set1(:,2));

data.set2 = zeros(numPt,2);
data.set2(:,1) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set2(:,2) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set2(:,2) = -sign(data.set2(:,1)).* abs(data.set2(:,2));

end