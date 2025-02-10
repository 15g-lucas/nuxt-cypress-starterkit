FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN apk add --no-cache bash
RUN npm install -g npm@latest
RUN npm install
RUN npm install ts-node typescript --save-dev
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "dev"]
