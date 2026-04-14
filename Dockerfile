FROM node:18-alpine AS testing
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm test

FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=testing /usr/src/app/app.js ./
EXPOSE 3000
CMD ["node","app.js"]
