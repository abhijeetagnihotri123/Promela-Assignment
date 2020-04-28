chan fork[5] = [0] of {bit}
proctype dijkstra()
{   
    bit p = 0
    bit v = 1
    do
        :: fork[0] ! p
        :: fork[1] ! p
        :: fork[2] ! p
        :: fork[3] ! p
        :: fork[4] ! p
        :: fork[0] ? v
        :: fork[1] ? v
        :: fork[2] ? v
        :: fork[3] ? v
        :: fork[4] ? v
    od
}
proctype philosopher1()
{   
    bit p,v=1;
    fork[0] ? p
    fork[1] ? p
        //critical section
    fork[0] ! v
    fork[1] ! v
}
proctype philosopher2()
{   
    bit p,v=1;
    fork[1] ? p
    fork[2] ? p
        //critical section
    fork[1] ! v
    fork[2] ! v
}
proctype philosopher3()
{   
    bit p,v=1;
    fork[2] ? p
    fork[3] ? p
        //critical section
    fork[2] ! v
    fork[3] ! v
}
proctype philosopher4()
{   
    bit p,v=1;
    fork[3] ? p
    fork[4] ? p
        //critical section
    fork[3] ! v
    fork[4] ! v
}
proctype philosopher5()
{   
    bit p,v=1;
    fork[4] ? p
    fork[0] ? p
        //critical section
    fork[4] ! v
    fork[0] ! v
}
init{
    atomic{ run dijkstra(); run philosopher1(); run philosopher2(); run philosopher3() ; run philosopher4() ; run philosopher5()}
}