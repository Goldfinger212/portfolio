function calcul_moyenne(){
    var note1 = prompt("rentrer la 1er note: ");
    var note2 = prompt("rentrer la 2eme note: ");
    var note3 = prompt("rentrer la 3eme note: ");
    var somme = Number(note1)+Number(note2)+Number(note3);
    var result = somme/3;

    document.write("la moyenne sera de: "+result+"<br>");

    if(result < 10){
        document.write("vous etes redoublant");
    }else{
        document.write("vous etes admis");
    }
}
function test_age(){
    age = prompt("rentrer votre age");
    if (age >= 18){
        document.write("vous etes majeur")
        document.body.style.background = "green"
    }else{
        document.write("vous etes mineur")
        document.body.style.background = "red"    
    }
}
function test_couleur(){
    c = prompt("rentrer une couleur soit bleu ou rouge");
    if (c == "rouge" || c == "ROUGE"){
        document.body.style.background = "red";
    }else if(c == "bleu" || c == "BLEU"){
        document.body.style.background = "blue";
    }else{
        document.write("couleur invalide");
    }
}
function simple_affichage(){
    var nom = prompt("entrer votre nom")
    var prenom = prompt("entrer votre prenom")

    document.write("<div style = 'margin: auto; width: 300px; border: 2px solid blue;'>");
    document.write("bonjour "+ prenom + " " + nom);
    document.write("</div");
}