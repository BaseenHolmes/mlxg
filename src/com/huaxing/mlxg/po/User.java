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
}
