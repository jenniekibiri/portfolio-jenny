
FROM node:alpine
RUN yarn add global gatsby-cli
WORKDIR /app

COPY package.json .

RUN yarn install

COPY . .

RUN yarn run build

CMD ["yarn", "run", "serve"]