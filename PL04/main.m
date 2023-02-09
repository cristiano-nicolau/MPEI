id = 0;

while(id<1 || id>1682)
    id = input('Insert Film ID (1 to 1682): ');
    if (id<1 || id>1682)
        fprintf("ERROR: Enter a valid ID Film\n");
    end
end

clear menu;
menu = menu('Select choice: ', ...
           '1 - Users that evaluated current movie ', ...
           '2 - Suggestion of users to evaluate movie', ...
           '3 - Suggestion of users to based on common interests', ...
           '4  - Movies feedback based on popularity', ...
           '5 - Exit');


while (menu ~= 5)
    switch menu
        case 1 
            usersevaluated = UsersEvaluated{id};
            numusersevaluated = height(usersevaluated);
            idfilm=filminfo(id,1);
            fprintf("\nUsers that Evaluated Movie '%s' \n\n",idfilm{1});

            for i= 1:numusersevaluated
                idUser = usersevaluated(i);
                nameUser = users(idUser,2);
                lastnameUser = users(idUser,3);
                fprintf("(ID: %d) - %s %s\n", idUser,nameUser{1},lastnameUser{1});
            end
             fprintf("\n-------------        -----------------\n\n");

        case 2 
            
            fprintf("\n")
            [J,index] = distanceFilm(matrizMinHashFilms, id, filminfo); %funçao muito parecida a do guiao PL04 usada como referida no guiao

            usersevaluated = UsersEvaluated{id}; %da todos os users que ja avaliaram o filme atual
            numusersevaluated = height(usersevaluated); %numero de users que ja viram o filme atual
           
            usersdontevaluated=zeros(nUsers,1); %um array numero de users * por 1 colunas, linhas sao os id dos users, coluna 2 se ja viu ou nao o filme (o-viu 1 nao viu)
            for i=1 : numusersevaluated
                usersdontevaluated (usersevaluated(i),1) = 1;       % no fim do ciclo for - fica um arry em que as linhas sao os ids dos users onde se na coluna estiver 1 significa que o user ja viu esse filme
            end
            usersevaluatedsimilarfilm1 = UsersEvaluated{index(2)};  % users que avaliaram film similiar 1
            usersevaluatedsimilarfilm2 = UsersEvaluated{index(3)};  % users que avaliaram film similiar 2
            userseeonefilm=zeros(nUsers,1);  %um array numero de users * por 1 colunas, linhas sao os id dos users, coluna 2 se ja viu ou nao um dos filmes uma vez que nao viu o filme inserido (o-viu 1 nao viu)
            for i=1 :nUsers
                if usersdontevaluated(i) == 0 %se o user nao viu o filme do id inserido inicial
                      for h=1 : height(usersevaluatedsimilarfilm1)
                          if usersevaluatedsimilarfilm1(h)== i % mas se ja viu o 1 dos filmes similiares
                              userseeonefilm(i)=1;  %entao viu um dos filmes mas nao avaliou o atual
                          end
                      end
                      for j=1 : height(usersevaluatedsimilarfilm2)
                          if usersevaluatedsimilarfilm2(j)== i
                              userseeonefilm(i)=1;
                          end
                      end
                end
            end
            fprintf("Users que ainda não avaliaram o filme:\n");
            for i=1 : nUsers
                if userseeonefilm(i)==1
                    nameUser = users(i,2);
                    lastnameUser = users(i,3);
                    fprintf("ID %d - %s %s\n", i, nameUser{1},lastnameUser{1});
                end
            end
            fprintf("\n-------------        -----------------\n\n");
        case 3
            threshold = 0.90;
 
        case 4 
            %% Esta funcional mas o rating nao é dado atraves de um bloom filter como pedido no enunciado pois estava a dar diversosos erros
            search = lower(input('Insira um nome um filme ou parte de nome: ', 's'));

            while (length(search) < shingleSize)
                fprintf('Write a minimum of %d characters\n', shingleSize);
                search = lower(input('Write a string: ', 's'));
            end
            
            fprintf("Similar Titles: \n\n");
            minHashSearch=searchTitle(search, numHash, shingleSize);
            [similarTitles,distancesTitles,k] = filterSimilar(titles,matrizMinHashTitles,minHashSearch,numHash);
         
            if (k == 0)
                disp('No results found');
            elseif (k > 3)
                k = 3;
            end
            
            distances = cell2mat(distancesTitles);
            [distances, index] = sort(distances);
            
            ratingmaiorque3=0;
            for h = 1 : k
                for i= 1 : tamanhodata
                    if data(i,2)==index(h)
                        if data(i,3)>=3
                            ratingmaiorque3=ratingmaiorque3 + 1;
                        end
                    end
                end
                fprintf('%s - Rating: %d \n', similarTitles{index(h)},ratingmaiorque3);
            end
            fprintf("\n-------------        -----------------\n\n");
    end
    clear menu;
    menu = menu('Select choice: ', ...
           '1 - Users that evaluated current movie ', ...
           '2 - Suggestion of users to evaluate movie', ...
           '3 - Suggestion of users to based on common interests', ...
           '4  - Movies feedback based on popularity', ...
           '5 - Exit');

end
%% opcao2
function minHashSearch=searchTitle(search, numHash, shingleSize)
    minHashSearch = inf(1, numHash);
    for j = 1 : (length(search) - shingleSize + 1)
        shingle = char(search(j:(j+shingleSize-1))); 
        h = zeros(1, numHash);
        for i = 1 : numHash
            shingle = [shingle num2str(i)];
            h(i) = DJB31MA(shingle, 127);
        end
        minHashSearch(1, :) = min([minHashSearch(1, :); h]);
    end

end


function [similarTitles,distancesTitles,k] = filterSimilar(titles,matrizMinHashTitles,minHash_search,numHash)
    similarTitles = {};
    distancesTitles = {};
    numTitles = length(titles);
    k=0;
    for n = 1 : numTitles
        distancia = 1 - (sum(minHash_search(1, :) == matrizMinHashTitles(n,:)) / numHash);
        k = k+1;
        similarTitles{k} = titles{n};
        distancesTitles{k} = distancia;
        
    end
end

%% opcao 3

%% ////
function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end

%% bloom filter nao usado
function resultado = pertenceConjunto(filtro,chave,numHashFunc)
    res_lst = zeros(numHashFunc,1);
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),length(filtro))+1;
        res_lst(i) = filtro(code);
    end
    resultado = sum(res_lst)==numHashFunc;
end
function filtro = inicializarFiltro(n)
    filtro = zeros(n,1);
end
function filtro = adicionarElemento(filtro,chave,numHashFunc)
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),length(filtro))+1;
        filtro(code) = 1;
    end
end