# src/app/CMakeLists.txt

# 配置 config 文件的源目录和目标目录
set(CONFIG_SOURCE_DIR ${CMAKE_SOURCE_DIR}/config)
set(CONFIG_OUTPUT_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

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

# 创建配置文件输出目录
file(MAKE_DIRECTORY ${CONFIG_OUTPUT_DIR})

# 定义编译后执行的指令
add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CONFIG_SOURCE_DIR} ${CONFIG_OUTPUT_DIR}
    COMMENT "Copying config files to build/output"
)
