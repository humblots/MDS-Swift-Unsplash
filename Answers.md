# Unsplash

## Exercice 1

### 1.3

- Expliquez ce qu’est LazyVGrid et pourquoi on l’utilise.
    - LazyVGrid est un composant permettant d'afficher des éléments sous la forme d'une liste verticale séparée en X colonnes en fonction du nombre de GridItem qu'on lui renseigne.

- Expliquez les différents types de colonnes et pourquoi on utilise flexible ici.
    - Il existe trois types de colonnes:
        - adaptative: Permet d'afficher un certain nombre d'éléments dans un même GridItem
        - fixed: Restreint les dimensions du GridItem de manière fixe
        - flexible: Laisse le GridItem occuper l'espace restant

- Votre grille ne doit pas être très jolie, expliquez pourquoi les images prennent toute la largeur de l’écran.
    - Sans padding, la LazyGrid occupe tout l'écran

## Exerecice 3

- Il existe 3 façons de faire un appel asynchrone en Swift
    - async/await
    - Combine
    - completionHandler / Grand Central Dispatch (GCD)
- Expliquez les différences entre ces 3 méthodes.
    - async/await: Une fonction asynchrone effectue une tache plus ou moins longue ne bloquant pas le thread d'exécution principale, le résultat de la tâche peut cependant être attendu et donc bloquer temporairement l'exécution via le mot clé await
    - Combine: Fonctionne via un Publisher chargé d'effectuer les taches puis d'en "publier" les valeurs, et de subscribers qui réagisse lorsque des nouvelles valeurs leurs sont transmises.
    - completionHandler / GCD: Un completion handler peut-être résumé en un callback appelé 