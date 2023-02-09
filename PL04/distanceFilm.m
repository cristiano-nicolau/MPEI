function [J,index] = distanceFilm(matrizMinHashFilms, id, filminfo)
    Nu = height(filminfo);
    J=zeros(1,Nu);   % array para guardar distancias
    h= waitbar(0,'Calculating');
    for n1= 1:Nu
        J(n1) = 1 - (sum(matrizMinHashFilms(n1,:)==matrizMinHashFilms(id,:))/length(matrizMinHashFilms(1,:)));
    end
    delete (h)

    [J,index] = sort(J);

    fprintf("Filmes Similares: \nID %d - %s\nID %d - %s\n\n", index(2), filminfo{index(2),1}, index(3), filminfo{index(3),1});
    
end