# Dist Atelier

Mis à jour : 24/11/2022
Developpeur : Alban Rochet - arochet@digital-village.fr


## DESCRIPTION DE L'APPLICATION

```
L'application Dist'Atelier permet à son utilisateur d'obtenir de l'aide pour la réparation d'un vélo / trotinnette / scooter dans l'électrique. 

L'utilisateur à plusieurs possibilités
- L'assistant diagnostique : système de question réponse
- Messagerie : possibilité de communiquer avec l'admin
- La visio-assistance : permet de prendre un rdv
- ressource : permet de faire une recherche de document par champs de recherche ou catégorie

L'utilisateur peut également suivrent les actualités
```


## STATE MANAGEMENT
L'application utilise RiverPod comme StateManagement
https://riverpod.dev/



## LE BACK-END
Par défaut, ce projet est configuré avec FireBase. 
Firebase est un back-end géré par Google. Il s'occupe de l'authentification et de la base de données avec FireStore. 

Les fichiers de configuration iOS
-> ios/Runner/GoogleService-Info.plist ce fichier configure Firebase à l'appli iOS
Les fichiers de configuration Android
-> android/app/google-services.json (même chose pour android)


## LES ENVIRONNEMENTS

Il y a 3 environnements :

    PROD : Version pour l'utilisateur finale
    TEST : Version pour les testeurs
    DEV : Version pour les developpeurs

Exemple pour tester si on est en développement: 
```
final env = ref.watch(environment.notifier).state.name;
if (env == Environment.dev)
```


## ARCHITECTURE DU PROJET

Ce projet est contruit avec l'architecture Domain Driven Design (Clean Architecture). 
Les fichiers sont répartis en 4 dossiers :
- **PRESENTATION** : Comprends tous les fichiers liés aux écrans de l'application
- **INFRASTRUCTURE** : Comprends tous les fichiers liés à l'ajout / modification / suppression de données en base 
- **DOMAIN** : Comprends toutes les classes du projet
- **APPLICATION** : Tous les fichiers qui permettent de gerer les formulaires

Pour plus d'information sur l'architecture Domain Driven Design, rendez-vous [ici](https://otakoyi.software/blog/flutter-clean-architecture-with-riverpod-and-supabase)

### Ajout d'une classe
Lorsque l'on veut ajouter une classe on créer le fichier MaClasse.dart dans Domain, puis son
équivalent MaClasseDTO.dart dans Infrastructure. DTO = Data Transfert Oject. C'est la version
de la classe qui est compatible avec la base de données. 
Cette classe peut avec des champs personnalisés que l'on va retrouve dans le fichier value_object.
Ces champs personnalisés peuvent avoir des 'validators', ce qui permet de vérifier si le champs
est valide ou non. 

Exemple : La Classe UserData comprend le champ EmailAddress. Ce champs EmailAddress est un String 
dans UserDataDTO. Le champs EmailAddress a un 'validator' dans Domain/Core/value_validators.dart

### Repository
Fichiers que l'on retrouve dans Infrastructure. Permet d'interagir avec le BackEnd.
Exemple : Ajout / Modification / Suppression d'un objet en base de données. 

### domain/fichier_failure
Une fonction peut retourner soit un résultat valide, soit une erreur. 
On utilise pour cela la bibliothèque Dartz qui permet un retour de fonction : Either<Erreur, Result>
Les fichiers failure permettent de voir le type d'erreur

### domain/value_object
Permet de créer ses propres paramètre pour une classe donnée. 
Exemple : La classe UserData aura comme paramètres Nom,Email, MotDePasse ....
Nom , Email et MotDePasse sont des String qui peuvent être valide ou non. 
Un nom est un String avec au maximum 50 caractères.
On vérifie si ce paramètre est valide dans value_validators. 

Either<ValueFailure, Result>
Bibliothèque Dartz. Une fonction retourne un résultat ou une erreur. 


## LES PACKAGES

Dartz
Injectable

## THEME

Tout le thème de l'application est définis dans lib/PRESENTATION/core/_core/app_widget.dart

## LES FONCTIONS UTILS

Vous trouverez toutes les fonctions Utils dans ce dossier : 
```
lib/PRESENTATION/core/_utils/
```

La liste est [ici](documentation/fonctions_utils.md)

## SCHEMA DE BASE DE DONNÉE

[voir ici](./documentation/schema_bdd.md)

## Values Objects

[voir ici](./documentation/value_objects.md)

## Lexiques

[voir ici](./documentation/lexique.md)

## Points Clés de l'application

#### Assisant Question / Réponse

Dans Firebase, on trouve une arborescence qui définit le système de question réponse. Chaque noeuds correspond à ChoiceDTO. Ce ChoiceDTO peut être ensuite convertis en 2 classes différence ChoiceWithQuestion et ChoiceWithAnswer. ChoiceWithQuestion est un choix qui comprends ensuite plusieurs question, donc d'autres ChoiceDTO. ChoiceWithAnswer comprend une liste de Answer. Une Answer à une réponse et des ressources qui lui sont associés.

#### Messagerie

Dans Firebase on a la collection Message. Chaque document dans la collection message à un ID qui correspond à l'idUtilisateur de la personne qui souhaite communiquer avec l'admin. Ainsi l'admin à accès à tous les message. 
Message/idDiscussion/Discussion/ On a la liste des messages. Chaque message est associé à un idUtilisateur. Les message sont trié par date de publication. On a des messages texte ou des message image. 
Les messages image sont stockés dans Firebase Storage à l'emplacement Message/idDiscussion/NomImage
On charge les images de manière différente sur mobile et web.
On pourrais continuer à optimiser le chargement des messages car pour le moment on charge une discussion complète. 
Chaque discussion stocke des informations : (date Du Dernier Message, Nom de la discussion qui est le nom de l'utilisateur, Si la discussion a été répondu).

#### Visio Assistance

C'est pour le moment un simple lien vers une page de réservation de d'agenda. 

#### Ressources

Une ressource correspond à un fichier PDF ou une vidéo pour expliquer un problème en particulier. Une ressource peut être classé dans une catégorie. Elle possède des mots clés et une description pour qu'on puisse aller la chercher via Algolia. A chaque création d'une ressource, une cloud function viens dupliquer automatiquement les infos firebase de la ressource dans la moteur Algolia. 
On trouve les ressources dans le chemin Ressource/ de Firebase. 
Les catégories, les articles d'actualité et les réponses (Answer) dans assistants diagnostique peuvent avoir une liste d'idRessource. Grâce au component dans Prensentation/resource/component/panel_list_resource.dart , on peut afficher la liste des ressources (PDF et vidéo) lié à l'objet. 

#### Système de catégorie

On trouve la classe Catégorie qui permet de créer une arborescence pour accéder à des ressources. Une catégorie peut avoir des sous catégories ou bien une liste de ressources. 

#### Actualité

Système simple d'article. Il y'a une liste classé par date de publication. Chaque article à une photo, un titre, un contenue, un sous contenue, des mots clés et une liste de ressource associé. 

#### Stripe

Stripe permet de gérer l'abonnemnet utilisateur à Dist Atelier. Chaque utilisateur lorsqu'il créer son compte active un nouveau compte Stripe avec une cloud function. Ce compte Stripe à un identifiant idStripe qui est stocké dans UserData (Firebase user/idUser/UserData). On trouve ensuite dans Provider userIsSubscribed qui permet de savoir si l'utilisateur est abonné ou non à Dist'Atelier. 

#### Algolia

Dist' Atelier utilise Algolia pour faire de la recherche par mot clé. Chaque ressource à une description et des mots clé pour cette recherche. Lorsque l'on créer une ressource dans Firebase, une fonction Google Cloud est activé pour dupliquer les informations de firebase dans la base de donnée Alglia. Ainsi, lorsque l'on fait une recherche dans l'appli, on vient taper dans la base de donnée Algolia qui retourne un liste de ressources.

#### Firebase

Toute la base de donnée est stocké avec Firebase. On utilise Firebase Auth, Firestore, Firebase Storage et Functions. 
Voir le schéma de base de donnée
Pour le déploiement en WEB on utilise Firebase Hosting

#### Clouds Functions

Les clouds functions sont codé dans functions/index.js. Elle permettent de gérer les abonnemnent Stripe et de dupliquer automatiquement la base de donnée des ressources dans Algolia. 

## Compte 



Stripe : devsuptekdigital@gmail.com
Algolia : devsuptekdigital@gmail.com
Firebase : mobilitemodernedev@gmail.com
Apple : devsuptekdigital@gmail.com
Android : devsuptekdigital@gmail.com

#### Déploiement WEB

```````
flutter build web (2x : dans mobilite moderne + admin)
-> Ca va générer le code web dans le dossier build/web
firebase deploy --only hosting
-> Ca récupère le code web pour le deployer sur FirebaseHosting (utilisateur et admin)
```````

## DONNEES UTILISATEUR

Dans l'application, on stocke uniquement le nom et adresse email des utilisateurs. Une adresse est demandé pour l'abonnement Stripe. Les mots de passe sont cryptés. 
Lorsqu'un utilisateur supprime son compte. Ses informations ne sont pas conservés en base. 