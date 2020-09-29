#/bin/sh

disablePkgsList="
./feeds/lienol/package/chinadns-ng 
./feeds/lienol/package/ipt2socks 
./feeds/lienol/others/luci-app-kcptun 
./feeds/lienol/lienol/luci-app-ssr-python-pro-server 
./package/lean/luci-app-kodexplorer 
./package/lean/luci-lib-docker 
./package/lean/luci-app-dockerman 
./package/lean/kcptun 
./package/lean/luci-theme-argon 
./package/lean/v2ray 
./package/lean/v2ray-plugin 
./feeds/packages/net/miniupnpd 
./feeds/packages/net/mwan3 
./feeds/packages/utils/ttyd 
./feeds/packages/utils/docker-ce 
./feeds/packages/utils/containerd 
./feeds/packages/utils/libnetwork 
./feeds/packages/utils/tini 
./feeds/packages/net/dnscrypt-proxy2 
./feeds/packages/net/https-dns-proxy 
./feeds/packages/net/kcptun 
./feeds/packages/net/smartdns 
./package/network/services/dropbear 
./feeds/luci/applications/luci-app-upnp 
./feeds/luci/applications/luci-app-sqm
"

function disableDulicatedPkg()
{
	if [ -d $1 ];then
		rm -rf $1
		echo $1" Disabled."
	fi
}

./scripts/feeds update -a

for disablePkg in $disablePkgsList
do
	disableDulicatedPkg $disablePkg
done

./scripts/feeds update -i
./scripts/feeds install -a

if [ ! -f .config ];then
cp defconfig .config
echo "Default .config created."
fi
