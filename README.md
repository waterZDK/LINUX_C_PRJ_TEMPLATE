# 工程目录结构说明
```bash    
├── build.sh                    # 自动化构建脚本
├── CMakeLists.txt              # 顶层CMakeLists.txt
├── README.md                   # 工程说明
├── .vscode                     # VSCode配置文件
│   ├── launch.json             # 调试配置（需要根据实际情况修改）
│   └── tasks.json              # 编译配置（需要根据实际情况修改）
├── config                      # 程序配置文件，编译完成后这里面的所有文件会被移动到可执行文件所在目录
│   └── example_config.ini      # 示例配置文件
├── src                         # 源代码目录
│   ├── app                     # 主函数
│   │   ├── CMakeLists.txt      # 可执行文件构建CMakeLists.txt
│   │   ├── main.c
│   │   └── main.h
│   ├── modules                 # 功能模块
│   │   ├── submodule_a         # 示例功能模块A
│   │   │   ├── CMakeLists.txt  # 功能模块构建CMakeLists.txt
│   │   │   ├── submodule_a.c
│   │   │   └── submodule_a.h
│   │   └── submodule_b         # 示例功能模块A
│   │       ├── CMakeLists.txt  # 功能模块构建CMakeLists.txt
│   │       ├── submodule_b.c
│   │       └── submodule_b.h
│   └── third_party             # 第三方组件代码
│       ├── third_party_a       # 示例第三方组件A
│       │   ├── CMakeLists.txt  # 第三方组件构建CMakeLists.txt
│       │   ├── third_party_a.c
│       │   └── third_party_a.h
│       └── third_party_b       # 示例第三方组件A
│           ├── CMakeLists.txt  # 第三方组件构建CMakeLists.txt
│           ├── third_party_b.c
│           └── third_party_b.h
└── toolchain                   # 交叉编译工具链配置目录
    └── arm-linux.cmake         # 用于arm交叉编译的配置示例
```

# 构建说明
## 使用build.sh脚本（推荐）
**使用前先使用chmod给脚本添加可执行权限**，如下为常用脚本指令示例：
```bash
# 使用指定的工具链执行全新构建，构建调试用固件
./build.sh -b Debug -t ./toolchain/arm-linux.cmake rebuild

# 使用指定的工具链执行全新构建，构建发布用固件
./build.sh -b Release -t ./toolchain/arm-linux.cmake rebuild

# 使用指定的工具链执行构建，构建调试用固件
./build.sh -b Debug -t ./toolchain/arm-linux.cmake build

# 使用指定的工具链执行构建，构建发布用固件
./build.sh -b Release -t ./toolchain/arm-linux.cmake build

```

## 使用命令行
```bash
# 编译调试版本
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=../toolchain/arm-linux.cmake
```
```bash
# 编译调发布版本
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../toolchain/arm-linux.cmake
```
