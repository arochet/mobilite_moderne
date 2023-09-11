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
- nom
- listCategory

Choix
------
- idChoix
- titre
- question?
- listIdChoixAnswer
- idAnswer

Answer
------
- text
- listRessources