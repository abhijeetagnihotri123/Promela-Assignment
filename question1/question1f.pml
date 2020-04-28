/*With use of channel*/
chan s[2] = [0] of {int};

proctype hello()
{   
    int q;
    s[0] ? q
    (q==143) -> printf("Hello ")
        int x=132;
        s[1] ! x
}
proctype world()
{   
    int y;
    s[1] ? y
    (y==132) -> printf("World ")
}
proctype control()
{
    int p=143;
    s[0] ! p
}
init{
    atomic{run hello();run world()}
}
/*
Promela model without use of channel
byte state=0
proctype hello()
{
    (state == 1) -> printf("Hello ")
    state=2
}
proctype world()
{
    (state == 2) -> printf("World ")
}
proctype control()
{
    state=1
}
init{
    atomic{run hello();run world();run control()}
}
*/