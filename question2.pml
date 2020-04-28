// Three readers and one writer
// if a reader is in the critical section it must allow different readers to read
chan lock = [0] of {bit}
chan rmutex = [0] of {bit}
bit x[10]
int index;
int readcount=0;
proctype lock_provider()
{
    bit p=0,v;
    do
      ::  rmutex ! p
      ::  lock ! p
      ::  rmutex ? v
      ::  rmutex ! p
      ::  lock ? v
      ::  rmutex ? v
    od
}
proctype reader()
{
    bit p,v=1;
    rmutex ? p
    readcount=readcount+1;
    readcount==1
    lock ? p
    rmutex ! v
    rmutex ? p
    readcount=readcount-1
    readcount==0
    lock ! v
    rmutex ! v
    //(lock ! v)
}
proctype writer()
{
    bit p=0,v;
    lock ? p 
        x[index]=1
        index=(index+1)%10;
    lock ! v
}
init
{
    atomic{run writer() ; run reader() ; run reader() ; run reader()}
}