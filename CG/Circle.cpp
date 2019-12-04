#include<stdio.h>
#include<conio.h>
#include<graphics.h>
int main() {
   int gd = DETECT, gm;
   initgraph(&gd, &gm, "");
   circle(300, 300, 150);
   circle(300, 300, 2);
   line(300,300,370,370);
   line(300,300,300,350);

   getch();
   closegraph();
   return 0;
}
