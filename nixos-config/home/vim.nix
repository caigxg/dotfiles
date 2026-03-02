{ pkgs, ...}:{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      papercolor-theme
      vim-airline-themes
      vim-startify
    ];

    settings = {
      ignorecase = true;
    };

    extraConfig = ''
      set mouse=a
      "键配置
      nnoremap <silent> <A-e> :w \| so %<CR>
      nnoremap <silent> <C-l> :nohl<CR>
      nnoremap <A-q> :q<CR>
      vnoremap <C-c> y

      autocmd InsertLeave * :silent !fcitx5-remote -c
      colorscheme PaperColor "主题配置
      set background=dark "主题颜色
      set laststatus=2
      set nu
      syntax on
      filetype plugin indent on "自动识别文件类型，用文件类型脚本，使用缩进定义文件
      set clipboard=unnamedplus
      set nocompatible
      set cursorline
      set history=100
      set smartindent "智能对齐
      set autoindent "自动对齐
      "搜索逐字符高亮
      set hlsearch
      set incsearch
      set nowrapscan "搜索时不循环搜索
      set showmatch
      set matchtime=5 "对应括号高亮的时间（单位是十分之一秒）

      "统一缩进为4
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4

      set expandtab "用空格代替制表符
      " 设置光标样式
      if &term =~ 'xterm-kitty'
          let &t_SI = "\e[6 q" " 插入模式光标为竖线
          let &t_EI = "\e[2 q" " 正常模式光标为块
      endif
    '';
  };
}
