# ctrlp-z
This [CtrlP][4] extension allows you to change the CWD and to open files using [fasd][3] and [NERDTree][5]

![img][6]

## Install
If you use [Vundle][1] you can install this plugin using Vim command `:BundleInstall amiorin/ctrlp-z`.
Don't forget put a line `Bundle 'amiorin/ctrlp-z'` in your `.vimrc`.

If you use [Pathogen][2], you just execute following:

    cd ~/.vim/bundle
    git https://github.com/amiorin/ctrlp-z.git

If you don't use either plugin management system, copy `autoload` and `plugin` directory to your `.vim` directory.

\*nix: $HOME/.vim
Windows: $HOME/vimfiles

## Configuration
To enable the integration with [NERDTree][5]:

    let g:ctrlp_z_nerdtree = 1

To make this plugin available at startup instead of `autoload-functions`:

    let g:ctrlp_extensions = ['Z', 'F']

Commands available:

    :CtrlPZ
    :CtrlPF

It might be useful like these mappings:

    nnoremap <Space>pz :CtrlPZ<Cr>
    nnoremap <Space>pf :CtrlPF<Cr>

Inside CtrlP use `<C-r>` to toggle between the string mode and full regexp mode.

## Link
* [kien/ctrlp.vim][4]
* [scrooloose/nerdtree][5]

## License
Copyright (C) 2013 Alberto Miorin. Distributed under the MIT License.

[1]: https://github.com/gmarik/vundle.git
[2]: https://github.com/tpope/vim-pathogen
[3]: https://github.com/clvv/fasd
[4]: https://github.com/kien/ctrlp.vim
[5]: https://github.com/scrooloose/nerdtree
[6]: https://pbs.twimg.com/media/BE1bIabCUAA3ItF.png:large
