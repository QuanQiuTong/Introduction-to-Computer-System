#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

team_t team =
    {
        "QuanQiuTong",
        "Quantong Fu",
        "22307110118@m.fudan.edu.cn",
        "",
        ""};

// #define MAX_HEAP (20 << 20)

// static char *mem_heap;
// static char *mem_brk;
// static char *mem_max_addr;

#define WSIZE 4
#define DSIZE 8
#define CHUNKSIZE (1 << 12)

#define MAX(x, y) ((x) > (y) ? (x) : (y))

#define PACK(size, alloc) ((size) | (alloc))

#define GET(p) (*(unsigned *)(p))
#define PUT(p, val) (*(unsigned *)(p) = (val))

#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

#define HDRP(bp) ((char *)(bp)-WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE((char *)(bp)-WSIZE))
#define PREV_BLKP(bp) ((char *)(bp)-GET_SIZE((char *)(bp)-DSIZE))

void *heap_listp;
static void *extend_heap(size_t words);
static void *coalesce(void *bp);
static void *find_fit(size_t asize);
static void place(void *bp, size_t asize);
int mm_init()
{
    if ((heap_listp = mem_sbrk(4 * WSIZE)) == (void *)-1)
        return -1;
    PUT(heap_listp, 0);
    PUT(heap_listp + (1 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (2 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (3 * WSIZE), PACK(0, 1));
    heap_listp += (2 * WSIZE);

    if (extend_heap(CHUNKSIZE / WSIZE) == NULL)
        return -1;
    return 0;
}
static void *extend_heap(size_t words)
{
    char *bp;
    size_t size = (words + (words & 1)) * WSIZE;
    if ((long)(bp = mem_sbrk(size)) == -1)
        return NULL;

    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1));
    return coalesce(bp);
}

void mm_free(void *bp)
{
    size_t size = GET_SIZE(HDRP(bp));

    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    coalesce(bp);
}
static void *coalesce(void *bp)
{
    size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp))),
           next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp))),
           size = GET_SIZE(HDRP(bp));

    if (prev_alloc && next_alloc)
        return bp;
    else if (prev_alloc && !next_alloc)
        size += GET_SIZE(HDRP(NEXT_BLKP(bp))),
            PUT(HDRP(bp), PACK(size, 0)),
            PUT(FTRP(bp), PACK(size, 0));
    else if (!prev_alloc && next_alloc)
        size += GET_SIZE(HDRP(PREV_BLKP(bp))),
            PUT(FTRP(bp), PACK(size, 0)),
            PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0)),
            bp = PREV_BLKP(bp);
    else
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) + GET_SIZE(FTRP(NEXT_BLKP(bp))),
            PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0)),
            PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0)),
            bp = PREV_BLKP(bp);
    return bp;
}
void *mm_malloc(size_t size)
{
    if (!size)
        return NULL;
    size_t asize = size <= DSIZE ? 2 * DSIZE : DSIZE * ((size + (DSIZE) + (DSIZE - 1)) / DSIZE);

    char *bp = find_fit(asize);
    if (bp)
    {
        place(bp, asize);
        return bp;
    }

    size_t extendsize = MAX(asize, CHUNKSIZE);
    if ((bp = extend_heap(extendsize / WSIZE)))
        place(bp, asize);
    return bp;
}
/* find_fit -- find the first fit free block */
static void *find_fit(size_t asize)
{
	void* p;

	for (p = heap_listp; GET_SIZE(HDRP(p)) > 0; p = NEXT_BLKP(p)) {
		if (!GET_ALLOC(HDRP(p)) && (asize <= GET_SIZE(HDRP(p))))
			return p;
	}
	
	return NULL;
}

/* place when remaining part size is greater than 2 word, divide it. */
static void place(void *bp, size_t asize)
{
	size_t size = GET_SIZE(HDRP(bp));
	if (size - asize >= 2*WSIZE) {
		PUT(HDRP(bp), PACK(asize, 1));
		PUT(FTRP(bp), PACK(asize, 1));
		bp = NEXT_BLKP(bp);
		PUT(HDRP(bp), PACK(size-asize, 0));
		PUT(FTRP(bp), PACK(size-asize, 0));
	} else {
		PUT(HDRP(bp), PACK(size, 1));
		PUT(FTRP(bp), PACK(size, 1));
	}
}
void *mm_realloc(void *ptr, size_t size)
{
    void *oldptr = ptr;
    void *newptr;
	void *nextptr;

	size_t blockSize;
    size_t extendsize;
	size_t asize;	/* Adjusted block size */
	size_t sizesum;
	
	if (ptr == NULL) { 			/* If ptr == NULL, call mm_alloc(size) */
		return mm_malloc(size);
	} else if (size == 0) { 	/* If size == 0, call mm_free(size) */
		mm_free(ptr);
		return NULL;
	}

	/* Adjust block size to include overhead and alignment reqs. */
	if (size <= DSIZE)
   		asize = 2*DSIZE;
   	else 
   		asize = DSIZE * ((size + (DSIZE) + (DSIZE-1)) / DSIZE);
	
	blockSize = GET_SIZE(HDRP(ptr));

	
	if (asize == blockSize) {						/* Case 1: asize == block size, nothing to do.  */
		return ptr;
	} else if (asize < blockSize) {					/* Case 2: asize < blockSize, */
		place(ptr, asize);
		return ptr;
	} else {										/* Case 3: asize > blockSize */
		/* Check next block */
		nextptr = NEXT_BLKP(ptr);
		sizesum = GET_SIZE(HDRP(nextptr))+blockSize;	/* Sum of this and next block size */
		if (!GET_ALLOC(HDRP(nextptr)) && sizesum >= asize) {	/* Next block is free and size is big enough. */
			/* Coalesce two block by set this block size be sizesum. */
			PUT(HDRP(ptr), PACK(sizesum, 0));
			place(ptr, asize);
			return ptr;
		} else {		/* Next block is allocated or size is not enough. */
			newptr = find_fit(asize);
			if (newptr == NULL) {
				extendsize = MAX(asize, CHUNKSIZE);
				if ((newptr = extend_heap(extendsize/WSIZE)) == NULL) {	/* Can not find a fit block, it must allocate memory from heap. */
					return NULL;
				}
			}
			place(newptr, asize);
			memcpy(newptr, oldptr, blockSize-2*WSIZE);
			mm_free(oldptr);
			return newptr;
		}
	}

}
