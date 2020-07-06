# Build Phase
FROM node:alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install

COPY . .

# /app/build
RUN npm run build

# Run Phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
