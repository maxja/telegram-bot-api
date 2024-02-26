FROM gcc:13 as builder

RUN set -ex; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
  libc-dev \
  libssl-dev \
  zlib1g-dev \
  cmake \
  ninja-build \
  gperf;

COPY . /tmp/telegram

WORKDIR /tmp/telegram/build

RUN cmake -G "Ninja" ".."; \
  cmake --build . --config Release --target telegram-bot-api

FROM scratch

COPY --from=0 /tmp/telegram/build/telegram-bot-api/telegram-bot-api /

ENTRYPOINT [ "/telegram-bot-api" ]
