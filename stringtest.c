#include <stdio.h>
#include <string.h>

int main()
{
  char string[10] = "\0";
  
  printf("Enter smth: ");
  scanf("%s",string);
  
  int n = strlen(string);
  
  if(n > 8)
    printf("Too long!\n");
  else if(n< 8)
    printf("Too short\n");
  
  char password[6] = "Hello\0";
  char input[6];
  
  printf("Enter password: ");
  scanf("%s",input);
  
  input[5] = '\0';//we don't want to read somewhere else
  
  if(strcmp(input, password) == 0)
  {
    printf("Access Granted\n");
  }
  else
  {
    printf("Access Denied\n");
  }
  return 0;
}