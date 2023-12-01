
# COMMANDES POUR LE PROJET
Liste de toutes les commandes utilisable pour ce projet

```
gogo 
```
Description: Permet de lancer rapidement la commande flutter pub run build_runner 
<br>
  
## Nouvelle classe
```
nouvelleclasse.sh
```

Permet de créer : 
- Une nouvelle classe ddans le dossier DOMAIN avec tous les attributs
- La classeDTO correpondante dans le dossier INFRASTRUCTURE
- Un fichier repository avec la creation / suppression / modifcation de cette classe dans le dossier INFRASTRUCTURE
- Un fichier pour créer un formulaire d'ajout dans la dossier APPLICATION
- Une page avec une liste de cette classe dans PRESENTATION
- Une page avec la vue de cette classe dans PRESENTATION
- Une page de formulaire avec l'ajout de cette classe dans PRESENTATION

**Utilisation**  
nouvelleclasse.sh nomDeLaClasse
Entrez les paramètres
- Nom-nom 
- DateTime-datelimite 
- String-surnom 
- UniqueId-idParent

<br>  

## Nouvelle Page

```
nouvellepage.sh
```

Permet de créer une page
- Met à jour de ROUTER
- Créer la nouvelle page

Utilisation: 
nouvellepage.sh nomDuFichier chemin/dossier
nouvelleclasse.sh nomDeLaClasse

<br>  

## Traduction
```
trad 
```
Ajoute un mot/ une phrase avec ses différentes traductions
Utilisation: trad bonjour
Entrer la traduction en français
Entrer la traduction en anglais

## Commande Stripe

```
firebase functions:config:set \
    stripe.push="your_push_key" \
    stripe.key="your_live_or_test_key"
```