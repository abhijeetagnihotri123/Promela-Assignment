/*
    After running this program with seed value 120 we get value of state as 120
*/
byte state=1
proctype A(){ (state==1) -> state = state - 1}
proctype B(){ (state==1) -> state = state + 1}
init{run A() ; run B()}
