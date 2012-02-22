" Vim syntax file
" Version:     0.1
" Maintainer:	 houqp <dave2008713@gmail.com> 
" Last Change: 2008 Sep 11, 12:53 Thu
" Remark:	
" from http://www.jukie.net/bart/blog/vim-and-linux-coding-style
" based on https://github.com/v0n/vim-addon-linux-coding-style
"

"@TODO checkout c-support/wordlist  18.02 2012


"if version < 600
	"syntax clear
"elseif exists("b:current_syntax")
	"finish
"endif

ru! syntax/c.vim

syn keyword cType		uint ubyte ulong boolean_t 
syn keyword cType		int8_t int16_t int32_t int64_t
syn keyword cType		uint8_t uint16_t uint32_t uint64_t
syn keyword cType		u_int8_t u_int16_t u_int32_t u_int64_t
syn keyword cType		u8 u16 u32 u64 s8 s16 s32 s64

syn keyword kernelKeyType	wait_queue_head_t atomic_t dev_t loff_t
syn keyword kernelKeyMacro	container_of
syn keyword kernelErrType	ERESTARTSYS


syn keyword kernelOperator	likely unlikely


syn keyword kernelModuleMacro	MKDEV MAJOR MINOR MODULE_LICENSE
syn keyword kernelModuleType	dev_t
syn keyword kernelModule	__init THIS_MODULE
syn keyword kernelModuleFunc	module_init module_exit

syn keyword kernelProcType	proc_dir_entry
syn keyword kernelProcFunc	create_proc_entry create_proc_read_entry remove_proc_entry

syn keyword kernelSeqType	start next stop show seq_operations
syn keyword kernelSeqFunc	seq_printf seq_open

syn keyword kernelSlabKey	GFP_KERNEL
syn keyword kernelSlabFunc	kmalloc kfree memset

syn keyword kernelConcurFunc	semaphore_init down_interruptible up down

syn keyword kernelIOType	KERN_WARNING
syn keyword kernelIOFunc	printk

syn keyword kernelChrDevFunc	register_chrdev_region alloc_chrdev_region cdev_init cdev_add unregister_chrdev_region

syn keyword kernelFileType	file_operations inode file
syn keyword kernelFileFunc	read llseek owner write ioctl open release fasync poll no_llseek



syn match ErrorLeadSpace /^ \+/         " highlight any leading spaces
syn match ErrorTailSpace / \+$/         " highlight any trailing spaces
syn match Error80       /\%>80v.\+/    " highlight anything past 80 in red

if has("gui_running")
	hi Error80        gui=NONE   guifg=#ffffff   guibg=#6e2e2e
	hi ErrorLeadSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
	hi ErrorTailSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
else
	hi Error80        cterm=NONE   ctermfg=White ctermbg=DarkRed
	hi ErrorLeadSpace cterm=NONE   ctermfg=White ctermbg=DarkRed
	hi ErrorTailSpace cterm=NONE   ctermfg=White ctermbg=DarkRed
endif


hi link cType Type
hi link kernelKeyType Type
hi link kernelModuleType Type
hi link kernelProcType Type
hi link kernelSeqType Type
hi link kernelFileType Type
hi link kernelIOType Type
hi link kernelErrType Type

hi link kernelSlabKey Keyword

hi link kernelModule Keyword
hi link kernelOperator Keyword

hi link kernelConcurFunc Function
hi link kernelSlabFunc Function
hi link kernelProcFunc Function
hi link kernelSeqFunc Function
hi link kernelIOFunc Function
hi link kernelModuleFunc Function
hi link kernelChrDevFunc Function
hi link kernelFileFunc Function

hi link kernelModuleMacro Function
hi link kernelKeyMacro Function
