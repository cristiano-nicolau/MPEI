clear all
%% data
udata = load("u.data");
data = udata(1:end,1:3); 
tamanhodata=height(data);
clear udata;

usersdata = unique(data(:,1));
numUsersData = length(usersdata);

filmdata = unique(data(:,2));
numFilmData = length(filmdata);

%% users.txt
users=readcell('users.txt','Delimiter',';');
nUsers=height(users);

%% film_info.txt
filminfo=readcell('film_info.txt','Delimiter','\t');
nFilms=height(filminfo);

%% get users that evaluated current movie
UsersEvaluated = getUsers(filmdata,data);
numHash = 100;
matrizMinHashFilms = minHashFilms(filmdata,numHash,UsersEvaluated);


%%


numHash = 100; 
ineteresses = getInteresses(users);
numGenres = length(ineteresses);
matrizAssGenres = matrizAss(users,ineteresses);
matrizMinHashGenres = minHash(matrizAssGenres,numHash);
distancesGenres = getDistancesMinHashGenres(nUsers,matrizMinHashGenres,numHash);


%%



titles = filminfo(:,1);
numTitles = length(titles);
numHash = 100;
shingleSize = 3; 
matrizMinHashInteresses = minHashTitles(titles,numHash,shingleSize);
distancesInteresses = getDistancesMinHashTitles(numTitles,matrizMinHashInteresses,numHash);


%% functions
function Users = getUsers(filmdata,data)
    numFilm = length(filmdata);
    Users = cell(numFilm,1);

    for n = 1:numFilm
        ind = find(data(:,2) == filmdata(n));
        Users{n} = [Users{n} data(ind,1)];
    end
end
function matrizMinHashFilms = minHashFilms(filmdata,numHash,UsersEvaluated)
    numUsers = length(filmdata);
    matrizMinHashFilms = inf(numUsers, numHash);
    
    y = waitbar(0,'A calcular minHashFilms()...');
    for k= 1 : numUsers
        waitbar(k/numUsers,y);
        filmsUser = UsersEvaluated{k};
        for j = 1:length(filmsUser)
            chave = char(filmsUser(j));
            for i = 1:numHash
                chave = [chave num2str(i)];
                h(i) = DJB31MA(chave, 127);
            end
            matrizMinHashFilms(k, :) = min([matrizMinHashFilms(k, :); h]);
        end
    end
    delete(y);
end


function genres = getInteresses(users)
    genres = {};
    k = 1;

    for i= 1:height(users)
        for j= 4:17
            if ~anymissing(users{i,j}) && ~strcmp(users{i,j},'unknown')
                genres{k} = users{i,j};
                k = k+1;
            end
        end
    end

    genres = unique(genres);
end

function matrizAss = matrizAss(users,interesses)
    numFilms = height(users);
    numGenres = length(interesses);
    matrizAss = zeros(numGenres,height(users));

    for i= 1:numGenres
        for n= 1:numFilms
            for k= 2:7
                if ~anymissing(users{n,k})
                    if strcmp(interesses(i),users{n,k})
                        matrizAss(i,n) = 1;
                    end
                end
            end
        end
    end
end

function matrizMinHashInteresses = minHash(matrizAss,numHashFunc)
    p = primes(10000);
    matrizMinHashGenres = zeros(numHashFunc,width(matrizAss));
    kList = p(randperm(length(p),numHashFunc));

    for func= 1:length(kList)
        for d= 1:width(matrizAss)
            matrizMinHashGenres(func,d) = min(mod(find(matrizAss(:,d)==1),kList(func)));
        end
    end

end

function distances = getDistancesMinHashInteresses(nUsers,matrizMinHash,numHash) 
    distances = zeros(nUsers,nUsers);
    for n1= 1:nUsers
        for n2= n1+1:nUsers
            distances(n1,n2) = sum(matrizMinHash(:,n1)==matrizMinHash(:,n2))/numHash;
        end
    end
end




function matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize)
    numTitles = length(titles);
    matrizMinHashTitles = inf(numTitles, numHash);
    
    x = waitbar(0,'A calcular minHashTitles()...');
    for k= 1 : numTitles
        waitbar(k/numTitles,x);
        movie = titles{k};
        for j = 1 : (length(movie) - shingleSize + 1)
            shingle = lower(char(movie(j:(j+shingleSize-1)))); 
            h = zeros(1, numHash);
            for i = 1 : numHash
                shingle = [shingle num2str(i)];
                h(i) = DJB31MA(shingle, 127);
            end
        matrizMinHashTitles(k, :) = min([matrizMinHashTitles(k, :); h]);
        end
    end
    delete(x);
end
function distances = getDistancesMinHashTitles(numTitles,matrizMinHash,numHash) 
    distances = zeros(numTitles,numTitles);
    for n1= 1:numTitles
        for n2= n1+1:numTitles
            distances(n1,n2) = sum(matrizMinHash(n1,:)==matrizMinHash(n2,:))/numHash;
        end
    end
end


function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end

