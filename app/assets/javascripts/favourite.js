//favourite starwars films in local storage

function favouriteMe(val,option){
    // option 1 = add to local storage
    // option 2 = remove from local storage

    let theNameAndValue = val;
    
    if(option > 1){
        localStorage.removeItem("starwars-" + theNameAndValue);
    }else{
        localStorage["starwars-" + theNameAndValue] = theNameAndValue;
    }
    
    //retrieve all films from storage
    //have a startsWith, don't grab all storage, possible others 
    let search = 'starwars-';
    let values = Object.keys(localStorage)
                   .filter( (key)=> key.startsWith(search) )
                   .map( (key)=> localStorage[key] );

    //loop and push to array
    let filmArray = [];
    values.forEach(element => {
        filmArray.push(element);
    });

    //clear
    document.getElementById("favourites").innerHTML = null;

    //create let for lenght - Big O notation
    let filmArrayLength = filmArray.length;
    
    if(filmArray.length === 0){
        document.getElementById("favourites").innerHTML = "No favourite films";
    }else{
        //loop and quick append
        for(let i = 0; i < filmArrayLength; i++){
            document.getElementById("favourites").innerHTML +=
            `<tr><td>${filmArray[i]}</td><td><button class="ui google plus button" onClick="favouriteMe('${filmArray[i]}',2)">Remove me</button></td></tr>`;
        }
    }    

    //alert user of choice
    if(option === 1){
        alertUser(val);
    }

}

function alertUser(val){
    //alert user of choice
    alert("Great choice " + val + ", This film will now be added to your favourites. :-)");
}

function favOnLoad(){
    //retrieve all films from storage
    //have a startsWith, don't grab all storage, possible others 
    let search = 'starwars-';
    let values = Object.keys(localStorage)
                   .filter( (key)=> key.startsWith(search) )
                   .map( (key)=> localStorage[key] );
    
    //loop and push to array
    let filmArray = [];
    values.forEach(element => {
        filmArray.push(element);
    });

    //clear
    document.getElementById("favourites").innerHTML = null;

    //create let for lenght - Big O notation
    let filmArrayLength = filmArray.length;

    if(filmArray.length === 0){
        document.getElementById("favourites").innerHTML = "No favourite films";
    }else{
        //loop and quick append
        for(let i = 0; i < filmArrayLength; i++){
            document.getElementById("favourites").innerHTML +=
            `<tr><td>${filmArray[i]}</td><td><button class="ui google plus button" onClick="removeMe('${filmArray[i]}')">Remove me</button></td></tr>`;
        }
    }
}

