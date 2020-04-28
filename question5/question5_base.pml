proctype vendor()
{
    
}
proctype customer()
{

}
init
{
    atomic{run vendor();run customer()}
}