FROM gcc:13 as builder

RUN set -ex; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
  libssl-dev \
  zlib1g-dev \
  cmake \
  ninja-build \
  gperf;

COPY . /tmp/telegram

WORKDIR /tmp/telegram/build

RUN cmake -G "Ninja" ".."; \
  cmake --build . --config Release --target telegram-bot-api

