FROM node:18.15.0-alpine as build
WORKDIR /app
COPY package.json /app
RUN npm install 
COPY . /app
EXPOSE 3000
#CMD ["npm","start"]
RUN npm run build

FROM nginx:stable-alpine as deploy
WORKDIR /app
COPY --from=build /app/build /usr/share/nginx/html/
# Build the Docusaurus app
