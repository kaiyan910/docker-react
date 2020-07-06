# Build Phase
FROM node:alpine

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .

# /app/build
RUN npm run build

# Run Phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
