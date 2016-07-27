#include<stdio.h>
#include<stdlib.h>
char t[16]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
void binary(int N)
{
int i=0,j;
char *a=(char*)malloc(32*sizeof(char));
char *b=(char*)malloc(32*sizeof(char));
char *c=(char*)malloc(32*sizeof(char));
int M=N;
while(M>0)
	{
		a[i]=t[M%2];
		M=M/2;
		i++;
	};
M=N;
int dem1=0;
while(M>0)				//he 8//
{
	b[dem1]=t[M%8];
	M=M/8;
	dem1++;
};
M=N;
int dem2=0;
while(M>0)			//he 16//
{
	c[dem2]=t[M%16];
	M=M/16;
	dem2++;
};
printf("nhi phan:");				//in ra he 2//
for(j=i-1;j>=0;j--)
printf("%c",a[j]);
free(a);
printf("\nhe bat phan:");		//in ra he 8//
for(j=dem1-1;j>=0;j--)
printf("%c",b[j]);
free(b);
printf("\nhe 16:");			//in ra he 16//
for(j=dem2-1;j>=0;j--)
printf("%c",c[j]);
free(c);
return;
}
int main()
{
	int N;
	printf("Nhap vao so tu nhien N=");
	scanf("%d",&N);
	binary(N);
	return 0;
}
