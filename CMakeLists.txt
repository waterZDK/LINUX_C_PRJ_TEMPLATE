# 编译所需cmake版本
cmake_minimum_required(VERSION 3.15)

# 工程名称与版本设置
project(LINUX_C_PRJ_TEMPLATE)

# 设置可执行文件的输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output)

# 可选：设置静态库和动态库的输出目录（若项目需要）
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/static)  # 静态库（.a）
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/)  # 动态库（.so）

# 设置交叉编译工具链
if(DEFINED CMAKE_TOOLCHAIN_FILE)
    message("Using toolchain file: ${CMAKE_TOOLCHAIN_FILE}")
else()
    message(WARNING "Using default host toolchain!")
endif()

# 通用编译选项
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror")
set(CMAKE_C_FLAGS_RELEASE "-Os")
set(CMAKE_C_FLAGS_DEBUG "-O0")

# 配置生成compile_commands.json，用于clangd插件（可选）
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# 添加各个子模块，编译时会自动调用每个子模块下的CMakeLists.txt把子模块的静态库编译出来
add_subdirectory(${PROJECT_SOURCE_DIR}/src/app)
add_subdirectory(${PROJECT_SOURCE_DIR}/src/modules/submodule_a)
add_subdirectory(${PROJECT_SOURCE_DIR}/src/modules/submodule_b)
add_subdirectory(${PROJECT_SOURCE_DIR}/src/third_party/third_party_a)
add_subdirectory(${PROJECT_SOURCE_DIR}/src/third_party/third_party_b)
