**English** | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
*********************************************************
编译适配 中兴 E8822 路由器的openwrt.
在拆开E8822后,发现里面PCB标识是E8820V2.

在 github action 编译的时候，根据action的进度提示用ssh连接服务器修改文件.
在目录 v19.07.10的文件是编译 openwrt 版本v19.07.10 时用. (测试在本地编译并刷到路由器可以使用, 但在github action编译出现不明错误.)
在目录 openwrt-21.02中的文件是编译 分支openwrt-21.03 版本时用.(已经本地测试 r16881+1-4a1d8ef55c 通过了. )

详细使用方法参看  https://www.right.com.cn/forum/thread-506561-1-1.html

配置文件整理自:https://www.right.com.cn/forum/thread-506561-1-1.html

https://github.com/jacelift/lede17.01_jacelift

编译控制文件来自 https://github.com/P3TERX/Actions-OpenWrt.
openwrt 来自 https://github.com/openwrt/openwrt.

--------------------------------------------------------
openwrt版本v19.07.10使用步骤: (没有测试)

1. 下载openwrt: git clone https://github.com/openwrt/openwrt.git

2. 下载补丁文件: https://github.com/hiliuyj/E8822-openwrt.git

3. 打补丁： cd openwrt

		git apply ../E8822-openwrt/v19.07.10/e8820v2.patch

		cp  ../E8822-openwrt/v19.07.10/E8820V2.config  .config

4. 配置并编译

		./script/feeds update -a

		./script/feeds install  -a

		make menuconfig

		make defconfig

		make
		
--------------------------------------------------------
测试了 分支 openwrt-23.05,  没有无线,或者有2.4G或5G. 
测试了 分支 openwrt-22.03,  多次在web配置界面按扫描,启动无线按钮, 才出来无线.

*********************************************************
测试主要内容是: vlan设置与无线使用.
注意,openwrt版本v19.07.10 的vlan设置是 swconfig，而高版本是 DSA.

---------------------------------------------------------

# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

A template for building OpenWrt with GitHub Actions

## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository.
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Credits

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [Mattraks/delete-workflow-runs](https://github.com/Mattraks/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
