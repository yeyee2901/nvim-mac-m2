" jangan load file ini kalau vim-test belum ada
if !exists("g:loaded_test")
	finish
endif

" supaya bisa masuk qf list
" let test#strategy = "neovim"	" split terminal below
let test#strategy = "basic"		" fullscreen

" do not clear screen
let g:test#preserve_screen = 1

" start in normal mode instead of insert mode
let g:test#neovim#start_normal = 1
let g:test#basic#start_normal = 1

" show test output only, no test command will be displayed
let g:test#echo_command = 0

" GOLANG CONFIGS ================================================
" 'gotest' / 'ginkgo' / 'richgo' / 'delve'
let test#go#runner = 'richgo'
let test#go#gotest#options = '-v -count=1'
let test#go#richgo#options = '-v -count=1'
