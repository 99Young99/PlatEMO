clear;clc;
result = load("Population.mat"); % read data
[~,N] = size(result.Population);
[~,M] = size(result.Population(1,1).add);
Solutions = zeros(N,M);
Desicion = zeros(N,length(result.Population(1,1).dec));
for i = 1:N
    for j = 1:M
        Solutions(i,j) = result.Population(1,i).add(j);
    end
end

for i = 1:N
    for j = 1:length(result.Population(1,i).dec)
        Desicion(i,j)  = result.Population(1,i).dec(j);
    end
end

%% plot the result
Target = [3.0, 1, 1100, 60, 100, 98, -95];

% Normalized Data
% normalized_data = (Solutions - min(Solutions)) ./ (max(Solutions) - min(Solutions));
normalized_data = mapminmax(Solutions', 0, 1)';
normalized_Target = mapminmax(Target', 1)';

% 使用pdist计算欧氏距离
distance = pdist2(Target, normalized_data, 'euclidean');

% sort
[~, rank] = sort(distance, 'ascend');
Data = [Target; Solutions(rank(:),:)];
groups = 1:length(Data);

% white is the backgroung of Ylabel
figure('Color','white')

p = parallelplot(Data,'GroupData', groups);

% Target name
p.CoordinateTickLabels = {'Idc','linb','BW','PM','CMRR','SNR','THD'};
p.Color = {"#e6194B",'#3cb44b','#ffe119','#4363d8','#f58231', '#911eb4', '#9A6324', '#f032e6', '#469990', '#000000', '#000075'};
p.LineWidth = [3 1 1 1 1 1 1 1 1 1 1];

%% Writes the decision variable and the target value to excel
FormatResult = [Desicion, Solutions];
VariableNames = {'M1','M2','M3','M4','M5','CL1','CW1','RL1','RL2','RW1','RW2', 'Idc','linb','BW','PM','CMRR','SNR','THD'};
FormatResult = array2table(FormatResult, 'VariableNames', VariableNames);
filename = "./result.xlsx";
writetable(FormatResult, filename);
