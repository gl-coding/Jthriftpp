class User{
    String uid;
    String uname;
    boolean usex;
    short uage;
}

interface UserService{
    void add(User u);
    User get(String uid);
}
