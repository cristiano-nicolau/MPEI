
for m=[200,500,1000,2000,5000,10000,20000,50000,100000]
    res = zeros(1,10);
    i=1;
    for n=1:10:100
        cf = 0;  
        experiencias = randi(m,n,N);
        for k = 1:N
            sem_rep = unique(experiencias(:,k));
            if length(sem_rep)~=n
                cf = cf+1;
            end
        end
        res(i) = cf/N;
        i = i+1;
    end
    subplot(1,2,plotcount);
    plot(1:10:100, res);
    xlabel('n');
    ylabel('Prob');
    title(['m=' , num2str(m)])
    plotcount = plotcount +1;
end
