
#include<stdio.h>
#include<conio.h>
#include<graphics.h>
int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");

    //setfillstyle(SOLID_FILL,GREEN);
    line(500,200, 600,300);
    line(500,200, 400,300);
    line(400,300, 600,300);
    //floodfill(400,300,WHITE);
    line(500,250, 600,350);
    line(500,250, 400,350);
    line(400,350, 600,350);
    getch();
    closegraph();
   return 0;
}
