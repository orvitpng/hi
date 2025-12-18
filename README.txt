hi
==

Have you ever wanted to build the smallet "Hello, world!" possible*? Well..
here you are!

*=it might not actually be the smallest possible, but it would be close**
**=im not sure how close it is, its the best I could do at least

---------------------------------------------------------------------------

Be wary of using `qemu-user` to emulate these. QEMU (and likely any other form
of user-mode emulation) uses its own loaders which, while matching
specifications, do not allow for many of the hacks used in this project to
optimize for size. Your best bet is full operating system emulation.
