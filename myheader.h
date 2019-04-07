#include<stdlib.h>
#include<iostream>
#include<stdio.h>
using namespace std;

int MyRandomNumber(int from, int to)          //Random Number Creator...
{
    int r;
    r=rand()%to+from;
    if(r>to) r=r-from;
    return r;
}

//Sorting Algorithm.................................................................................

int MySelectionSort(int arry[], int length, char x)
{
    int i,j,position,temp;
    if(x=='a') //ascending order
    {
        for(i=0;i<length-1;i++)
        {
            position=i;
            for(j=i+1;j<length;j++)
            {
                if(arry[j]<arry[position])   position=j;
            }
            if(position!=i)   //Swapping
            {
                temp=arry[i];
                arry[i]=arry[position];
                arry[position]=temp;
            }
        }
        return 0; //successfully returned
    }
    else if(x=='d') //descending order
    {
        for(i=0;i<length-1;i++)
        {
            position=i;
            for(j=i+1;j<length;j++)
            {
                if(arry[j]>arry[position])   position=j;
            }
            if(position!=i)   //Swapping
            {
                temp=arry[i];
                arry[i]=arry[position];
                arry[position]=temp;
            }
        }
        return 0; //successfully returned
    }
    return -1; //unsuccessfully returned
}


int MyBubbleSort(int arry[],int n, char x)
{
    int i,j,temp;
    if(x=='a') //ascending order
    {
        for(j=0;j<n;j++)
        {
            for(i=0;i<n-j-1;i++)
            {
                if(arry[i]>arry[i+1])
                {
                    temp=arry[i];
                    arry[i]=arry[i+1];
                    arry[i+1]=temp;
                }
            }
        }
        return 0; //successfully returned
    }
    else if(x=='d') //descending order
    {
        for(j=0;j<n;j++)
        {
            for(i=0;i<n-j-1;i++)
            {
                if(arry[i]<arry[i+1])
                {
                    temp=arry[i];
                    arry[i]=arry[i+1];
                    arry[i+1]=temp;
                }
            }
        }
        return 0; //successfully returned
    }
    return -1; //unsuccessfully returned
}



//Standard Template Library....................................................................

struct NODE{
    int value;
    NODE *next;
};

class MyLinkedList{
    NODE *head=NULL,*tail=NULL;
    int Size;
public:
    MyLinkedList(){
        Size=0;
    }
    void push_front(int x){
        NODE *temp= new NODE;
        temp->value=x;
        if(head==NULL){
            temp->next=NULL;
            head=tail=temp;
        }
        else{
            temp->next=head;
            head=temp;
        }
        Size++;
    }
    void push_back(int x){
        NODE *temp=new NODE;
        temp->value=x;
        temp->next=NULL;
        if(head==NULL){
            head=tail=temp;
        }
        else{
            tail->next=temp;
            tail=tail->next;
        }
        Size++;
    }
    int pop_front(){
        if(head==NULL){
            printf("List is empty!!\n");
            return -1;
        }
        Size--;
        NODE *temp=head;
        int x=temp->value;
        if(head==tail){
            delete temp;
            head=tail=NULL;
            return x;
        }
        head=head->next;
        delete temp;
        return x;
    }
    int pop_back(){                 //Order of N!!
        if(head==NULL){
            printf("List is Empty!!\n");
            return -1;
        }
        int x;
        NODE *temp=head,*temp2;
        if(head->next==NULL){
            x=head->value;
            delete head;
            head=tail=NULL;
            return x;
        }
        while(temp->next->next!=NULL) temp=temp->next;
        temp2=temp->next;
        temp->next=NULL;
        tail=temp;
        x=temp2->value;
        delete temp2;
        return x;
    }
    void display(){
        NODE *temp=head;
        while(temp!=NULL){
            printf("%d   ",temp->value);
            temp=temp->next;
        }
        printf("\n\n");
    }
    int search(int x){
        NODE *temp=head;
        int pos=0;
        if(head==NULL) return -1;
        while(temp!=NULL){
            if(temp->value==x) return pos;
            temp=temp->next;
            pos++;
        }
        return -1;
    }
    int size(){
        return Size;
    }
    int front(){
        if(head!=NULL) return head->value;
        return -1;
    }
    int back(){
        if(tail!=NULL) return tail->value;
        return -1;
    }
    bool empty(){
        if(Size==0) return true;
        return false;
    }
    void free(){
        NODE *temp;
        while(head!=NULL){
            temp=head;
            head=head->next;
            delete temp;
        }
        tail=NULL;
        Size=0;
    }
};

class MyQueue{
    MyLinkedList qq;
public:
    void push(int x){
        qq.push_back(x);
    }
    int pop(){
        return qq.pop_front();
    }
    int front(){
        return qq.front();
    }
    int back(){
        return qq.back();
    }
    bool empty(){
        return qq.empty();
    }
    int size(){
        return qq.size();
    }
    void display(){
        qq.display();
    }
    void free(){
        qq.free();
    }
};

class MyStack{
    MyLinkedList ll;
public:
    void push(int x){
        ll.push_front(x);
    }
    int pop(){
        return ll.pop_front();
    }
    int front(){
        return ll.front();
    }
    void free(){
        ll.free();
    }
    int size(){
        return ll.size();
    }
    bool empty(){
        return ll.empty();
    }
    void display(){
        ll.display();
    }
    int search(int x){
        return ll.search(x);
    }
};
