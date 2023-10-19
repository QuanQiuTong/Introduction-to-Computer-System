#define MYDEBUG
#include "queue.c"
#undef MYDEBUG
#include <stdio.h>
int main0() { // passed.
    queue_t *q = queue_new();
    printf("%p %p\n", q->head, q->tail);
    queue_insert_head(q, "Alice");
    printf("%p %p\n", q->head, q->tail);
    queue_insert_head(q, "Bob");
    printf("%p %p\n", q->head, q->tail);
    // q -> "Bob" -> "Alice"

    puts(q->head->value);
    puts(q->head->next->value);
    printf("size: %zu\n\n", queue_size(q));

    {
        char buf[100];
        bool f = queue_remove_head(q, buf, 100);
        // q -> "Alice"
        puts(buf);
        puts(q->head->value);
        printf("size: %zu %d\n\n", queue_size(q), (int)f);
    }
    {
        char buf[100];
        bool f = queue_remove_head(q, buf, 100);
        // q -> NULL
        puts(buf);
        printf("%p\n", q->head);
        printf("size: %zu %d\n\n", queue_size(q), (int)f);
    }

    {
        char s[100];
        for (int i = 0; i < 10; ++i)
            sprintf(s, "No. %d", i), queue_insert_head(q, s);

        printf("head %s, tail %s\n", q->head->value, q->tail->value);
        for (list_ele_t *p = q->head; p; p = p->next)
            puts(p->value);

        queue_reverse(q);

        printf("head %s, tail %s\n", q->head->value, q->tail->value);
        for (list_ele_t *p = q->head; p; p = p->next)
            puts(p->value);

        printf("size: %zu\n", queue_size(q));
        queue_free(q), q = NULL;
        printf("size: %zu\n", queue_size(q));
    }
}
int main1() { //passed after modification
    queue_t *q = queue_new();
    queue_insert_tail(q, "Alice");
    puts("*");
    queue_insert_tail(q, "Bob");
    // q -> "Alice" -> "Bob"

    puts(q->head->value);
    puts(q->head->next->value);

    char buf[100];
    queue_remove_head(q, buf, 100);
    // q -> "Alice"
    puts(buf);

    queue_remove_head(q, buf, 100);
    // q -> NULL
    puts(buf);
    queue_free(q);
}
int main2(){

}
int main() {
    main2();
}