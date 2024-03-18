#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

team_t team = {
    /* Team name */
    "ateam",
    /* First member's full name */
    "Yujun Wang",
    /* First member's email address */
    "22307110126@m.fudan.edu.cn",
    /* Second member's full name (leave blank if none) */
    "Quantong Fu",
    /* Second member's email address (leave blank if none) */
    "22307110118@m.fudan.edu.cn"
};
#define WSIZE 4
#define DSIZE 8
#define CHUNKSIZE (1 << 12)

#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define MIN(x, y) ((x) < (y) ? (x) : (y))

#define PACK(size, alloc) ((size) | (alloc))

#define GET(p) (*(unsigned *)(p))
#define PUT(p, val) (*(unsigned *)(p) = (val))

#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

#define GET_PTR_VAL(p) (*(unsigned long *)(p))
#define SET_PTR(p, ptr) (*(unsigned long *)(p) = (unsigned long)(ptr))

#define GET_PRED(p) ((char *)(*(unsigned long *)(p)))
#define GET_SUCC(p) ((char *)(*(unsigned long *)(p + DSIZE)))
#define SET_PRED(p, ptr) (SET_PTR((char *)(p), ptr))
#define SET_SUCC(p, ptr) (SET_PTR(((char *)(p) + (DSIZE)), ptr))

#define HDRP(bp) ((char *)(bp)-WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE((char *)(bp)-WSIZE))
#define PREV_BLKP(bp) ((char *)(bp)-GET_SIZE((char *)(bp)-DSIZE))

static char *free_list_headp;
static char *free_list_tailp;
static void *extend_heap(size_t words);
static void *coalesce(void *bp);
static void *find_fit(size_t asize);
static void place(void *bp, size_t asize);

int mm_init(void)
{
	if ((free_list_headp = mem_sbrk(4 * WSIZE + 3 * DSIZE)) == (void *)-1)
		return -1;
	PUT(free_list_headp, PACK(0, 0));				 /* Padding - for alignment 8 bytes */
	PUT(free_list_headp + WSIZE, PACK(24, 1));		 /* Prologue header */
	free_list_headp += DSIZE;						 /* free list head ptr */
	free_list_tailp = NEXT_BLKP(free_list_headp);	 /* free list tail ptr */
	SET_PRED(free_list_headp, NULL);				 /* Prologue pred */
	SET_SUCC(free_list_headp, free_list_tailp);		 /* Prologue succ */
	PUT(free_list_headp + (2 * DSIZE), PACK(24, 1)); /* Prologue footer */

	PUT(HDRP(free_list_tailp), PACK(0, 1));		/* Epilogue header */
	SET_PRED(free_list_tailp, free_list_headp); /* Epilogue pred */
	PUT(free_list_tailp + DSIZE, PACK(0, 0));	/* Padding - for alignment 8 bytes */
	return extend_heap(CHUNKSIZE / WSIZE) ? 0 : -1;
}

static void *extend_heap(size_t words)
{
	size_t size = (words + words % 2) * WSIZE;
	char *bp = mem_sbrk(size);
	if ((long)bp == -1)
		return NULL;

	char *ptr = free_list_tailp;
	PUT(HDRP(ptr), PACK(size, 0));	  /* Free block header */
	PUT(FTRP(ptr), PACK(size, 0));	  /* Free block footer */
	free_list_tailp = NEXT_BLKP(ptr); /* Update free list tailp */
	SET_SUCC(ptr, free_list_tailp);	  /* Update free list */

	PUT(HDRP(free_list_tailp), PACK(0, 1));
	SET_PRED(free_list_tailp, ptr);
	PUT(free_list_tailp + DSIZE, PACK(0, 0));
	return coalesce(ptr);
}

void mm_free(void *ptr)
{
	size_t size = GET_SIZE(HDRP(ptr));

	for (char *p = GET_SUCC(free_list_headp);; p = GET_SUCC(p))
		if (ptr < (void *)p)
		{
			PUT(HDRP(ptr), PACK(size, 0));
			PUT(FTRP(ptr), PACK(size, 0));
			SET_SUCC(ptr, p);
			SET_PRED(ptr, GET_PRED(p));

			SET_SUCC(GET_PRED(p), ptr);
			SET_PRED(p, ptr);
			break;
		}

	coalesce(ptr);
}

static void *coalesce(void *ptr)
{
	size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(ptr)));
	size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
	size_t size = GET_SIZE(HDRP(ptr));

	void *prevptr = PREV_BLKP(ptr);
	void *nextptr = NEXT_BLKP(ptr);
	if (prev_alloc && next_alloc)
		return ptr;
	else if (prev_alloc && !next_alloc)
	{
		size += GET_SIZE(HDRP(nextptr));
		SET_SUCC(ptr, GET_SUCC(nextptr));
		SET_PRED(GET_SUCC(nextptr), ptr);
		PUT(HDRP(ptr), PACK(size, 0));
		PUT(FTRP(nextptr), PACK(size, 0));
	}
	else if (!prev_alloc && next_alloc)
	{
		size += GET_SIZE(FTRP(prevptr));
		SET_SUCC(prevptr, GET_SUCC(ptr));
		SET_PRED(GET_SUCC(ptr), prevptr);
		PUT(HDRP(prevptr), PACK(size, 0));
		PUT(FTRP(ptr), PACK(size, 0));
		ptr = prevptr;
	}
	else // if (!prev_alloc && !next_alloc)
	{
		size += GET_SIZE(HDRP(prevptr)) + GET_SIZE(FTRP(nextptr));
		SET_SUCC(prevptr, GET_SUCC(nextptr));
		SET_PRED(GET_SUCC(nextptr), prevptr);
		PUT(HDRP(prevptr), PACK(size, 0));
		PUT(FTRP(nextptr), PACK(size, 0));
		ptr = prevptr;
	}
	return ptr;
}

void *mm_malloc(size_t size)
{
	if (size == 0)
		return NULL;

	size_t asize = size <= 2 * DSIZE ? 3 * DSIZE : DSIZE * ((size + (DSIZE) + (DSIZE - 1)) / DSIZE);
	char *bp = find_fit(asize);
	if (bp)
		return place(bp, asize), bp;

	size_t extendsize = MAX(asize, CHUNKSIZE);
	if ((bp = extend_heap(extendsize / WSIZE)))
		place(bp, asize);
	return bp;
}

static void *find_fit(size_t asize)
{
	for (void *p = GET_SUCC(free_list_headp); p != free_list_tailp; p = GET_SUCC(p))
		if (asize <= GET_SIZE(HDRP(p)))
			return p;
	return NULL;
}

static void place(void *bp, size_t asize)
{
	size_t size = GET_SIZE(HDRP(bp));
	if (size - asize >= 3 * DSIZE)
	{
		PUT(HDRP(bp), PACK(asize, 1));
		PUT(FTRP(bp), PACK(asize, 1));
		char *ptr = NEXT_BLKP(bp);

		SET_SUCC(ptr, GET_SUCC(bp));
		SET_PRED(ptr, GET_PRED(bp));

		SET_SUCC(GET_PRED(ptr), ptr);
		SET_PRED(GET_SUCC(ptr), ptr);

		PUT(HDRP(ptr), PACK(size - asize, 0));
		PUT(FTRP(ptr), PACK(size - asize, 0));
	}
	else
	{
		PUT(HDRP(bp), PACK(size, 1));
		PUT(FTRP(bp), PACK(size, 1));

		SET_SUCC(GET_PRED(bp), GET_SUCC(bp));
		SET_PRED(GET_SUCC(bp), GET_PRED(bp));
	}
}

void *mm_realloc(void *ptr, size_t size)
{
	void *oldptr = ptr;
	void *pred;
	void *succ;

	size_t extendsize;

	if (ptr == NULL)
		return mm_malloc(size);
	if (size == 0)
		return mm_free(ptr), NULL;

	size_t asize = size <= 2 * DSIZE ? 3 * DSIZE : DSIZE * ((size + (DSIZE) + (DSIZE - 1)) / DSIZE);
	size_t blockSize = GET_SIZE(HDRP(ptr));
	if (asize == blockSize)
		return ptr;
	else if (asize < blockSize)
	{
		if (blockSize - asize >= 3 * DSIZE)
		{
			PUT(HDRP(ptr), PACK(asize, 1));
			PUT(FTRP(ptr), PACK(asize, 1));

			void *nextptr = NEXT_BLKP(ptr);
			PUT(HDRP(nextptr), PACK(blockSize - asize, 0));
			PUT(FTRP(nextptr), PACK(blockSize - asize, 0));
			for (char *p = GET_SUCC(free_list_headp);; p = GET_SUCC(p))
				if (nextptr < (void *)p)
				{
					pred = GET_PRED(p);
					succ = p;
					SET_PRED(nextptr, pred);
					SET_SUCC(nextptr, succ);
					SET_SUCC(pred, nextptr);
					SET_PRED(p, nextptr);
					break;
				}
		}
		return ptr;
	}
	else
	{
		void *nextptr = NEXT_BLKP(ptr), *prevptr = PREV_BLKP(ptr);
		size_t sizesum = GET_SIZE(HDRP(nextptr)) + blockSize, /* Sum of this and next block size */
               prevsizesum = GET_SIZE(HDRP(prevptr)) + blockSize;
		if (!GET_ALLOC(HDRP(nextptr)) && sizesum >= asize)
		{ /* Next block is free and size is big enough. */
			/* Change free list */
			pred = GET_PRED(nextptr);
			succ = GET_SUCC(nextptr);
			if (sizesum - asize >= 3 * DSIZE)
			{
				PUT(HDRP(ptr), PACK(asize, 1));
				PUT(FTRP(ptr), PACK(asize, 1));
				/* Set next block header, footer and pred, succ and insert it into free list. */
				nextptr = NEXT_BLKP(ptr);
				PUT(HDRP(nextptr), PACK(sizesum - asize, 0));
				PUT(FTRP(nextptr), PACK(sizesum - asize, 0));
				/* Insert into free list. */
				SET_PRED(nextptr, pred);
				SET_SUCC(nextptr, succ);
				SET_SUCC(pred, nextptr);
				SET_PRED(succ, nextptr);
			}
			else
			{
				PUT(HDRP(ptr), PACK(sizesum, 1));
				PUT(FTRP(ptr), PACK(sizesum, 1));
				/* delete next free block out of free list. */
				SET_SUCC(pred, succ);
				SET_PRED(succ, pred);
			}
			return ptr;
		}
        else if (!GET_ALLOC(HDRP(prevptr)) && prevsizesum >= asize)
        {
			pred = GET_PRED(prevptr);
			succ = GET_SUCC(prevptr);
            
			// // memcpy(HDRP(prevptr), HDRP(ptr), blockSize - WSIZE);
			// // for (char *c = (char *)prevptr + blockSize - 2 * WSIZE; c != (char *)prevptr + asize - WSIZE; ++c)
			// // 	*c = 0;
			// if (sizesum - asize >= 3 * DSIZE) {
			// 	PUT(HDRP(prevptr), PACK(asize, 1));
			// 	PUT(FTRP(prevptr), PACK(asize, 1));
				
			// 	nextptr = NEXT_BLKP(prevptr);
			// 	PUT(HDRP(nextptr), PACK(sizesum - asize, 0));
			// 	PUT(FTRP(nextptr), PACK(sizesum - asize, 0));

			// 	SET_PRED(nextptr, pred);
			// 	SET_SUCC(nextptr, succ);
			// 	SET_SUCC(pred, nextptr);
			// 	SET_PRED(succ, nextptr);
			// } else {
			// 	PUT(HDRP(prevptr), PACK(sizesum, 1));
			// 	PUT(FTRP(prevptr), PACK(sizesum, 1));
			// 	// for (char *c = (char *)prevptr + asize - WSIZE; c != (char *)prevptr + sizesum; ++c)
			// 	// 	*c = 0;
			// 	SET_SUCC(pred, succ);
			// 	SET_PRED(succ, pred);
			// }

            // for (size_t i = 0; i < blockSize - 2 * WSIZE; ++i)
            //     *((char *)prevptr + i) = *((char *)ptr + i);
            // for (char *p = ptr; p < FTRP(ptr); ++p)
            //     *((char *)(prevptr + (p - (char *)ptr))) = *p;

			memmove(prevptr, ptr, blockSize - 2 * WSIZE);
            if (sizesum - asize >= 3 * DSIZE)
			{            
				PUT(HDRP(prevptr), PACK(asize, 1));
				// memcpy(prevptr, ptr, blockSize - 2 * WSIZE);
				PUT(FTRP(prevptr), PACK(asize, 1));
				// free(ptr);
				// PUT(FTRP(prevptr), PACK(asize, 1));
				/* Set next block header, footer and pred, succ and insert it into free list. */
				nextptr = NEXT_BLKP(prevptr);
				PUT(HDRP(nextptr), PACK(sizesum - asize, 0));
				PUT(FTRP(nextptr), PACK(sizesum - asize, 0));
				/* Insert into free list. */
				SET_PRED(nextptr, pred);
				SET_SUCC(nextptr, succ);
				SET_SUCC(pred, nextptr);
				SET_PRED(succ, nextptr);
			}
			else
			{
				PUT(HDRP(prevptr), PACK(sizesum, 1));
				// memcpy(prevptr, ptr, blockSize - 2 * WSIZE);
				PUT(FTRP(prevptr), PACK(sizesum, 1));
				// free(ptr);
				PUT(FTRP(prevptr), PACK(sizesum, 1));
				/* delete next free block out of free list. */
				SET_SUCC(pred, succ);
				SET_PRED(succ, pred);
			}
			// place(prevptr, asize);
			// mm_free(ptr);
			return prevptr;
        }
		else
		{
			void *newptr = find_fit(asize);
			if (newptr == NULL)
			{
				extendsize = MAX(asize, CHUNKSIZE);
				if ((newptr = extend_heap(extendsize / WSIZE)) == NULL)
					return NULL; /* Can not find a fit block, it must allocate memory from heap. */
			}
			place(newptr, asize);
			memcpy(newptr, oldptr, blockSize - 2 * WSIZE);
			mm_free(oldptr);
			return newptr;
		}
	}
}
