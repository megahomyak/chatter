FROM python:3.13.7-alpine3.21
RUN mkdir /app /app/users /app/rooms
ENV CHATTER_HOST=0.0.0.0
ENV CHATTER_PORT=80
ENV CHATTER_USERS_DIR=/app/users
COPY ./server /app/server
WORKDIR /app/rooms
CMD [ "/app/server" ]
