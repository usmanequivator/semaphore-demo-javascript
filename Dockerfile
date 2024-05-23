# Development stage
FROM node:18.16-bullseye-slim AS workspace
WORKDIR /usr/src/app
COPY package*.json tsconfig*.json *.env ormconfig*.json ./

COPY package.json ./
COPY yarn.lock ./
RUN yarn install

COPY . .
RUN yarn build

ENV NODE_ENV development

EXPOSE 3001

CMD ["yarn", "start"]

#FROM node:16.16.0-bullseye as dist
#WORKDIR /tmp/
#COPY package*.json tsconfig*.json *.env ormconfig*.json ./
#RUN npm install --legacy-peer-deps
#RUN npm run build
#
#FROM node:16.16.0-bullseye as node_modules
#WORKDIR /tmp/
#COPY package.json package-lock.json ./
#RUN npm install --production --legacy-peer-deps
#
#FROM node:16.16.0-bullseye
#WORKDIR /usr/local/nub-api
#COPY --from=node_modules /tmp/node_modules ./node_modules
#COPY --from=dist /tmp/dist ./dist
#COPY --from=dist /tmp/*.env /tmp/ormconfig*.json ./
#EXPOSE 3001
#CMD ["node", "dist/main.js"]
