cmake_minimum_required(VERSION 3.5)

project(TelegramBotApi VERSION 7.1.0 LANGUAGES CXX)

set(BUILD_SHARED_LIBS OFF)
set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})

add_subdirectory(./telegram-bot-api)
