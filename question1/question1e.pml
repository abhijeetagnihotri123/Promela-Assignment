proctype hello(){
    printf("Hello %d ",_pid)
}
proctype world(){
    printf("World %d",_pid)
}
init{
    atomic{run hello();run world()}
}