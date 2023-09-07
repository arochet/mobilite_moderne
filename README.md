# Mobilité Moderne

Mis à jour : 24/11/2022


## DESCRIPTION DE L'APPLICATION

```
--> Entrer la description ici <--
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

La liste est [ici](DOCUMENTATION/fonctions_utils.md)

## CRYPTAGE

à remplir

## SCHEMA DE BASE DE DONNÉE

[voir ici](./DOCUMENTATION/schema_bdd.md)

## Values Objects

[voir ici](./DOCUMENTATION/value_objects.md)

## Lexiques

[voir ici](./DOCUMENTATION/lexique.md)