all:
	yacc -d pandas_parser.y
	lex pandas_parser.l
	gcc -w y.tab.c lex.yy.c -ly -ll -o pandas_parser

clean:
	rm -rf *.c
	rm -rf *.h
	rm -rf a.out
	rm -rf pandas_parser
	rm -rf *.gch
