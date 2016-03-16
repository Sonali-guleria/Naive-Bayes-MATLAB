
function [D] = NB_XGivenY(XTrain, yTrain)
Beta =[1.001,1.9];
Beta1 = (Beta(1)- 1);   
Beta2 = (Beta(2)- 1);
econIndex = yTrain  == 1; % indexes of documents belonging to the economist
onionIndex = yTrain == 2; % indexes of documents belonging to the onion
alpha1 = sum(XTrain(econIndex,:),1);
alpha2 = sum(XTrain(onionIndex,:),1);
econMAPNum = ( alpha1 + Beta1) ;
onionMAPNum = (alpha2 + Beta1) ;
econMAPDen  = sum(econIndex) + Beta1 + Beta2;
onionMAPDen = sum(onionIndex) + Beta1 + Beta2;
econMap = econMAPNum / econMAPDen;
onionMAP = onionMAPNum / onionMAPDen;
D = [econMap;onionMAP];
end

