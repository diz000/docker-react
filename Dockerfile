FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 
# EXPOSE 80 needed for aws to expose 80 port
COPY --from=builder /app/build /usr/share/nginx/html