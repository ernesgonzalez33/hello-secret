FROM node:16

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./
COPY tsconfig.json ./
COPY . .

RUN npm install typescript
RUN npm run build

EXPOSE 3000

CMD [ "node", "./dist/server.js" ]