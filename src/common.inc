#define CAT(a, b)	a##b
#define STR(a)		#a

#define SIZE_EQ(N, ...)	SIZE_EQ_(N, __COUNTER__, __VA_ARGS__)

#define SIZE_EQ_(N, C, ...)	CAT(_LSIZE_EQ_, C):	\
	__VA_ARGS__;					\
	.if		. - CAT(_LSIZE_, C) != N;	\
	.error		"SIZE_EQ mismatch";		\
	.endif
