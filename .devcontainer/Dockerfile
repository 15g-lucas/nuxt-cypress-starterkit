FROM node:22
WORKDIR /workspace
RUN npm install -g yarn
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
EXPOSE 3000 8080
CMD ["yarn", "dev"]
