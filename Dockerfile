# Development stage
FROM node:18.16-bullseye-slim AS workspace
WORKDIR /usr/src/app
RUN yarn global add @nestjs/cli@10.1.17

COPY package.json ./
RUN yarn install

COPY . .
RUN yarn build
CMD ["npm", "run", "start"]
