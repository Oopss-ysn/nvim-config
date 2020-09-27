"Enable/Disable deoplete at startup
"let g:deoplete#enable_at_startup = 0

packloadall
silent! helptags ALL


"Enable/Disable ale 
"let g:ale_enable = 1
"let g:ale_completion_enabled = 1
"let b:ale_fixers ={'javascript': ['eslint']}
"let b:ale_linters = {'javascript': ['flow','eslint','tsserver']}
"let g:ale_fix_on_save = 1
"let g:LanguageClient_serverCommands = {
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio']
"    \}
""set omnifunc=ale#completion#OmniFunc
"set omnifunc=syntaxcomplete#Complete
"set runtimepath+=~/.vim-plugins/languagecliente-neovim
"
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <F3> :tabprevious<CR>
nnoremap <silent> <F4> :tabnext<CR>






lua << END
	require'nvim_lsp'.elixirls.setup{
		cmd = { "/home/dev/.cache/nvim/nvim_lsp/elixirls/elixir-ls/language_server.sh" };
		on_attach=require'completion'.on_attach;
	}

	require'nvim_lsp'.flow.setup{
		on_attach=require'completion'.on_attach
	}
	
	require'nvim_lsp'.tsserver.setup{
		on_attach=require'completion'.on_attach;
	}
END


autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"set omnifunc=v:lua.vim.lsp.omnifunc
"set omnifunc=lsp#omnifunc

highlight Pmenu ctermfg=none  ctermbg= none guibg=none
"set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set nu

