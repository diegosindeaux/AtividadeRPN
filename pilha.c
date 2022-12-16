#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define SIZE 200

typedef struct Stack {
    int top;
    float data[SIZE];
}Stack;

void push(Stack *stack, char *token);
float pop(Stack *stack);
void push(Stack *stack, char *token){
    stack->top++;
    stack->data[stack->top] = atof(token);
}

float pop(Stack *stack){
    return stack->data[stack->top--];
}

int main (int argc, char *argv[]){
    char express[SIZE];
    Stack stack;
    stack.top = -1;
    char num[10];

    printf("Expressão: \n");
    scanf("%[^\n]s", express);

    char *token = strtok(express, " ");

    while (token != NULL){
        if(isdigit(*token)){
            push(&stack, token);
        }
        else {
            float num1 = pop(&stack);
            float num2 = pop(&stack);
            switch (*token) {
                case '+':
                {
                    sprintf(num, "%.2f", num1 + num2);
                    break;
                }
                case '-':
                {
                    sprintf(num, "%.2f", num1 - num2);
                    break;
                }
                case '*':
                {
                    sprintf(num, "%.2f", num1 * num2);
                    break;
                }
                case '/':
                {
                    sprintf(num, "%.2f", num2 / num1);
                    break;
                }
            }
            push(&stack, num);
        }
        token = strtok(NULL, " ");
    }
    printf("resultado: %.2f\n", pop(&stack));
}
