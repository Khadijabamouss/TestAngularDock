#stage 1
FROM node:latest as builder
WORKDIR /app
COPY . .
RUN npm install --forcedocker images
RUN npm run build --prod
#stage 2
#FROM nginx:alpine
COPY --from=builder /app/dist/front_end-main /usr/share/nginx/html