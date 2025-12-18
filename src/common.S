#include "helpers.S"

#define	ET_EXEC 2
#define PT_LOAD 1
#define PT_XR 5

#define E_IDENT(...)			e_ident:			\
	.byte				0x7f,	'E',	'L',	'F';	\
	SIZE_EQ(12, __VA_ARGS__)

#define E_TYPE()			e_type:				\
	.hword				ET_EXEC

#define E_MACHINE()			e_machine:			\
	.hword				ARCH

#define E_VERSION(...)			e_version:			\
	SIZE_EQ(4, __VA_ARGS__)

#define E_ENTRY(...)	e_entry:					\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define E_PHOFF(...)	e_phoff:					\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define E_SHOFF(...)	e_shoff:					\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define E_FLAGS(...)			e_flags:			\
	SIZE_EQ(4, __VA_ARGS__)

#define E_EHSIZE(...)			e_ehsize:			\
	SIZE_EQ(2, __VA_ARGS__)

#define E_PHENTSIZE()			e_phentsize:			\
	.hword				PH_SIZE

#define E_PHNUM()			e_phnum:			\
	.hword				1

#define E_SHENTSIZE(...)		e_shentsize:			\
	SIZE_EQ(2, __VA_ARGS__)

#define E_SHNUM(...)			e_shnum:			\
	SIZE_EQ(2, __VA_ARGS__)

#define E_SHSTRNDX(...)			e_shstrndx:			\
	SIZE_EQ(2, __VA_ARGS__)

#define P_TYPE()			p_type:				\
	.word				PT_LOAD

#define P_FLAGS(...)			p_flags:			\
	.byte				PT_XR;				\
	SIZE_EQ(3, __VA_ARGS__)

#define P_OFFSET(...)			p_offset:			\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define P_VADDR(...)			p_vaddr:			\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define P_PADDR(...)			p_paddr:			\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define P_FILESZ(...)			p_filesz:			\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define P_MEMSZ(...)			p_memsz:			\
	SIZE_EQ(SIZE, __VA_ARGS__)

#define P_ALIGN(...)			p_align:			\
	SIZE_EQ(SIZE, __VA_ARGS__)
