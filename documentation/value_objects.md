LEXIQUES DE TOUTES LES CLASSES
Mis à jour : 21/11/2022

## AUTH > UserData
Données correspondant à l'utilisateur de l'application. 
Un utilisateur a un type de compte (email / google / echec)

## AUTH > VALUE_OBJECT 
    Nom
    Telephone
    EmailAddress
    Password
    PasswordConfirmation
    TypeAccount

## CORE > VALUE_OBJECT 
    UniqueId

## CORE > VALUE_VALIDATORS
    validateMaxStringLength(String input, int maxLength)
    validateMaxStringLengthAndNoNull(String input, int maxLength)
    validateStringNotEmpty(String input)
    validateSingleLine(String input)
    validateEmailAddress(String input)
    validateTelephone(String input)
    validatePassword(String input)
    validatePasswordConfirmation(String input, String input2)
