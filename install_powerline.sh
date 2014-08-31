#!/usr/bin/env bash

MACHINE_TYPE=$(uname -a | cut -d " " -f 1)


function err_handle()
{
    echo "[Error] $1 "&& exit 0
}

function linux_install_pip()
{
    echo "Install python-pip... on Linux"
    sudo apt-get install python-pip
    if [ "$?" -ne 0 ]; then
        err_handle "The process of install package pip failed!"
    fi
}

function mac_install_pip()
{
    echo "Install python-pip... on Mac"
    sudo port select python python27-apple
    curl -O https://bootstrap.pypa.io/get-pip.py
    sudo python get-pip.py
    if [ "$?" -ne 0 ]; then
        err_handle "The process of install package pip failed!"
    fi
}

function install_pip()
{
    if [ "$MACHINE_TYPE" = "Linux" ]; then
        linux_install_pip
    elif [ "$MACHINE_TYPE" = "Darwin" ]; then
        mac_install_pip
    else
        err_handle "Unknow Machine type $MACHINE_TYPE"
    fi
}

function linux_fontconfig()
{
    echo "Download powerline symbol file"
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    echo "Setting PowerlineSymbol"
    mkdir -p ~/.fonts && mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/ &&\
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
}

function mac_config()
{
    echo "Should surf on the powerline project on github to\
        download your favorite patched font ,then click it to\
        install "
}


function fontconfig()
{
     if [ "$MACHINE_TYPE" = "Linux" ]; then
        linux_fontconfig
     elif [ "$MACHINE_TYPE" = "Darwin" ]; then
        mac_fontconfig
    fi

}
echo "Check requirement package..."
which pip > /dev/null

if [ "$?" -eq 0  ]; then
    echo "python-pip package installed"
else
    echo "python-pip package not installed yet"
    install_pip
fi

echo "pip install --user git+git://github.com/Lokaltog/powerline"
pip install --user git+git://github.com/Lokaltog/powerline

echo "Get into fontconfig phase"
fontconfig
echo "Then, finished"




