#include<stdio.h>
#include<conio.h>
#include<windows.h>
void car(int x, int y);
void gotoxy(int x, int y);
void road();

/*left arrow: 37
up arrow: 38
right arrow: 39
down arrow: 40*/


main()
{
    char n;
    int i,j,k,x=0,y=8,score=0;
    printf("Score: %d",score);
    road();
    car(x,y);
    while(1)
    {
        n=getch();
        system("cls");
        gotoxy(0,0);
        printf("Score: %d",score);
        road();
        if(n==27) break;
        if(n==97)       //left
        {
            x=x-1;
            if(x<0)
            {
                x=79;
            }
            car(x,y);
        }
        else if(n==100)        //right
        {
            x=x+1;
            if(x>=80)
            {
                x=0;
            }
            car(x,y);
        }
        else if(n==119)      //up
        {
            y=y-1;
            if(y<=5)
            {
                printf("\a");
                score -=2;
                y=6;
            }
            car(x,y);
        }
        else if(n==115)      //down
        {
            y=y+1;
            if(y>=9)
            {
                printf("\a");
                score -=2;
                y=8;
            }
            car(x,y);
        }
        score++;
    }

}


void car(int x, int y)
{
    gotoxy(x,y);
    printf("  ***");
    gotoxy(x,y+1);
    printf("*******");
    gotoxy(x,y+2);
    printf("* *** *");
}

void gotoxy (int x, int y)
{
    COORD coord={0,0};
    coord.X = x; coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

void road()
{
    int i;
    gotoxy(0,5);
    for(i=0;i<80;i++) printf("*");

    gotoxy(0,11);
    for(i=0;i<80;i++) printf("*");

}

