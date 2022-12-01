function affichage_tableau(){
    document.write("<table border=2 width=30%;>");
    for (i=0;i<=5;i++){
        document.write("<tr><td>*</td><td>*</td><td>*</td></tr>");
    }
    document.write("</table>");
}
function tableau2(){
    let col = prompt("rentrer le nombre de colonne voulue");
    document.write("<table border=2 width=30%;>");
    for (i = 1;i <= col;i++){
        document.write("<tr><td>"+i+"</td><td>*</td><td>*</td></tr>");
    }
    document.write("</table>");
}
function se_connecter(){
    let mdp = prompt("rentrer le mdp");
    let login = prompt("rentrer le login");
    if (mdp == 'admin' && login == 'admin'){
        document.write("bienvenue admin");
    }else{
        alert("accès refuser");
    }
}
function se_connecter2(){
    let i = 0;
    do{
        let mdp = prompt("rentrer le mdp");
        let login = prompt("rentrer le login");
        if (mdp == 'admin' && login == 'admin'){
            document.write("vous etes connecter ");
            break;
        }else{
            alert("accès refuser");
            ++i
        }
    }while (i<3);
    if (i == 3){
        alert("accès blocké");
    }
}
function ch_de_car(){
    let chaine = prompt("Donner un mot");
    document.write(chaine.toLocaleLowerCase()+"<br>");
    document.write(chaine.toLocaleUpperCase()+"<br>");
    document.write("la chaine contient = " + chaine.length + "caractère <br>");
    document.write("la premiere lettre est = " + chaine.substr(0,1) + "<br>");
}
function fct_switch(){
    let color = prompt("rentrer une couleur bleu ou rouge");
    switch(color){
        case 'bleu': 
            document.body.style.background = 'blue';
            break;
        case 'rouge':
            document.body.style.background = 'red';
            break;
        default: 
            alert("couleur ivalide");
    }
}
function facture(){
    let i = false;
    let total = 0;
    let c = 0;
    let tab = new Array();
    do{
        let article = prompt("rentrer le nom de l'article");
        let prix = Number(prompt("rentrer le prix de l'article"));
        let nbr = Number(prompt("rentrer la cantités de l'article que vous souhaité"));
        total += (prix*nbr);
        tab[c] = (article + '&nbsp;&nbsp;/&nbsp;&nbsp;' + prix + '&nbsp;&nbsp;/&nbsp;&nbsp;' + nbr + '<br>');
        c++;
        let bool = prompt("désirer vous un nouvel article?");
        if (bool == 'non'){
            i = true;
        } 
    }while (i == false);
    if (i == true){
        alert("achat terminé");
        document.write(tab + 'Total &nbsp;&nbsp;/&nbsp;&nbsp; ' + total + '');
    }
}

