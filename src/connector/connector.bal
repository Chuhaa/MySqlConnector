import ballerina/java.jdbc;

public client class Client{

    private jdbc:Client dbc;

    public function init(string url, string username, string password) returns error?{
        self.dbc = check new (url, username, password);
    }
    

    public remote function getName(string ide) returns @tainted string|error? {
      stream<record {}, error> rs = self.dbc->query( `select name from test where id=${<@untainted> ide}`);
      record{|record{} value;|}? ent = check rs.next();

      if ent is record{|record{} value;|} {
          string name = <string> ent.value["name"];
          return name;
      }

    }

    public remote function storeInfo(string id, string name) returns error? {
        _ = check self.dbc->execute(`insert into test(id, name) values (${<@untainted> id}, ${<@untainted> name})`);
    }

    public remote function updateName(string id, string name) returns error? {
        _ = check self.dbc->execute(`update test set name=${<@untainted> name} where id=${<@untainted> id}`);
    }
}