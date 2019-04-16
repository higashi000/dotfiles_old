#!/bin/sh

cp -f .fishrc ~/
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

echo -n "Are you need git settings?(y/n): "
read _needGitSettings
case $_needGitSettings in
  [y] | '' )
    echo -n "Please input your account email: "
    read _yourAccountEmail
    echo -n "Please input your account name: "
    read _yourAccountName

    git config --global user.name "$_yourAccountName"
    git config --global user.email "$_yourAccountEmail"
    break;;

  [n] )
    break;;
esac
