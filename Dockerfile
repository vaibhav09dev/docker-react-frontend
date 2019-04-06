# Build Phase of Our React Application
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build

# Run Phase 
# /app/build will have all our files required to host our application
FROM nginx
EXPOSE 80

# copy build folder created from above phase
COPY  --from=builder /app/build /usr/share/nginx/html