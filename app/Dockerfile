FROM node:17-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

FROM node:17-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist /usr/src/app/*.ts /usr/src/app/package*.json ./
RUN npm install --production
EXPOSE 3000
CMD [ "node", "server.js" ]
