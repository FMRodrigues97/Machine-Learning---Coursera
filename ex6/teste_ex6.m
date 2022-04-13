% You will have X, y in your environment
load('ex6data3.mat');

C_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
tamanho = length(C_values);

pairs_C_sigma = zeros(tamanho^2, 2);
k = 1;

for i = 1:tamanho
    for j = 1:tamanho
        pairs_C_sigma(k, 1) = C_values(i);
        pairs_C_sigma(k, 2) = sigma_values(j);
        k = k + 1;
    end
end

for i = 1:size(pairs_C_sigma, 1)
    C_test = pairs_C_sigma(i, 1);
    sigma_teste = pairs_C_sigma(i, 2);
    model(i) = svmTrain(X, y, C_test, @(x1, x2)gaussianKernel(x1, x2, sigma_teste));
end

predictions = svmPredict(model, Xv);
mean(double(predictions ~= yval));