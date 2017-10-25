#include <stdio.h>

int flushInput()
{
  //based on the \n that occurs after an input
  int wrong_input = 0;
  char input_character = '\n';
  
  scanf("%c",&input_character);
  
  while(input_character != '\n' && input_character != EOF_CODE)
  {
    wrong_input = 1; 
    //any other character than \n or EOF appeared! -> wrong input
    scanf("%c",&input_character);
  }
  
  if(input_character == EOF_CODE)
  { 
    return EOF;
  }
  
  return wrong_input;
}

int main(void)
{
  int nr_of_octets = 0;

  do
  {
    printf("Please enter the number of octets: ");
  }
  while()
}