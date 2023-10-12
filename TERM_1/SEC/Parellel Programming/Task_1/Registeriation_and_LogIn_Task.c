#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct User_Data
{
    char userName[50];
    char password[20];
    char name[50];
    int age;
    char phone[20];
}User;

void Signing_Up(User *userInfo)
{
    printf("\n\n\n <<<<<<<<<<<<<<<<<<<<< .................. Regestiration Form .................... >>>>>>>>>>>>>>>>>>>>>\n");
    printf("\nEnter Your Name: ");
    scanf("%s", userInfo->name);
    printf("_________________________________________________________\n");
    printf("\nEnter Your UserName: ");
    scanf("%s", userInfo->userName);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Password: ");
    scanf("%s", userInfo->password);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Age: ");
    scanf("%d", &userInfo->age);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Phone: ");
    scanf("%s", userInfo->phone);
    printf("_________________________________________________________\n");
    printf("\n<<<<<<<<<<<<<<<<<< ....................... User Named: %s with UserName: %s Registerated_In ..................... >>>>>>>>>>>>>>>>>>>>>>>>", userInfo->name, userInfo->userName);
    printf("\n_________________________________________________________\n\n\n");
}

void User_Info(User *currentUser)
{
    printf("\n<<<<<<<<<< ....... USER DATA ...... >>>>>>>>>>\n");
    printf("\n_________________________________________________________\n");
    printf("\nYour Name is : %s", currentUser->name);
    printf("\n_________________________________________________________\n");
    printf("\nYour Age is : %d", currentUser->age);
    printf("\n_________________________________________________________\n");
    printf("\nYour Phone is : %s", currentUser->phone);
    printf("\n_________________________________________________________\n\n\n");
}

void LogIn(struct User_Data *user)
{
    char user_Name[50];
    char password[20];
    char current_UserName[50];
    char current_Password[20];
    strcpy(current_UserName, user_Name);
    strcpy(current_Password, password);

    printf("\n\n\n <<<<<<<<<<<<<<<<<<<<< .................. LogIn Form .................... >>>>>>>>>>>>>>>>>>>>>\n");
    printf("\nEnter Your UserName: ");
    scanf("%s", &user_Name);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Password: ");
    scanf("%s", &password);
    printf("_________________________________________________________\n");
    
    if (strcmp(user_Name, current_UserName) == 1 && strcmp(password, current_Password) == 1)
    {
        printf("\nSuccessfull LogIn :-) ...... >>>>>>>>>>>>\n");
        printf("\n_________________________________________________________\n");
        User_Info(user);
        printf("\n_________________________________________________________\n");
    }
    else
    {
        printf("\n\n\n<<<<<<<<<<<<<<< .............Failed to LogIn please try Again ............. >>>>>>>>>>>>>>>>\n\n\n");
    }
}

int main(int argc, char const *argv[])
{
    User userHassan;
    Signing_Up(&userHassan);
    LogIn(&userHassan);
    // User_Info(&userHassan);
    return 0;
}