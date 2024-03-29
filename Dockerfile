FROM node:10.9.0-alpine

RUN npm install express

EXPOSE 3000

COPY app.js .
COPY test.html .

CMD node app.js