function [yHat] = NB_Classify(D, p, XTest)

m=size(XTest,1);
yHat= zeros(m,1);

%looping every document%
for i = 1: m
     
    econProb = D(1,:) .* XTest(i,:) + (1-D(1,:)) .* ( 1 - XTest(i,:) );    % bernaulli's probability of word in econ
    onionProb = D(2,:) .* XTest(i,:) + (1-D(2,:)) .* ( 1 - XTest(i,:) );    % probability of word in Onion
    logEcon  = log(econProb);             % log probability of word in econ
    logOnion = log(onionProb);            % log probability of word in onion
    
    econDoc  = logProd([logEcon,log(p)]);  
    onionDoc = logProd([logOnion,log(1-p)]);
    
    if econDoc > onionDoc
        yHat(i) = 1;
    else
        yHat(i) = 2;
    end
end

end
