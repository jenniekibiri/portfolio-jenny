
FROM node:alpine
RUN yarn add global gatsby-cli
WORKDIR /app

COPY package.json .

RUN yarn install

COPY . .

# RUN yarn build

EXPOSE 9000


CMD ["npm", "run", "serve"]