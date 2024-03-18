/**
 * @author Fu Quantong (22307110118@m.fudan.edu.cn)
 */

#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include "cachelab.h"
typedef struct
{
    _Bool valid;
    int timestamp;
    size_t tag;
    char block[0];
} Line;
_Bool disp_trace_info = 0;
int s = 0, E = 0, b = 0, hit = 0, miss = 0, eviction = 0;
char *cache = NULL;
char *locate(size_t addr)
{
    static int timestamp = 0;
    size_t index = addr >> b & ((1ull << s) - 1), tag = addr >> (b + s);
    Line *group = (Line *)(cache + index * E * sizeof(Line));
    for (size_t i = 0; i < E; ++i)
        if (group[i].valid && group[i].tag == tag) // Hit
        {
            ++hit, disp_trace_info &&printf(" hit");
            group[i].timestamp = ++timestamp;
            return group[i].block + (addr & ((1ull << b) - 1));
        }

    // Miss
    ++miss, disp_trace_info &&printf(" miss");
    for (size_t i = 0; i < E; ++i)
        if (!group[i].valid)
        {
            group[i] = (Line){(_Bool)1, ++timestamp, tag};
            return group[i].block + (addr & ((1ull << b) - 1));
        }

    // Eviction
    ++eviction, disp_trace_info &&printf(" eviction");
    size_t idx = 0;
    for (size_t i = 1; i < E; ++i)
        if (group[i].timestamp < group[idx].timestamp)
            idx = i;
    group[idx] = (Line){(_Bool)1, ++timestamp, tag};
    return group[idx].block + (addr & ((1ull << b) - 1));
}

void usage()
{
    puts("Usage: ./csim-ref [-hv] -s <num> -E <num> -b <num> -t <file>");
    puts("Options:");
    puts("  -h         Print this help message.");
    puts("  -v         Optional verbose flag.");
    puts("  -s <num>   Number of set index bits.");
    puts("  -E <num>   Number of lines per set.");
    puts("  -b <num>   Number of block offset bits.");
    puts("  -t <file>  Trace file.\n");
    puts("Examples:");
    puts("  linux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace");
    puts("  linux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace");
}

int main(int argc, char **argv)
{
    FILE *fp = stdin;
    for (int optc;
         (optc = getopt(argc, argv, "hvs:E:b:t:")) != -1;)
        switch (optc)
        {
        case 'h':
            usage();
            return 0;
        case 'v':
            disp_trace_info = 1;
            break;
        case 's':
            s = atoi(optarg);
            break;
        case 'E':
            E = atoi(optarg);
            break;
        case 'b':
            b = atoi(optarg);
            break;
        case 't':
            if ((fp = fopen(optarg, "r")) == NULL)
                return printf("Cannot open file[%s].\n", optarg), 1;
            break;
        default:
            usage();
            return 1;
        }

    cache = calloc(1ull << s, E * sizeof(Line));//+ (1ull << b));

    char op;
    for (size_t addr, size;
         fscanf(fp, " %c %zx,%zx", &op, &addr, &size) != EOF;
         disp_trace_info ? puts("") : 0)
        switch (op)
        {
        case 'M':
            locate(addr);
        case 'L':
        case 'S':
            locate(addr);
            break;
        }

    free(cache);
    if (fp != stdin)
        fclose(fp);

    printSummary(hit, miss, eviction);
    return 0;
}
