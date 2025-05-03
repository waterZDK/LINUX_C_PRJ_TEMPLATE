# 配置平台信息
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# 指定编译器的sysroot路径 
set(TOOLCHAIN_DIR "/opt/fsl-imx-x11/4.1.15-2.1.0/sysroots")
set(CMAKE_SYSROOT ${TOOLCHAIN_DIR}/cortexa7hf-neon-poky-linux-gnueabi) 

# 指定交叉编译器arm-linux-gcc和arm-linux-g++ 
set(CMAKE_C_COMPILER ${TOOLCHAIN_DIR}/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_DIR}/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++)

# 为编译器添加编译选项 
set(CMAKE_C_FLAGS "-march=armv7ve -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a7") 
set(CMAKE_CXX_FLAGS "-march=armv7ve -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a7") 

# 搜索规则调整
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# 配置生成compile_commands.json，用于clangd插件（可选）
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
