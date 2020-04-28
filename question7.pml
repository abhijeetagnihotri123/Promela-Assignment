#define On 1
#define Off 0
mtype = {Red,Orange,Green}
byte s1_status
byte s2_status
bit sensor_status
chan chan_s1 = [0] of {byte}
chan chan_s2 = [0] of {byte}
chan chan_sensor = [0] of {bit};
proctype HighwaySignal(mtype status)
{
    bit sense = Off;
    s1_status = status;
    byte temp;
    chan_sensor ! sense
    (sensor_status == On)->s1_status = Orange
    (s1_status == Orange)->s1_status = Red
    chan_s1 ! s1_status
    chan_s2 ? temp
    (temp == Red)->s1_status = Green
}
proctype FarmRoadSignal(mtype status)
{   
    s2_status = status
    byte temp;
    bit sense;
    chan_s1 ? temp;
    (sensor_status == On && temp == Red)-> s2_status = Green
    sensor_status = Off
    (sense == Off) -> s2_status = Red
    chan_s2 ! s2_status
}
proctype Sensor()
{   
    do
    ::    chan_sensor ? sensor_status
    ::    (sensor_status == Off) -> sensor_status = On
    od    //chan_sensor ? sensor_status
}
init
{
    atomic{run HighwaySignal(Green);run FarmRoadSignal(Red);run Sensor()}
}