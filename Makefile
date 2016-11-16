BOOST_DIR = /usr/include/boost/  
THRIFT_DIR = /usr/local/include/thrift  
LIB_DIR = /usr/local/lib  

GEN_SRC = ./gen-cpp/interface_types.cpp ./gen-cpp/interface_constants.cpp ./gen-cpp/UserService.cpp
default: server client  
server: UserServer.cpp
	g++ -g -o UserServer -I${THRIFT_DIR} -I${BOOST_DIR}  -I./gen-cpp -L${LIB_DIR}  UserServer.cpp ${GEN_SRC} -lthrift
client: UserClient.cpp  
	g++ -g -o UserClient -lm -pthread -lz -lrt -lssl -I${THRIFT_DIR} -I${BOOST_DIR}  -I./gen-cpp -L${LIB_DIR} UserClient.cpp ${GEN_SRC} -lthrift 
clean:  
	$(RM) -r UserServer UserClient  
