cmake_minimum_required(VERSION 3.14)

project(ServiceDetails)

add_library(ServiceDetails STATIC serviceInformation.cpp serviceInformation.h serviceInterface.h)
find_package(Qt5 5.2 COMPONENTS Quick Gui REQUIRED)
find_package(Qt5 REQUIRED COMPONENTS Sql)
target_link_libraries(ServiceDetails PRIVATE Qt5::Gui Qt5::Quick)
target_link_libraries(ServiceDetails PRIVATE Qt5::Sql)