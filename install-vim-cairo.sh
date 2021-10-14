if [ ! -f ~/.vim/autoload/plug.vim ]; then curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; else echo "plug.vim already exists - skipping"; fi
if [ ! -f ~/.vim/syntax/cairo.vim ]; then curl -fLo ~/.vim/syntax/cairo.vim --create-dirs https://raw.githubusercontent.com/starkware-libs/cairo-lang/master/src/starkware/cairo/lang/ide/vim/syntax/cairo.vim; else echo "cairo.vim already exists - skipping"; fi
if [ ! -f ~/.vim/cairo-ls/cairo-ls-0.0.7.vsix ]; then curl -fLo ~/.vim/cairo-ls/cairo-ls-0.0.7.vsix --create-dirs https://github.com/ericglau/cairo-ls/releases/download/v0.0.7/cairo-ls-0.0.7.vsix; else echo "cairo-ls-0.0.7.vsix already exists - skipping"; fi
rm -rf vscode-cairo
unzip -d vscode-cairo ~/.vim/cairo-ls/cairo-ls-0.0.7.vsix
mkdir ~/.vim/cairo-ls
cp -R vscode-cairo/extension/server ~/.vim/cairo-ls
rm -rf vscode-cairo
cp -n .vimrc ~/.vimrc
retVal=$?
vim +PlugInstall +qall
if [ $retVal -ne 0 ]; then
    echo "The ~/.vimrc file already exists and will not be overwritten. Manually edit its configuration according to https://github.com/ericglau/vim-cairo/blob/master/.vimrc"
    echo "Vim Cairo LS has been installed, but the ~/.vimrc file must be manually configured."
else
    echo "Vim Cairo LS has been successfully installed!"
fi