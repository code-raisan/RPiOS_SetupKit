# RaspberryPi OS Automatic Setup Kit

RaspberryPi OSインストール後に最低限必要な設定を自動的に行います

## Run

```sh
curl https://raw.githubusercontent.com/code-raisan/RPiOS_SetupKit/main/setupkit.sh | sudo bash
```

## イーサーネットコンバーター セットアップキット
```sh
curl https://raw.githubusercontent.com/code-raisan/RPiOS_SetupKit/main/wifi-bridge_setupkit.sh | sudo bash
```

`/etc/rc.local` に追加

```
sudo ifconfig eth0 192.168.4.1
iptables-restore < /etc/iptables.ipv4.nat
```
