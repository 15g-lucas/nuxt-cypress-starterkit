FROM cypress/included:12.17.1
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["cypress", "run"]