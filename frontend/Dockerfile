FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci --silent
COPY . .
RUN NODE_OPTIONS=--openssl-legacy-provider \
    npx ng build --configuration=production \
    --aot=false --build-optimizer=false


FROM nginx:alpine
COPY --from=build /app/dist/frontend /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]