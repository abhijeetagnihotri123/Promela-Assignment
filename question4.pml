chan track1 = [0] of {bit}
chan track2 = [0] of {bit}
bit trains[2]={1,1}
bit state;
// Doudt to be asked by Jinwala Sir
proctype state_check()
{

}
proctype signal1()
{
    
}
proctype signal2()
{

}
proctype signal3()
{

}
init
{
    atomic{run signal1();run signal2();run signal3()}
}