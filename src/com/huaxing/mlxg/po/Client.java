package com.huaxing.mlxg.po;

public class Client {
    private Long clientid;
    private String cname;
    private String cper;
    private String cphone;
    private String caddress;
    private String cbeijing;
    private String cdate;

    @Override
    public String toString() {
        return "Client{" +
                "clientid=" + clientid +
                ", cname='" + cname + '\'' +
                ", cper='" + cper + '\'' +
                ", cphone='" + cphone + '\'' +
                ", caddress='" + caddress + '\'' +
                ", cbeijing='" + cbeijing + '\'' +
                ", cdate='" + cdate + '\'' +
                '}';
    }

    public Client(Long clientid, String cname, String cper, String cphone,
                  String caddress, String cbeijing, String cdate) {
        super();
        this.clientid = clientid;
        this.cname = cname;
        this.cper = cper;
        this.cphone = cphone;
        this.caddress = caddress;
        this.cbeijing = cbeijing;
        this.cdate = cdate;
    }

    public Client() {

    }

    public Long getClientid() {
        return clientid;
    }

    public void setClientid(Long clientid) {
        this.clientid = clientid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCper() {
        return cper;
    }

    public void setCper(String cper) {
        this.cper = cper;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public String getCbeijing() {
        return cbeijing;
    }

    public void setCbeijing(String cbeijing) {
        this.cbeijing = cbeijing;
    }

    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }


}
