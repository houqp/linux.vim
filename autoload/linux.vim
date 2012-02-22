
func! linux#setKernelCoding()
	set filetype=linux

	set noexpandtab                         " use tabs, not spaces
	set tabstop=8                           " tabstops of 8
	set shiftwidth=8                        " indents of 8
	set textwidth=78                        " screen in 80 columns wide, wrap at 78

	set autoindent smartindent              " turn on auto/smart indenting
	set smarttab                            " make <tab> and <backspace> smarter
	set backspace=eol,start,indent          " allow backspacing over indent, eol, & start

	"deal with text in code
	set formatoptions=tcqlron
	" indent parts of the code
	set cinoptions=:0,l1,t0,g0

	"tags
	let $kernel_version=system('uname -r | tr -d "\n"')
	set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,/lib/modules/$kernel_version/build/tags,/usr/include/tags
endf


"diff
"set tabstop=8
