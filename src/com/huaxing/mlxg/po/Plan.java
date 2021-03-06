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

    private Long Flag;
	private String plyouxianji;
	private String plzhuangtai;
	private String pltext;

    private Long functionid;
    private String functionname;
    private Long projectid;
    private String projectname;
    private Long needid;
    private String needname;
    private Long moduleid;
    private String modulename;


}
