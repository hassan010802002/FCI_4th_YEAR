#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef union Authentication
{
    struct User_Data
    {
        int activeCode;
        char userName[50];
        char password[20];
        char name[50];
        int age;
        char phone[20];
    } User;
}AUTH;


void Signing_Up(AUTH *userInfo)
{
    printf("\n\n\n <<<<<<<<<<<<<<<<<<<<< .................. Regestiration Form .................... >>>>>>>>>>>>>>>>>>>>>\n");
    userInfo->User.activeCode = 1;
    printf("\nEnter Your Name: ");
    scanf("%s", userInfo->User.name);
    printf("_________________________________________________________\n");
    printf("\nEnter Your UserName: ");
    scanf("%s", userInfo->User.userName);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Password: ");
    scanf("%s", userInfo->User.password);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Age: ");
    scanf("%d", &userInfo->User.age);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Phone: ");
    scanf("%s", userInfo->User.phone);
    printf("_________________________________________________________\n");
    printf("\n<<<<<<<<<<<<<<<<<< ....................... User Named: %s with UserName: %s Registerated In with Code Status:%d ..................... >>>>>>>>>>>>>>>>>>>>>>>>", userInfo->User.name, userInfo->User.userName , userInfo->User.activeCode);
    printf("\n_________________________________________________________\n\n\n");

}

void User_Info(AUTH *currentUser)
{
    printf("\n<<<<<<<<<< ....... USER DATA ...... >>>>>>>>>>\n");
    printf("\n_________________________________________________________\n");
    printf("\nYour Name is : %s", currentUser->User.name);
    printf("\n_________________________________________________________\n");
    printf("\nYour Age is : %d", currentUser->User.age);
    printf("\n_________________________________________________________\n");
    printf("\nYour Phone is : %s", currentUser->User.phone);
    printf("\n_________________________________________________________\n\n\n");
}

void LogIn(AUTH *user)
{
    char user_Name[50];
    char password[20];
    int statusCode;
    

    printf("\n\n\n <<<<<<<<<<<<<<<<<<<<< .................. LogIn Form .................... >>>>>>>>>>>>>>>>>>>>>\n");
    printf("\nEnter Your UserName: ");
    scanf("%s", &user_Name);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Password: ");
    scanf("%s", &password);
    printf("_________________________________________________________\n");
    printf("\nEnter Your Status Code (0 - 1): ");
    scanf("%d", &statusCode);
    user->User.activeCode = statusCode;
    printf("_________________________________________________________\n");

    if (strcmp(user_Name, user->User.userName) == 0 && strcmp(password, user->User.password) == 0)
    {
        if (user->User.activeCode == 1)
        {
            printf("\nSuccessfull LogIn :-) ...... >>>>>>>>>>>>\n");
            printf("\n_________________________________________________________\n");
            User_Info(user);
            printf("\n_________________________________________________________\n");
        }else
        {
            printf("\n\n\n<<<<<<<<<<<<<<< ............. Please Check Your Status Code again ............. >>>>>>>>>>>>>>>>\n\n\n");
        }
    }
    else
    {
        printf("\n\n\n<<<<<<<<<<<<<<< .............Failed to LogIn please try Again ............. >>>>>>>>>>>>>>>>\n\n\n");
    }
}

int main(int argc, char const *argv[])
{
    AUTH userHassan;
    Signing_Up(&userHassan);
    LogIn(&userHassan);
    return 0;
}