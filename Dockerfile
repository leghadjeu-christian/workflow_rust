FROM rust:alpine AS build

WORKDIR /app

COPY . .

RUN apk add musl-dev

RUN cargo build --release

FROM alpine:latest

WORKDIR /app

RUN apk add libgcc

COPY --from=build /app/target/release/workflow_rust /app/workflow_rust

ENTRYPOINT [ "/app/workflow_rust" ]
