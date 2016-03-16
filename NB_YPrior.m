function [p] = NB_YPrior(yTrain)
%prior probability equals to fraction of documents belonging to Economist
p = sum(yTrain==1)/size(yTrain,1);

end
