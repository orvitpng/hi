#include "64.S"

#define ARCH 183

// this is a hack. we are lucky this results in the value it does so that we can
// set the entry point to the fourth byte at an offset aligned with p_offset
#define ENTRY	0x14000000 | ((e_shoff - e_entry) >> 2)

.macro	sz
	.ascii	"Hello,"
	.space	2,	0
.endm

e_hdr:
E_IDENT(	mov	x0,		#1		;
		adr	x1,		p_memsz		;
		b	e_version			)
E_TYPE(							)
E_MACHINE(						)
E_VERSION(	mov	x2,		#256		)
E_ENTRY(	.quad	ENTRY				)
E_PHOFF(	.quad	p_type - e_hdr			)
E_SHOFF(	mov	x8,		#64		;
		svc	#0				)
E_FLAGS(	b	p_paddr				)
E_EHSIZE(	.space	2,		0		)
E_PHENTSIZE(						)
E_PHNUM(						)
E_SHENTSIZE(	.space	2,		0		)
P_TYPE(							)	// e_shnum
P_FLAGS(	.space	3,		0		)	// e_shstrndx
P_OFFSET(	.space	8,		0		)
P_VADDR(	.quad	ENTRY - 4			)
P_PADDR(	mov	x8,		#93		;
		svc	#0				)
P_FILESZ(	sz					)
P_MEMSZ(	sz					)
P_ALIGN(	.ascii	" world!\n"			)
