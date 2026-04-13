cmake_minimum_required(VERSION 3.4.1)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-z,common-page-size=16384 -Wl,-z,max-page-size=16384")

file(GLOB_RECURSE cppPaths "../ios/Stockfish/src/*.cpp")
add_library(
  stockfish
  SHARED
  ../ios/FlutterStockfish/ffi.cpp
  ${cppPaths}
)

file(DOWNLOAD https://tests.stockfishchess.org/api/nn/nn-82215d0fd0df.nnue ${CMAKE_BINARY_DIR}/nn-82215d0fd0df.nnue)
