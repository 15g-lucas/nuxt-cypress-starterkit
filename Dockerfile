FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN apk add --no-cache bash
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "dev"]
