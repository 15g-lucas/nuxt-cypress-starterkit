FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN apk add --no-cache bash
RUN npm install
RUN npm install ts-node typescript
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "dev"]