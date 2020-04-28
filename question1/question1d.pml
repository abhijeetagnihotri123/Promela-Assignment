/*
    Seed value 123 : state = 2
    Seed value 120 : state = 2
    Seed value 125 : state = 2
*/
byte state = 1
proctype A(){
    atomic{ (state == 1) -> state = state + 1}
}
proctype B(){
    atomic{ (state == 1) -> state = state - 1}
}
init
{
    run A();run B()
}