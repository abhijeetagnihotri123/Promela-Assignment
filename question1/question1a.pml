/*
After running this program in spin with seed value 123 and 120 
value of x as 2 and for y as 5 is shown most of the times
*/
byte x=2,y=3
proctype A(){x=x+1}
proctype B(){x=x-1;y=y+x}
init{atomic{run A();run B()}}