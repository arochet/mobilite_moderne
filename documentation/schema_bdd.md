# Schéma base de donnée


User
------
- passwordCrypted
- typeAccount
- userName


Article
------
- title
- brand
- description
- listKeyword
- listRessources
- idCategorie
- cheminCategorie?

Messages / idDiscussion
------
- text?
- date
- img
- idUser

Category
------
- nom (nom de la catégorie)
  - sub (liste des sous catégories)
    - nom
      - sub
    - nom
      - sub
    - nom
      - sub

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