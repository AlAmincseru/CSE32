#include<stdio.h>
#include<conio.h>
#include<graphics.h>
int main() {
   int gd = DETECT, gm;
   initgraph(&gd, &gm, "");
   line(100, 200, 500, 200);
   line(300, 050, 500, 200);
   line(300, 050, 100, 200);

   line(100, 200, 500, 200);
   line(500, 200, 500, 400);
   line(500, 400, 100, 400);
   line(100, 400, 100, 200);

   circle(300, 300, 075);
   getch();
   closegraph();
   return 0;
}

