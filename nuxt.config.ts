// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  server: {
    port: 3001,
    host: '0.0.0.0',
  },
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true }
})
