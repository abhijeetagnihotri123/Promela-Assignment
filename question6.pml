// #define request 0
// #define not_request 1
byte units_stored = 0 // 20 Min 30 Max starting with 0 to fill till 30 then wobble between 20 and 30
chan in1 = [0] of { int };
chan out = [0] of { int };
chan out_in = [0] of {int};
chan in_out = [0] of {int};
proctype outlet()
{   
    int sendval,recval,x1,x2;
    x1 = 1;
    do
        ::    out ! sendval -> 
            in1 ? recval
            if
                ::(sendval==recval) -> sendval=1-recval
                ::(sendval==1 && units_stored >20) -> units_stored = units_stored - 1
                ::(units_stored<=20) -> out_in ! x1; 
                ::(units_stored>=30) -> in_out ? x2;
            fi
    od
}
proctype user()
{   
    int recval
    do
    ::    out ? recval
            in1 ! recval;
    od
}
proctype inlet()
{   
    int x1,x2;
    out_in ? x1
    x2 = 1
    do
    ::(units_stored <30) -> units_stored = units_stored + 1
    ::(units_stored >=30) -> in_out ! x2
    od

}
proctype monitor()
{
    assert(units_stored>=20 && units_stored<=30)
}
init{
    units_stored=25;
    atomic{run user();run outlet();run inlet();run monitor()}
}