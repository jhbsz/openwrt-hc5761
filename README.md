openwrt-hc5761
==============

OpenWrt Patch for HiWiFi HC6361 / HC5761 / HC5661 (base on trunk - chaos_calmer version)

极路由 HC6361 / HC5761 / HC5661（极壹、极贰、极壹S）OpenWrt补丁（基于trunk - chaos_calmer版本）

### 关于极贰
* 极贰官方产品页：http://www.hiwifi.com/j2
* 极贰购买页面：http://item.jd.com/1184730.html
* 图片展示：http://www.hiwifi.com/wp-content/themes/hi4/images/products/j2-p1.jpg

-------

### HC5761/HC5661 !OpenWrt补丁说明

#### 包含的功能
* MT7620A SoC板级支持;
* 2.4G Wi-Fi驱动支持;
* SD卡驱动支持;
* USB驱动支持;
* 注意：HC5761（极2）的5G Wi-Fi（MT7610E）驱动暂未有开源支持。

#### 编译好的固件下载
 * [2014/12/23] https://drive.google.com/file/d/0B4OfGJNugH2ETkY1WDNfc2x3eFU/   (备用地址：http://rssn.cn/openwrt-ramips-mt7620-hiwifi-hc5761-squashfs-sysupgrade.bin ）
  * 基于 OpenWrt trunk - r43594 编译；
  * 支持获取正确的MAC地址（HiWiFi bdinfo中的文本格式）；
  * 修正了板级支持中LAN口、WAN口布局配置；
  * 极1S、极2通用。

#### 固件编译方法

    git clone https://github.com/rssnsj/openwrt-hc5761.git -b chaos_calmer openwrt-hc5761-cc
    cd openwrt-hc5761-cc
    make

#### 说明
* 以上svn目录包含了HC5761的!OpenWrt补丁，checkout下来代码直接make，会自动打补丁、自动配置menuconfig，并自动编译；
* 编译时若碰到代码包下载失败，或下载过于缓慢，请先 Ctrl + C 暂停，手动下载同名的文件放到 openwrt-ramips/dl 下面，再执行“make”继续编译；
* openwrt-ramips-mt7620a-hiwifi-hc5761-squashfs-sysupgrade.bin 是sysupgrade格式的固件，传到路由器的/tmp下，通过串口登录极2/极1S，执行以下命令刷入：

    `sysupgrade -F -n openwrt-ramips-mt7620a-hiwifi-hc5761-squashfs-sysupgrade.bin`

* 本编译方法同时会在recovery.bin目录下生成 openwrt-HC5761-recovery.bin、openwrt-HC5661-recovery.bin 两个文件，分别是极2、极1S的带u-boot固件，u-boot解锁后可用TFTP刷机。

