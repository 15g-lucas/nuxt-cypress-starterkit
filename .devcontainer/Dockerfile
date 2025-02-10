FROM node:22
WORKDIR /workspace
RUN npm install -g npm
COPY package.json package-lock.json ./
RUN npm install
COPY . .
EXPOSE 3000 8080
CMD ["npm", "dev"]
