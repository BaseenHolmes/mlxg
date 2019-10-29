package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Client {
    private Long clientid;
    private String cname;
    private String cper;
    private String cphone;
    private String caddress;
    private String cbeijing;
    private String cdate;

}
