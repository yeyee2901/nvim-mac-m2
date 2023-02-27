" jangan load file ini kalau vim-test belum ada
if !exists("g:loaded_test")
	finish
endif

" supaya bisa masuk qf list
let test#strategy = "neovim"

" GOLANG CONFIGS ================================================
" 'gotest' / 'ginkgo' / 'richgo' / 'delve'
let test#go#runner = 'richgo'
let test#go#gotest#options = '-v -count=1'
let test#go#richgo#options = '-v -count=1'
