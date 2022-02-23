ind = [3 2 2;3 2 3; 3 2 1; 2 1 3];
ta=0;
for i=1:size(ind,1)
table = tabulate(ind(i,:));
[maxCount,idx] = max(table(:,2));
y=table(idx);
ta=[ta;y];
end

ta=ta(2:end);
ta=ta';