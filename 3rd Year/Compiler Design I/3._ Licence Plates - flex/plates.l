%{

%}
NEW_YEAR [1-9]{2}[12]
NEW_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW

NUMBER [1-9][0-9]{0,5}
WHITESPACE [\n|\s|\t| ]*

OLD_YEAR [0-9]{2}
OLD_COUNTY C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW
%%

{WHITESPACE}{NEW_YEAR}\-{NEW_COUNTY}\-{NUMBER}{WHITESPACE} {
  int year = yytext[1] - '0';
  int years_since_reg = 9-year;
  printf("%d\n", years_since_reg);
}

{WHITESPACE}{OLD_YEAR}\-{OLD_COUNTY}\-{NUMBER}{WHITESPACE} {
    char temp[2];
    strncpy(temp, yytext, 2);
    int year = atoi(temp);
    int years_since_reg = 0;

    if(year > 86){
        years_since_reg = (100 - year) + 19;
    }
    else {
        years_since_reg = 19 - year;
    }

    printf("%d\n", years_since_reg);
}

{WHITESPACE}.*{WHITESPACE} { printf("INVALID\n"); }

%%

main(int argc, char **argv)
{
    yylex();
    return 0;
}