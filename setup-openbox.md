# Setup openbox in debian

## Install netinstall distribution

Download the iso and install debian without or without selecting any
desktop or window manager.

## Set sources.list

```console
sudo sed -i 's/buster/stable/g' /etc/apt/sources.list
sudo sed -i 's/ main/ main contrib non-free/g' /etc/apt/sources.list

sudo apt-get update && \
sudo apt-get -y upgrade && \
sudo apt-get -y dist-upgrade && \
sudo apt-get -y autoremove
```

## Install the packages

```console
sudo apt-get -y install \
  dkms mc vim net-tools lightdm openbox menu obconf inxi vim-gtk \
  geany geany-plugins emacs tint2 nitrogen gtk-theme-switch \
  gtk2-engines light-locker tmux terminator git postgresql libpq-dev \
  python-pip mariadb-server build-essential \
  libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev \
  tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
  apt-transport-https ca-certificates curl gnupg-agent \
  software-properties-common gmrun vlc texlive-full liblzma-dev openvpn resolvconf
```

## Install docker

```console
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo adduser aricalso docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Install wifi

inxi is a program to get details of hardware.

```console
inxi -F
```

## Compile python

```console
version_27="2.7.17"
version_36="3.6.10"
version_37="3.7.7"
version_38="3.8.2"
cwd=$(pwd)

cd /tmp
rm -f Python-$version_27.tgz
wget https://www.python.org/ftp/python/$version_27/Python-$version_27.tgz
tar xvzf Python-$version_27.tgz
cd Python-$version_27
./configure --enable-optimizations
make -j 8
sudo make altinstall

cd /tmp
rm -f Python-$version_36.tgz
wget https://www.python.org/ftp/python/$version_36/Python-$version_36.tgz
tar xvzf Python-$version_36.tgz
cd Python-$version_36
./configure --enable-optimizations
make -j 8
sudo make altinstall

cd /tmp
rm -f Python-$version_37.tgz
wget https://www.python.org/ftp/python/$version_37/Python-$version_37.tgz
tar xvzf Python-$version_37.tgz
cd Python-$version_37
./configure --enable-optimizations
make -j 8
sudo make altinstall

cd /tmp
rm -f Python-$version_38.tgz
wget https://www.python.org/ftp/python/$version_38/Python-$version_38.tgz
tar xvzf Python-$version_38.tgz
cd Python-$version_38
./configure --enable-optimizations
make -j 8
sudo make altinstall

cd $cwd
```

## Virtualenvwrapper

```console
sudo pip install virtualenvwrapper

echo "export WORKON_HOME=\$HOME/venv" >> $HOME/.bashrc
echo "export PROJECT_HOME=$HOME/instances" >> $HOME/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> $HOME/.bashrc
```

## vimrc

```console
echo -e "set background=dark\nsyntax on\nset ruler\nset nu\nset nobackup\nfiletype on\ncolorscheme torte\nset nocompatible\nset showmatch" > $HOME/.vimrc
```
