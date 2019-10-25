package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Plan {
	private Long planid;
	private String plname;
	private String plstart;
	private String plend;
	private Long funid;
	private Long Flag;
	private String plyouxianji;
	private String plzhuangtai;
	private String pltext;


}
