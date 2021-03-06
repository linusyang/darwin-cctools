#ifndef _EMU_LIBC_H_
#define _EMU_LIBC_H_

#include <sys/file.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <time.h>
#include <unistd.h>

#define EBADRPC 1072
#define EFTYPE 1079

#include <sys/cdefs.h>
#include <config.h>

__BEGIN_DECLS

#ifndef HAVE_STRMODE
void strmode(int mode, char *p);
#endif

#ifndef HAVE_STRLCPY
size_t strlcpy(char * dst, const char * src, size_t siz);
#endif

#ifndef HAVE_STRLCAT
size_t strlcat(char * dst, const char * src, size_t siz);
#endif

#ifdef QSORT_R_IS_GNU
void qsort_r_bsd (void * base, size_t nmemb, size_t size,
	void *arg, int (*compar) (void *, const void *, const void *));
#define qsort_r qsort_r_bsd
#endif

__END_DECLS

#endif
