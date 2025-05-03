# src/third_party/third_party_a/CMakeLists.txt

# 模块名称
set(MODULE_NAME third_party_a)

# 此模块的源文件
set(MODULE_SOURCE
    third_party_a.c
)

# 定义模块名称和类型（静态库）
add_library(${MODULE_NAME} STATIC ${MODULE_SOURCE})

# 声明依赖的其他模块或第三方库（有需要时取消注释）
# target_link_libraries(${MODULE_NAME} PRIVATE
#     protocol  # 假设 protocol 是另一个模块的名称
# )

# 声明模块的对外头文件目录
target_include_directories(${MODULE_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)
