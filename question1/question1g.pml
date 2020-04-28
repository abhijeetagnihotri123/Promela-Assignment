//Implementation of dekker's algorithm
#define true 1 false 0 Aturn 1 Bturn 0
bool Aruns,Bruns,t;
proctype A()
{
    Aruns=true,
    t=Bturn,
    (Bruns == false || t == Aturn)
        printf("A is running")
}
proctype B()
{
    Bruns=true,
    t=Aturn,
    (Aruns == false || t == Bturn)
         printf("B is running")
}
init{
    run A();
    run B();
}