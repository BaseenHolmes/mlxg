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
	private String pgengxin;
	private String pyouxianji;
	private String pzhuangtai;


}
