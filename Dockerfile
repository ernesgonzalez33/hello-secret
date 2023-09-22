FROM registry.access.redhat.com/ubi9/nodejs-18:1-70

WORKDIR /opt/app-root

COPY package*.json ./
COPY tsconfig.json ./
COPY . .

RUN npm install --cache="/opt/app-root/npm-cache"
RUN npm run build --cache="/opt/app-root/npm-cache"

EXPOSE 3000

CMD [ "node", "./dist/server.js" ]