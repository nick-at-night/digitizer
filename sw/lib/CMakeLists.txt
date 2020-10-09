add_library(Digitizer SHARED digitizer.c)
target_include_directories(Digitizer PUBLIC ${PROJECT_SOURCE_DIR}/include)
