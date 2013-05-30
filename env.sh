#/bin/bash

# var
vimrc=~/.vimrc
vimdir=~/.vim
vimbk=~/.backup


dots=~/dotfiles
manual_dir=$dots/vimfiles/refs

manual_php=$manual_dir/php_manual_ja.tar.gz

# create env
echo backup dotfiles
# 1 as already exists
[ -f $vimrc ] && sudo mv $vimrc $vimrc.bak 
ln -s $dots/_vimrc $vimrc

# 1 as already exists
[ -d $vimdir ] && sudo mv $vimdir ${vimdir}_bak 
ln -s $dots/vimfiles $vimdir

echo make direcotry for vim backup
[ -d $vimbk ] && sudo mv $vimbk $vimbk.bak 
sudo mkdir $vimbk

echo $manual_dir/php_manual_ja.tar

echo Prepare php manual. refs by vim.
[ -d $manual_dir/php_chunked-xhtml ] || sudo tar -zxf $manual_php -C $manual_dir
sudo chmod 644 $manual_dir

cd $dots
sudo git submodule update --init

own=`whoami`

sudo chown -R $own:$own $dots 

exit


