# Nuxt + Cypress Starterkit

Ce projet est un starter kit pour un projet Nuxt.js avec Cypress pour les tests end-to-end. Il utilise Docker pour faciliter la gestion des environnements.

## Prérequis

- Docker
- Docker Compose

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

## Configuration de Cypress

Le fichier de configuration `cypress.config.ts` définit des paramètres importants pour l'exécution des tests Cypress. Voici un exemple de configuration de base :

```typescript
import { defineConfig } from 'cypress'

export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // Vous pouvez ajouter ici des événements personnalisés si nécessaire
    },
  },
  retries: {
    runMode: 1,   // Nombre de réessais en mode d'exécution
    openMode: 1,  // Nombre de réessais en mode interactif
  },
  defaultCommandTimeout: 5000,  // Délai d'attente par défaut pour les commandes (en ms)
  viewportWidth: 1280,  // Largeur de la fenêtre du navigateur
  viewportHeight: 720, // Hauteur de la fenêtre du navigateur
  screenshotOnRunFailure: true, // Capturer une capture d'écran en cas d'échec de test
  video: true, // Enregistrer une vidéo des tests
})
```

### Explication des options :

- **retries** : Configure le nombre de réessais pour les tests échoués. `runMode` s'applique lors de l'exécution des tests en mode headless (sans interface graphique), et `openMode` s'applique lorsque Cypress est ouvert avec l'interface graphique.

- **defaultCommandTimeout** : Délai d'attente par défaut pour chaque commande dans les tests, ici configuré à 5000 ms (5 secondes).

- **viewportWidth et viewportHeight** : Définissent la taille de la fenêtre du navigateur pour les tests. Ici, la taille est configurée pour correspondre à une résolution HD standard (1280x720).

- **screenshotOnRunFailure** : Active la capture d'écran automatique en cas de test échoué.

- **video** : Active l'enregistrement vidéo des tests pendant leur exécution. Cela peut être utile pour l'analyse des échecs de tests.