# src/app/CMakeLists.txt

# 创建可执行文件
add_executable(${PROJECT_NAME}
    main.c
)

# 链接所有依赖的模块
target_link_libraries(${PROJECT_NAME} PRIVATE
    submodule_a
    submodule_b
    third_party_a
    third_party_b
)

# 添加头文件
target_include_directories(${PROJECT_NAME} PRIVATE
    ${PROJECT_SOURCE_DIR}/app
)
