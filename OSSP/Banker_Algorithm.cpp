#include<bits/stdc++.h>
using namespace std;

int main()
 {
   int process,resource,i,j,instanc,k=0,count1=0,count2=0; //count,k variables are taken for counting purpose

   //printf("Enter No. of Process:");
   scanf("%d",&process);                            //Entering No. of Processes

   //printf("Enter No. of Resources:");
   scanf("%d",&resource);                       //No. of Resources
   int avail[resource],max[process][resource],allot[process][resource],need[process][resource],completed[process];

   for(i=0;i<process;i++)
   completed[i]=0;                             //Setting Flag for uncompleted Process

   //printf("Enter No. of Available Instances: ");

   for(i=0;i<resource;i++)
    {
     scanf("%d",&instanc);
     avail[i]=instanc;                        // Storing Available instances
    }
    //printf("Enter no.of instances already allocated to process of a resource:");
     for(i=0;i<process;i++)
     {
        //printf("\nFor P[%d]:",i);

        for(j=0;j<resource;j++)
         {
            scanf("%d",&instanc);
            allot[i][j]=instanc;
            need[i][j]=max[i][j]-allot[i][j];       //calculating Need of each process
         }
    }
    //printf("Enter Maximum No.of instances of resources that a Process need:");
    for(i=0;i<process;i++)
     {
        //printf("For P[%d]",i);

        for(j=0;j<resource;j++)
         {
            scanf("%d",&instanc);
            max[i][j]=instanc;
         }
     }
    printf("Safe Sequence is:");

    while(count1!=process)
    {
    count2=count1;

    for(i=0;i<process;i++)
     {

       for(j=0;j<resource;j++)
        {
            if(need[i][j]<=avail[j])
              {
                 k++;
              }

        }
        if(k==resource && completed[i]==0 )
         {
           printf("P[%d]\t",i);

           completed[i]=1;

           for(j=0;j<resource;j++)
             {

               avail[j]=avail[j]+allot[i][j];

             }
             count1++;

         }
         k=0;
       }

         if(count1==count2)
         {
         printf("Stop ..After this.....Deadlock \n");

         break;
       }
 }
}

//5
//3
//
//10 5 7
//
//0 1 0
//2 0 0
//3 0 2
//2 1 1
//0 0 2
//
//7 5 3
//3 2 2
//9 0 2
//2 2 2
//4 3 3


