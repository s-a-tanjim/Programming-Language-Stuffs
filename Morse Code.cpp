//Text to morse code converter...
#include<stdio.h>
#include<windows.h>

void code(char x);
void beep(char *x);

int main()
{
    int i;
    char x[5000];
    printf("Enter your text\n>>");
    gets(x);
    system("cls");
    printf("Morse code is:\n>> ");
    for(i=0;x[i]!='\0';i++)
    {
        code(x[i]);
    }
    printf("\n\n\n\n\t\t\tThank You!!!\n\n\n\n");
}


void code(char x)
{
    if(x=='a')      {char c[]=".-";     beep(c);}
    else if(x=='b') {char c[]="-...";   beep(c);}
    else if(x=='c') {char c[]="-.-.";   beep(c);}
    else if(x=='d') {char c[]="-..";    beep(c);}
    else if(x=='e') {char c[]=".";      beep(c);}
    else if(x=='f') {char c[]="..-.";   beep(c);}
    else if(x=='g') {char c[]="--.";    beep(c);}
    else if(x=='h') {char c[]="....";   beep(c);}
    else if(x=='i') {char c[]="..";     beep(c);}
    else if(x=='j') {char c[]=".---";   beep(c);}
    else if(x=='k') {char c[]="-.-";    beep(c);}
    else if(x=='l') {char c[]=".-..";   beep(c);}
    else if(x=='m') {char c[]="--";     beep(c);}
    else if(x=='n') {char c[]="-.";     beep(c);}
    else if(x=='o') {char c[]="---";    beep(c);}
    else if(x=='p') {char c[]=".--.";   beep(c);}
    else if(x=='q') {char c[]="--.-";   beep(c);}
    else if(x=='r') {char c[]=".-.";    beep(c);}
    else if(x=='s') {char c[]="...";    beep(c);}
    else if(x=='t') {char c[]="-";      beep(c);}
    else if(x=='u') {char c[]="..-";    beep(c);}
    else if(x=='v') {char c[]="...-";   beep(c);}
    else if(x=='w') {char c[]=".--";    beep(c);}
    else if(x=='x') {char c[]="-..-";   beep(c);}
    else if(x=='y') {char c[]="-.--";   beep(c);}
    else if(x=='z') {char c[]="--..";   beep(c);}
    //number
    else if(x=='0') {char c[]="-----";  beep(c);}
    else if(x=='1') {char c[]=".----";  beep(c);}
    else if(x=='2') {char c[]="..---";  beep(c);}
    else if(x=='3') {char c[]="...--";  beep(c);}
    else if(x=='4') {char c[]="....-";  beep(c);}
    else if(x=='5') {char c[]=".....";  beep(c);}
    else if(x=='6') {char c[]="-....";  beep(c);}
    else if(x=='7') {char c[]="--...";  beep(c);}
    else if(x=='8') {char c[]="---..";  beep(c);}
    else if(x=='9') {char c[]="----.";  beep(c);}
    else if(x==' ') {char c[]="    ";  beep(c);}
}


void beep(char *x)
{
    int i;
    for(i=0;x[i]!='\0';i++)
    {
        printf("%c",x[i]);
        if(x[i]=='.')
        {
            Beep(750, 400);
        }
        else if(x[i]=='-')
        {
            Beep(750, 900);
        }
        else if(x[i]==' ')  for(int j=0;j<2000;j++);
    }
}

