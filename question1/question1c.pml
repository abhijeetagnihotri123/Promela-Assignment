/*
    After running this program with seed value 125 state = 1
    After running this program with seed value 120 state = 0
    After running this program with seed value 123 state = 1 
*/
byte state=1
proctype A(){ (state==1) -> state = state - 1}
proctype B(){ (state==1) -> state = state + 1}
init{atomic{run A() ; run B()}}