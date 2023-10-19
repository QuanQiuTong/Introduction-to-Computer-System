/**
 * @file queue.c
 * @brief Implementation of a queue that supports FIFO and LIFO operations.
 *
 * This queue implementation uses a singly-linked list to represent the
 * queue elements. Each queue element stores a string value.
 *
 * Assignment for basic C skills diagnostic.
 * Developed for courses 15-213/18-213/15-513 by R. E. Bryant, 2017
 * Extended to store strings, 2018
 *
 * TODO: fill in your name and Andrew ID
 * @author XXX <XXX@andrew.cmu.edu>
 */

#include "queue.h"
#include "harness.h"

#include <stdlib.h>
#include <string.h>

static size_t min(size_t a, size_t b) {
    return a < b ? a : b;
}

/**
 * @brief Allocate a new element using a provided string
 * 
 * @param s The provided string
 * @return Pointer to the newly allocated element, or null if failed
*/
static list_ele_t *ele_new(const char *s) {
    list_ele_t *ele = malloc(sizeof(list_ele_t));
    if (ele) {
        if ((ele->value = malloc(strlen(s) + 1)))
            strcpy(ele->value, s), ele->next = NULL;
        else
            free(ele), ele = NULL;
    }
    return ele;
}

/**
 * @brief Free p properly
 *
 * @param p A valid pointer
 * @return p->next
 */
static list_ele_t *ele_free(list_ele_t *p) {
    list_ele_t *t = p->next;
    free(p->value), free(p);
    return t;
}

/**
 * @brief Allocates a new queue
 * @return The new queue, or NULL if memory allocation failed
 */
queue_t *queue_new(void) {
    return calloc(1, sizeof(queue_t)); /*q = NULL, or *q = {0}*/
}

/**
 * @brief Frees all memory used by a queue
 * @param[in] q The queue to free
 */
void queue_free(queue_t *q) {
    if (NULL == q)
        return;
    for (list_ele_t *p = q->head; p;)
        p = ele_free(p);
    memset(q, 0, sizeof *q); // in case someone tries to access q after freeed.
    free(q);                 // q should be set to 0 MANUALLY.
}

/**
 * @brief Attempts to insert an element at head of a queue
 *
 * This function explicitly allocates space to create a copy of `s`.
 * The inserted element points to a copy of `s`, instead of `s` itself.
 *
 * @param[in] q The queue to insert into
 * @param[in] s String to be copied and inserted into the queue
 *
 * @return true if insertion was successful
 * @return false if q is NULL, or memory allocation failed
 */
bool queue_insert_head(queue_t *q, const char *s) {
    if (NULL == q)
        return false;

    list_ele_t *newh = ele_new(s);
    if (NULL == newh)
        return false;

    if (q->head == NULL)
        q->tail = newh;
    newh->next = q->head;
    q->head = newh;
    q->size++;
    return true;
}

/**
 * @brief Attempts to insert an element at tail of a queue
 *
 * This function explicitly allocates space to create a copy of `s`.
 * The inserted element points to a copy of `s`, instead of `s` itself.
 *
 * @param[in] q The queue to insert into
 * @param[in] s String to be copied and inserted into the queue
 *
 * @return true if insertion was successful
 * @return false if q is NULL, or memory allocation failed
 */
bool queue_insert_tail(queue_t *q, const char *s) {
    if (NULL == q)
        return false;

    list_ele_t *newt = ele_new(s);
    if (NULL == newt)
        return false;

    if (q->tail)
        q->tail = q->tail->next = newt;
    else
        q->head = q->tail = newt;
    q->size++;
    return true;
}

/**
 * @brief Attempts to remove an element from head of a queue
 *
 * If removal succeeds, this function frees all memory used by the
 * removed list element and its string value before returning.
 *
 * If removal succeeds and `buf` is non-NULL, this function copies up to
 * `bufsize - 1` characters from the removed string into `buf`, and writes
 * a null terminator '\0' after the copied string.
 *
 * @param[in]  q       The queue to remove from
 * @param[out] buf     Output buffer to write a string value into
 * @param[in]  bufsize Size of the buffer `buf` points to
 *
 * @return true if removal succeeded
 * @return false if q is NULL or empty **BEFORE removal**
 */
bool queue_remove_head(queue_t *q, char *buf, size_t bufsize) {
    if (!q || !q->head)
        return false;

    if (buf && bufsize /*should be tested.*/) {
        size_t len = min(bufsize - 1, strlen(q->head->value));
        memcpy(buf, q->head->value, len);
        buf[len] = '\0';
    }
    if (q->head == q->tail)
        q->tail = NULL;
    q->head = ele_free(q->head);
    q->size--;
    return true; // Don't care if q->size is 0 after removal.
}

/**
 * @brief Returns the number of elements in a queue
 *
 * This function runs in O(1) time.
 *
 * @param[in] q The queue to examine
 *
 * @return the number of elements in the queue, or
 *         0 if q is NULL or empty
 */
size_t queue_size(queue_t *q) {
    return q ? q->size : 0;
}

/**
 * @brief Reverse the elements in a queue
 *
 * This function does not allocate or free any list elements, i.e. it does
 * not call malloc or free, including inside helper functions. Instead, it
 * rearranges the existing elements of the queue.
 *
 * @param[in] q The queue to reverse
 */
void queue_reverse(queue_t *q) {
    if (!q || !q->head)
        return;
    list_ele_t *pre = NULL, *cur = q->head;
    while (cur) {
        list_ele_t *tmp = cur->next;
        cur->next = pre, pre = cur, cur = tmp;
    }
    q->tail = q->head, q->head = pre;
}
