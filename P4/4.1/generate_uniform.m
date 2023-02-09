function lst = generate_uniform(N,imin,imax,alpha)
    comprimento=randi([imin imax],1,N);
    lst = cell([1,N])
    for i=1:N
        x = randi([1,length(alpha)],1,comprimento(i));
        word = alpha(x);
        lst{i}=word;
        fprintf(1,"%3d, %3d - %s\n",i,comprimento(i),word)
    end
end