#include <stdio.h>
#include <stdlib.h>
#include <brickstring.h>

int main(int argc, char *argv[])
{
    if (argc == 1) {
        fprintf(stderr, "Brickdocs Error: Documentation file not provided to"
                        "brickdocs_add.c\n");
        exit(1);
    }

    check_arguments(argc, argv);
    FILE *fp = end_of_file();

    prompt_for_documentation(fp, argv[1]);
}

/* Program flow

    1. check argc and argv
    2. find the end of file

    3. query for documentation
        3.1) read function declaration (parse number of arguments)
        3.2) ask about each argument
        3.3) confirm answer, or edit
        3.4) ask about purpose
        3.5) ask about input state
        3.6) ask about output state

    4. ask to preview

    5. write documentation to docs file

*/
