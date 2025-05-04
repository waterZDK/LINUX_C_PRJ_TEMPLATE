#!/bin/bash

BUILD_TYPE="Debug"
TOOLCHAIN_FILE=""

# 参数解析
while [[ $# -gt 0 ]]; do
  case "$1" in
    -b)
      BUILD_TYPE="$2"
      shift 2
      ;;
    -t)
      TOOLCHAIN_FILE=$(realpath "$2")
      if [[ ! -f "$TOOLCHAIN_FILE" ]]; then
        echo "错误：工具链文件不存在 - $TOOLCHAIN_FILE"
        exit 1
      fi
      shift 2
      ;;
    clean|rebuild|build)
      ACTION="$1"
      shift
      break  # 子命令之后的参数不再处理
      ;;
    *)
      echo "未知参数: $1"
      exit 1
      ;;
  esac
done

# 验证构建类型
if [[ "$BUILD_TYPE" != "Debug" && "$BUILD_TYPE" != "Release" ]]; then
  echo "错误：无效的构建类型 '$BUILD_TYPE'，必须是 Debug 或 Release"
  exit 1
fi

# 执行动作
case "$ACTION" in
  clean)
    rm -rf build
    echo "构建目录已清理"
    ;;

  rebuild)
    rm -rf build
    echo "执行全量重建 ($BUILD_TYPE)"
    mkdir -p build && cd build || exit 1
    CMAKE_ARGS="-DCMAKE_BUILD_TYPE=$BUILD_TYPE"
    [[ -n "$TOOLCHAIN_FILE" ]] && CMAKE_ARGS+=" -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE"
    cmake .. $CMAKE_ARGS && make -j$(nproc)
    cd ..
    ;;

  build)
    echo "执行构建 ($BUILD_TYPE)"
    mkdir -p build && cd build || exit 1
    CMAKE_ARGS="-DCMAKE_BUILD_TYPE=$BUILD_TYPE"
    [[ -n "$TOOLCHAIN_FILE" ]] && CMAKE_ARGS+=" -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE"
    cmake .. $CMAKE_ARGS && make -j$(nproc)
    cd ..
    ;;

  *)
    echo "用法："
    echo "  $0 clean                         清理构建目录"
    echo "  $0 [-b Debug|Release] rebuild    清理并构建"
    echo "  $0 [-b Debug|Release] build       执行构建"
    echo "  $0 [-t toolchain.cmake] build    使用自定义工具链构建"
    exit 1
    ;;
esac