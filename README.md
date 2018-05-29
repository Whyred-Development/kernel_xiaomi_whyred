# Whyred-OSS

Stock kernel from Xiaomi's OOS with merged linux-stable upstream v4.4.133.

## Bugs that needs to be addressed
- ######  ̶W̶i̶F̶i̶ ̶(̶W̶i̶l̶l̶ ̶b̶e̶ ̶f̶i̶x̶e̶d̶ ̶s̶o̶o̶n̶!̶ ̶W̶I̶P̶)̶
- ###### Camera (Broken source by Xiaomi)
- ###### Torch (Broken source by Xiaomi)
- ###### Brightness (Stays bright even in low brightness, again by Xiaomi)

## Bugs addressed so far
- ###### WiFi

## How to compile with Clang?
- Assuming **_out_** is your output directory and **_whyred-perf_defconfig_** is your default defconfig
- `mkdir -p out`
- `make O=out clean`
- `make O=out mrproper`
- `make O=out ARCH=arm64 whyred-perf_defconfig`
- `make -j$(nproc --all) O=out ARCH=arm64 CC="<path_to_clang>/bin/clang" CLANG_TRIPLE="aarch64-linux-gnu-"  CROSS_COMPILE="<path_to_toolchain>/bin/aarch64-linux-android-"`

## Note
If you want to get rid of the long Google URL in the kernel version, then you need to add the following before compiling the kernel

```bash
export KBUILD_COMPILER_STRING=$(<path_to_clang_folder/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
```
## External Links

- ###### Nathan's guide on how to compile with clang: [Click here!](https://github.com/nathanchance/android-kernel-clang)
