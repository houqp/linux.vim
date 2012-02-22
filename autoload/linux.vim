function! linux#isInLinuxKernelCoding()
	if !exists("b:inLinuxKernel")
		let b:inLinuxKernel = 0
		return 0
	elseif b:inLinuxKernel == 0
		return 0
	else
		return 1
	endif
endfunction

function! linux#toggleKernelCoding()
	if &ft == 'c'
		call linux#toggleKernelCoding_c()
	elseif &ft == 'diff'
		call linux#toggleKernelCoding_diff()
	elseif &ft == 'linux'
		execute "call linux#toggleKernelCoding_".b:ft_bak."()"
	else
		echo "Not supported filetype!"
	endif
endfunction

function! linux#toggleKernelCoding_c()
	if linux#isInLinuxKernelCoding() 
		"restore previous settings
		let &filetype = b:ft_bak

		let &expandtab = b:expandtab_bak

		let &tabstop = b:tabstop_bak
		let &shiftwidth = b:shiftwidth_bak
		let &textwidth = b:textwidth_bak

		let &autoindent = b:autoindent_bak
		let &smartindent = b:smartindent_bak
		let &smarttab = b:smarttab_bak
		let &backspace = b:backspace_bak

		let &formatoptions = b:formatoptions_bak
		let &cinoptions = b:cinoptions_bak

		let &tags = b:tags_bak
	else	" not in linux kernel coding mode, trun it on
		let b:inLinuxKernel = 1

		let b:ft_bak = &ft
		set filetype=linux

		let b:expandtab_bak = &expandtab
		set noexpandtab                         " use tabs, not spaces

		let b:tabstop_bak = &tabstop
		set tabstop=8                           " tabstops of 8
		let b:shiftwidth_bak = &shiftwidth
		set shiftwidth=8                        " indents of 8
		let b:textwidth_bak = &textwidth
		set textwidth=78                        " screen in 80 columns wide, wrap at 78

		let b:autoindent_bak = &autoindent
		let b:smartindent_bak = &smartindent
		set autoindent smartindent              " turn on auto/smart indenting
		let b:smarttab_bak = &smarttab
		set smarttab                            " make <tab> and <backspace> smarter
		let b:backspace_bak = &backspace
		set backspace=eol,start,indent          " allow backspacing over indent, eol, & start

		"deal with text in code
		let b:formatoptions_bak = &formatoptions
		set formatoptions=tcqlron
		" indent parts of the code
		let b:cinoptions_bak = &cinoptions
		set cinoptions=:0,l1,t0,g0

		"tags
		let $kernel_version=system('uname -r | tr -d "\n"')
		let b:tags_bak = &tags
		"@TODO should we also add old tags settings here?   22.02 2012
		set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,
				\/lib/modules/$kernel_version/build/tags,/usr/include/tags
	endif
endfunction


function! linux#toggleKernelCoding_diff()
	if linux#isInLinuxKernelCoding()
		let &tabstop = b:tabstop_bak
	else	" not in linux kernel coding mode, trun it on
		let b:inLinuxKernel = 1
		let b:tabstop_bak = &tabstop
		set tabstop=8
	endif
endfunction



