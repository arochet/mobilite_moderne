# Schéma base de donnée

# ACCOUNT

User
------
- passwordCrypted
- typeAccount
- userName


# MESSAGERIE

Messages / idDiscussion
------
- text?
- date
- img
- idUser


# RESOURCE 

Category
------
- nom (nom de la catégorie)
  - sub (liste des sous catégories)
    - nom
      - sub
        - nom
        - listResource (Liste des ressources associés à la catégorie)
    - nom
      - sub
    - nom
      - sub


Resource
------
- categoryPath (Sert pour la recherche Algolia)
- description (Sert pour la recherche Algolia)
- documentPath (Chemin d'accès dans Storage)
- idCategory (vide)
- keyword (Sert pour la recherche Algolia)
- nom (Nom du document)
- type (PDF / Video / ...)

# ASSISTANT

Choice
------
- nom
- question
- answer
  - nom
  - question
  - answer
    - nom
    - answer
    - listRessources

ChoiceWithQuestion
------
- nom
- question
- path (Chemin dans Firebase)
- listChoixQuestion (Question suivantes)
- listChoixReponse (Réponse aux question)

ChoiceWithAnswer
------
- text
- listRessources (référence aux PDFs, vidéo ...)



# ACTUALTITE

News (Actualité)
------
- content
- image
- keywords
- subcontent
- title