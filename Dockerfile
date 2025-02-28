FROM rust:alpine AS build

WORKDIR /app

COPY . .

RUN apk add musl-dev

RUN cargo build --release

FROM alpine:latest

WORKDIR /app

RUN apk add libgcc

COPY --from=build /app/target/release/myapp /app/myapp

ENTRYPOINT [ "/app/myapp" ]
