FROM python:3.13.7-alpine3.21
RUN mkdir -p /app/state/users /app/state/rooms
ENV CHATTER_HOST=0.0.0.0
ENV CHATTER_PORT=80
ENV CHATTER_USERS_DIR=/app/state/users
COPY ./server /app/server
WORKDIR /app/state/rooms
STOPSIGNAL SIGINT
CMD [ "/app/server" ]
