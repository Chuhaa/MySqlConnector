import ballerina/test;

@test:Config{}
function testGet(){
Client|error dbClient =  new ("url","un","pass");
    if dbClient is Client{
        (string|error)? rs = dbClient->getName("a");
    }
}