package com.huaxing.mlxg.po;

public class User {
    private Long userid;
    private String username;
    private Long roid;
    private String utype;
    private String usex;
    private int uage;
    private String uemail;
    private Long uphone;
    private String password;
    private String ucardid;

    public User(Long userid, String username, Long roid, String utype,
                String usex, int uage, String uemail, Long uphone,
                String password, String ucardid) {
        this.userid = userid;
        this.username = username;
        this.roid = roid;
        this.utype = utype;
        this.usex = usex;
        this.uage = uage;
        this.uemail = uemail;
        this.uphone = uphone;
        this.password = password;
        this.ucardid = ucardid;
    }

    public User() {

    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getRoid() {
        return roid;
    }

    public void setRoid(Long roid) {
        this.roid = roid;
    }

    public String getUtype() {
        return utype;
    }

    public void setUtype(String utype) {
        this.utype = utype;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public int getUage() {
        return uage;
    }

    public void setUage(int uage) {
        this.uage = uage;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public Long getUphone() {
        return uphone;
    }

    public void setUphone(Long uphone) {
        this.uphone = uphone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUcardid() {
        return ucardid;
    }

    public void setUcardid(String ucardid) {
        this.ucardid = ucardid;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", roid=" + roid +
                ", utype='" + utype + '\'' +
                ", usex='" + usex + '\'' +
                ", uage=" + uage +
                ", uemail='" + uemail + '\'' +
                ", uphone=" + uphone +
                ", password='" + password + '\'' +
                ", ucardid='" + ucardid + '\'' +
                '}';
    }
}
