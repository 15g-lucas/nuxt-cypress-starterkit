FROM cypress/included:latest
WORKDIR /e2e
RUN npm install ts-node typescript
RUN npm install
CMD ["cypress", "run"]