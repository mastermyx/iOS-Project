# iOS-Project
Module iOS - Epitech

Xavier MENU
Arthur HATCHIGUIAN

Application reprennant le concepte du Eisenhower Task Matrix.

Toute la partie serveur est gérée via des manageurs qui fake les retours de requètes après un delai de 0.5s. 

Nous avons ajouté le français et l'anglais selon la langue du device. 

L'AccountManager sert à gérer l'utilisateur. (info/mdp)
L'UserManager sert à gérer la base d'utilisateur.
Le TaskManager sert à gérer l'ensemble des tasks.
Les RequestManager, GoogleManager et FacebookManager servent à gérer les connections avec le serveur.


L'utilisateur peut se logger via fb, google ou via email. Il peut s'enregister via email.
Une fois log, il récupère les infos user et les tasks depuis le serveur. 
Via son profil, il peut changer son nom, son email et sa description. Il peut également se déconnecter ou reset son mot de passe.
Nous pouvons créer de nouvelle task, ou modifier les actuelles (type, titre et description) . Elles triées par ordre d'importance. 

Chaques modification, création ou suppression de task (ou profil) entraine un appel serveur qui valide la requête.

Les contraintes permettent d'utiliser l'applications de l'iphone 4S à l'ipad en mode portrait.

Tests unitaires présents sur différentes classes. 
