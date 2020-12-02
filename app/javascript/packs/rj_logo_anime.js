const rj_logo_anime = document.querySelectorAll("#rj_logo_anime path");

for(let i = 0; i<rj_logo_anime.length; i++){
    console.log(`Letter ${i} is ${rj_logo_anime[i].getTotalLength()}`)
}
