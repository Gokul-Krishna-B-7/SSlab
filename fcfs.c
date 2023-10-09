// C program to demonstrate FCFS Disk Scheduling algorithm
#include <stdio.h>
#include <math.h>
 
int size = 8;
 
void fcfs(int arr[],int size,int head)
{
    int seek_count = 0;
      int cur_track, distance;
   
    for(int i=0;i<size;i++)
       {
        cur_track = arr[i];
       
          // calculate absolute distance
        distance = fabs(head - cur_track);
       
          // increase the total count
        seek_count += distance;
       
          // accessed track is now new head
        head = cur_track;
    }
   
    printf("Total number of seek operations: %d\n",seek_count);
       
      // Seek sequence would be the same
    // as request array sequence
    printf("Seek Sequence is\n");
   
      for (int i = 0; i < size; i++) {
        printf("%d\n",arr[i]);
    }
}
 
void main()
{
 int n,i,head;
 int t[50];
 printf("Enter the number of tracks:");
 scanf("%d",&n);
 printf("Enter the head pointer position:");
 scanf("%d",&head);
 printf("Enter the tracks to be traversed:");
 for(i=0;i<n;i++)
    scanf("%d",&t[i]);
 fcfs(t,n,head);
}
