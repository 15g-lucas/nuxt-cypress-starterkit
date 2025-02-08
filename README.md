# Nuxt + Cypress Starterkit

Ce projet est un starter kit pour un projet Nuxt.js avec Cypress pour les tests end-to-end. Il utilise Docker pour faciliter la gestion des environnements.

## Prérequis

- Docker
- Docker Compose
   ```bash
   git clone https://github.com/15g-lucas/nuxt-cypress-starterkit
   ```

## Démarrer le projet

1. **Lancer le projet avec Docker Compose**

   Pour démarrer l'application Nuxt, utilisez la commande suivante :

   ```bash
   docker compose up -d
   ```

2. **Accéder au conteneur Nuxt**

   Vous pouvez entrer dans le conteneur Nuxt avec la commande :

   ```bash
   docker exec -it nuxt_app bash
   ```

3. **Lancer Cypress**

   Pour obtenir des informations sur votre projet Cypress, exécutez la commande suivante :

   ```bash
   docker run -it --entrypoint=cypress cypress/included:latest info
   ```

4. **Exécuter les tests Cypress**

   Pour lancer l'ensemble des tests Cypress, utilisez cette commande :

   ```bash
   docker run -it -v $PWD:/e2e -w /e2e --name cypress-tests --rm cypress/included:latest
   ```

   Cette commande va exécuter tous les tests définis dans votre projet Cypress.

5. **Spécifier le navigateur de test**

   Si vous voulez spécifier un navigateur, vous pouvez ajouter l'option `-b chrome` pour tester avec Chrome, par exemple :

   ```bash
   docker run -it -v $PWD:/e2e -w /e2e --name cypress-tests --rm cypress/included:latest -b chrome
   ```

6. **Exécuter des tests spécifiques**

   Pour exécuter un test spécifique, vous pouvez utiliser l'option `-s` pour spécifier le chemin vers le fichier de test :

   ```bash
   docker run -it -v $PWD:/e2e -w /e2e --name cypress-tests --rm cypress/included:latest -s cypress/e2e/spec.cy.ts
   ```

