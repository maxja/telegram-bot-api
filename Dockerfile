FROM gcc:13 as builder

RUN set -ex; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    cmake \
    gperf;

WORKDIR /tmp

RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git; \
  cd telegram-bot-api; \
  mkdir build; cd build; \
  cmake -DCMAKE_BUILD_TYPE=Release ".."; \
  cmake --build . --target install

