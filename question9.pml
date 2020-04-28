chan pwr_on = [0] of {int}
chan pwr_off = [0] of {int}
chan fan_on = [0] of {int}
chan fan_off = [0] of {int}
int x1,x2,x3,x4,x5;
proctype Idle()
{   
    do
    ::  pwr_on ! x1
        // Transition from Idle to power through channel pwr_on
        pwr_off ? x2
        pwr_off ? x5
    od
}
proctype Power()
{
        pwr_off ! x2
        // Transition from Power to Idle through channel pwr_off
          fan_on ! x3
        // Transition from Power to Fan through channel fan_on
          fan_off ? x4 
}
proctype Fan()
{   
        fan_off ! x4
        pwr_off ! x5
}
init
{   
    x1=1
    x2=2
    x3=3
    x4=4
    x5=5
    atomic{run Idle();run Power();run Fan()}
}