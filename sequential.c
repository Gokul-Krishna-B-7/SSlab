#include<stdio.h>
void main()
{
 int f[50]={0},i,b,len,j,flag,st,wish,allo[10];
 do{
 printf("\nEnter the length of the file:");
 scanf("%d",&len);
 printf("\nEnter the starting block of the file:");
 scanf("%d",&st);
 flag=0;
 for(i=st;i<st+len;i++)
  if(f[i]!=0)
  {
   flag=1;
   printf("\nBlock is already being used.");
   break;
  }
  if(flag==0)
  {
   for(i=0,j=st;j<st+len;j++,i++)
   {
    f[j]=1;
    allo[i]=j;
   }
   printf("\nFile is allocated");
   printf("\nAllocated blocks are:");
   for(i=0;i<len;i++)
      printf(" %d ",allo[i]);
  }
  printf("\nDo you wish to continue?Yes(1) or no(0):");
  scanf("%d",&wish);
 }while(wish==1);
}
