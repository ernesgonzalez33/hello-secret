FROM registry.access.redhat.com/ubi9/nodejs-18:1-70

ENV DESCRIPTION="Hello World app to test secrets"

LABEL description=${DESCRIPTION} \
      io.k8s.description=${DESCRIPTION} \
      io.k8s.display-name="Hello Secret" \
      io.openshift.tags="hello secret" \
      summary=${DESCRIPTION}

WORKDIR /opt/app-root

COPY package*.json ./
COPY tsconfig.json ./
COPY . .

RUN npm install --cache="/opt/app-root/npm-cache"
RUN npm run build --cache="/opt/app-root/npm-cache"

EXPOSE 3000

CMD [ "node", "./dist/server.js" ]