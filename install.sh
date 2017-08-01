#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

pushd $DIR

# Backup existing configuration
if [ -e ~/.vimrc ]; then
    if [ -e ~/.vimrc.old ]; then
        rm ~/.vimrc.old
    fi
    mv ~/.vimrc ~/.vimrc.old
fi

if [ -e ~/.vim ]; then
    if [ -e ~/.vim.old ]; then
        rm -Rf ~/.vim.old
    fi
    mv ~/.vim ~/.vim.old
fi

mkdir -p ${HOME}/.vim/undodir
mkdir -p ${HOME}/.vim/autoload

ln -sf ${HOME}/.vim/.vimrc ${VIMRC} 

cp -R ./colors ~/.vim

# Install junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# Install YouCompleteMe
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev

pushd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --gocode-completer --clang-completer
popd

# Install TernJS
sudo apt-get install -y nodejs npm
pushd ~/.vim/bundle/tern_for_vim/
npm install
popd

# Fix for NerdTree. If we try to open but the file is already opened, 
# just jump to the that instead of opening it twice.
cp override_tab_mapping.vim ~/.vim/bundle/nerdtree/nerdtree_plugin/


# PowerFonts for PowerLine
pushd /tmp
git clone https://github.com/powerline/powerline.git
pushd powerline
sudo setup.py install

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
popd
popd

popd
