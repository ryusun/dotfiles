#/bin/bash

# var
vimrc=~/.vimrc
vimdir=~/.vim
vimbk=~/.backup


dots=~/dotfiles
manual_dir=$dot/vimfiles/refs

manual_php=$manual_dir/php_manual_ja.tar.gz

# create env
echo backup dotfiles

[ -d $vimrc ] && sudo mv $vimrc $vimrc.bak || exit -1
[ -d $vimdir ] && sudo mv $vimdir ${vimdir}_bak || exit -2

echo create symbolic link to dotfiles
ln -s $dots/vimfiles $vimdir
ln -s $dots/_vimrc $vimrc

echo make direcotry for vim backup
[ -d $vimbk ] && sudo mv $vimbk $vimbk.bak || sudo mkdir $vimbk

echo Prepare php manual. refs by vim.
[ -d $manual_dir/php_manual_ja ] && sudo tar -zxf $manual_php -C $manual_dir
sudo chmod 644 $manual_dir

exit 


