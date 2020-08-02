%{
package main
import (
	"fmt"
)
%}

%union {
  s string
  /*expr *Expr*/
}

%token RPAREN
%token LPAREN

%token IDENTIFIER
%token STRING
%token NUMBER
%token CONSTANT

%left '+' '-'
%left '*' '/'
%%

program : /* empty */
       | program  list

sexpr: atom                        {fmt.Printf("matched sexpr\n");}
       | list                      {fmt.Printf("matched list \n");}
       ;
list: LPAREN sexprs RPAREN         {fmt.Printf("matched (sexprs) \n");}
       | LPAREN RPAREN             {fmt.Printf("matched empty list ()\n");}
       ;
sexprs: sexpr                      {fmt.Printf("sexpr \n");}
       | sexpr sexprs              {fmt.Printf("sexpr sexprs \n");}
       ;
atom: IDENTIFIER                   {fmt.Printf("IDENTIFIER\n");}
       | NUMBER                    {fmt.Printf("NUMBER\n");}
       | STRING                    {fmt.Printf("STRING\n");}
       ;
%%
