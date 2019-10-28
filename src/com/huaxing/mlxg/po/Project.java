package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {
	private Long projectid;
	private String pname;
	private Long clientid;
	private Long userid;
	private Long pnumber;
	private String pstart;
    private String pend;
	private String pyouxianji;
	private String pzhuangtai;
    private long pchengben;
    private long pyusuan;
    private String pbeizhu;
    private String cname;
    private String uname;

}
