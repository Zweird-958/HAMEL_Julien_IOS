# TestSubDeVinci
Vous devrez faire un qcm pour votre examen (ou de l’importance des termes choisis)

Programmez un qcm pour une école. Voici les instructions. Pensez à bien organiser l’architecture, à avoir un code lisible et bien documenté.

L’écran d’accueil est divisé en deux parties (divider() est une vue qui permet de tracer une ligne), la partie du haut permet de se connecter si on est déjà inscrit, au moyen de son pseudonyme et de son mot de passe. En cas d’erreur, une alerte apparaît. Pensez à sécuriser  les entrées des formulaires en cas d’absence de texte par exemple.
La partie du bas permet de se créer un compte en entrant son pseudo, son nom, son prénom et le mot de passe, à répéter deux fois. Il ne peut y avoir deux pseudo identiques dans la base de données. Une alerte apparaît en cas d’erreur d’inscription.
Astuce : je vous suggère d’utiliser le fichier des erreurs que je vous ai fourni, en l’adaptant à la situation.

Une fois connecté, l’utilisateur a une vue qui lui permet de se déconnecter ou d’accéder à différentes options selon son statut.

Si c’est un administrateur qui se connecte, il a accès directement aux notes des étudiants.

Si un étudiant se connecte, il a accès aux questions. Il a le choix entre trois réponses pour chaque question. À chaque fois qu’il valide une question, la suivante apparaît. À la fin, son score apparaît à l’écran. S’il a déjà effectué le quizz et qu’il se reconnecte, un message lui affiche qu’il a déjà effectué le quizz et lui rappelle sa note.

Bon courage.
