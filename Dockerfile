FROM node:11

WORKDIR /docs

RUN npm install docsify-cli -g

CMD ["docsify","serve"]