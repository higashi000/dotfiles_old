#!/bin/sh

mv .fishrc ~/
echo "source ~/.fishrc" >> ~/.config/fish/config.fish

echo -n "Are you need proxy settings?(y/n): "
read _needProxySettings
case $_needProxySettings in
  [y] | '' )
    echo -n "Please input your proxy adress: "
    read _yourProxy
    echo -n "Please input your SSID: "
    read _yourSSID
    echo "set _proxyAdress $_yourProxy" >> ~/.proxySetting
    echo "set _SSID $_yourSSID" >> ~/.proxySetting
    `cp .switch_proxy ~/`
    break;;

  [n] )
    break;;
esac

echo -n "Are you install dein.vim?(y/n): "
read _needDeinInstall
case $_needDeinInstall in
  [y] | '' )
    curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s "$HOME/.cache/dein"
    break;;
  [n] | * )
    break;;
esac


cp -rf ./nvim ~/.config/
