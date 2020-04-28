//Alternating BIT PROTOCOL
chan in1 = [0] of { int };
chan out = [0] of { int };

proctype sender()
{   
    int sendval,recval;
    do
        ::    out ! sendval -> 
            in1 ? recval
            if
                ::(sendval==recval)->
                    sendval=1-recval
                ::else -> skip
            fi
    od
}
proctype receiver()
{   
    int recval
    do
    ::    out ? recval
            in1 ! recval;
    od
}
init{
    atomic{run sender();run receiver()}
}