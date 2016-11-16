#The project would make you develope with java and cpp without knowing thrift finally.
#define java code in the Client.java and define cpp code in the UserServer.cpp

#Define your interface in the interface.thrift
#like this:
############################################

struct User{
    1: string uid,
    2: string uname,
    3: bool usex,
    4: i16 uage,
}

service UserService{
    void add(1: User u),
    User get(1: string uid),
}

############################################


#generate cpp and java code in the gen-cpp  and gen-java
./code_generate.sh 

#configure your boost thrift and lib dir in the Makefile
############################################

BOOST_DIR = /usr/include/boost/  
THRIFT_DIR = /usr/local/include/thrift  
LIB_DIR = /usr/local/lib  

############################################


cp gen-cpp/*_server.skeleton.cpp ./Server.cpp

#define your logic in the Server.cpp

#compile cpp code
make

#run cpp server
cpp server:
./UserServer

#run cpp client
cpp client:
./UserClient

#run java client
java client:
./java_compile.sh
./java_run.sh
