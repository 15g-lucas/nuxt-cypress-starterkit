# Nuxt + Cypress Starterkit

This project is a starter kit for a Nuxt.js project with Cypress for end-to-end testing. It uses Docker to facilitate environment management.

## Installation

1. **Clone the repository**

   Clone the Git repository using the following command:

   ```bash
   git clone https://github.com/15g-lucas/nuxt-cypress-starterkit.git
   ```

2. **Navigate to the project directory**

   Next, move to the cloned project directory:

   ```bash
   cd nuxt-cypress-starterkit
   ```

3. **Set the TRIGRAM and PORT environment variable**

   ⚠️ Before starting the project, **you must change the** `TRIGRAM` **and** `NUXT_PORT` **variables** in the `.env` file to match your project's unique identifier. This is essential for the correct naming of the Docker containers.

## Start the project

1. **Start the project with Docker Compose**

   To start the Nuxt application, use the following command:

   ```bash
   docker compose up -d --build
   ```

2. **Access the Nuxt container**

   You can enter the Nuxt container with the command:

   ```bash
   docker exec -it TRIGRAM_nuxt-app bash
   ```

3. **Run Cypress**

   To get information about your Cypress project, run the following command:

   ```bash
   docker run -it --entrypoint=cypress cypress/included:latest info
   ```

4. **Run Cypress tests**

   To run all Cypress tests, use this command:

   ```bash
    docker compose run --rm --remove-orphans cypress
   ```

   This command will run all the tests defined in your Cypress project.

## Cypress Configuration

The configuration file `cypress.config.ts` defines important parameters for running Cypress tests. Here is an example of a basic configuration:

```typescript
import { defineConfig } from 'cypress'

export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // You can add custom events here if needed
    },
  },
  retries: {
    runMode: 1,   // Number of retries in run mode
    openMode: 1,  // Number of retries in open mode
  },
  defaultCommandTimeout: 5000,  // Default timeout for commands (in ms)
  viewportWidth: 1280,  // Browser window width
  viewportHeight: 720, // Browser window height
  screenshotOnRunFailure: true, // Capture a screenshot on test failure
  video: true, // Record a video of the tests
})
```

### Explanation of options:

- **retries**: Configures the number of retries for failed tests. `runMode` applies when tests are executed in headless mode (without a graphical interface), and `openMode` applies when Cypress is opened with the graphical interface.

- **defaultCommandTimeout**: The default timeout for each command in the tests, set here to 5000 ms (5 seconds).

- **viewportWidth and viewportHeight**: Defines the browser window size for the tests. Here, the size is set to match a standard HD resolution (1280x720).

- **screenshotOnRunFailure**: Enables automatic screenshot capture if a test fails.

- **video**: Enables video recording of tests during execution. This can be useful for analyzing test failures.
