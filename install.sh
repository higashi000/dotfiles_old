#!/bin/sh

`mv .fishrc ~/`

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

echo -n "Are you need Neovim and dein settings?(y/n): "
read _needNeovimSettings
case $_needNeovimSettings in
  [y] | '' )
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    break;;
  [n])
    break;;
esac

`mv nvim ~/.config/`
echo "source ~/.fishrc" >> ~/.config/fish/config.fish
