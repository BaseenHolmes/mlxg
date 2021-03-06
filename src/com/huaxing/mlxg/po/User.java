package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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

    private String uaddress;
    private String ubankname;
    private String ubankid;
    private String usalary; //工资
    private String ubonus; //奖金
    private String ubuzhu;//补助金
    private String utext;
    private String ustart;//入职时间
    private String ufajin;
}
