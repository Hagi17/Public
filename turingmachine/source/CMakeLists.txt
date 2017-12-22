cmake_minimum_required(VERSION 3.9)
project(source)

set(CMAKE_CXX_STANDARD 11)

add_executable(source
        state.h
        support.h
        tape.h
        tmsim.cpp
        transition.h
        turingmachine.h)
