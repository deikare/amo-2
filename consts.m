dimmensions = 5; %liczba wymiarów
nEachSide = 50; %liczba punktów po każdej ze stron hiperpłaszczyzny
n = nEachSide * 2;

randStream = RandStream("mt19937ar", 'Seed', 3); %zseedowanie generatora
w = rand(randStream, dimmensions, 1);
b = randn(randStream, 1);

xPlus = produceSet(nEachSide, dimmensions, 1, randStream, w, b);
xMinus = produceSet(nEachSide, dimmensions, -1, randStream, w, b);

x = [xPlus, xMinus];
y = [ones(1, nEachSide), -1 * ones(1, nEachSide)];

function x = produceSet(n, dimmensions, setSign, randStream, w, b)
    x = randn(randStream, dimmensions, n);
    for i = 1:n
        pointSign = calculateSign(w, x(:, i), b);

        if (setSign > 0 && pointSign < 0) || (setSign < 0 && pointSign > 0)
            x(:, i) = calculateTransformedPoint(w, x(:, i), b);
        end
    end
end

function y = calculateSign(w, x, b)
   y = w' * x - b; 
end

function newPoint = calculateTransformedPoint(w, x, b)
    newPoint = x - 2 * w * calculateSign(w, x, b) / (norm(w)^2);
end