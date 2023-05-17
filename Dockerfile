FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# /app/build <---- All the stuff we care about

FROM nginx
# Wan't to copy over fall this things we care about
COPY --from=builder /app/build /usr/share/nginx/html
