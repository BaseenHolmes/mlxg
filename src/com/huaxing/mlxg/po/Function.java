package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Function {
    private Long functionid;
	private String fname;
	private String ftext;
	private Long moduleid;
    private String modulename;
    private Long projectid;
    private String projectname;
    private Long needid;
    private String needname;
    private String fbanbenhao;
    private Date fstart;
    private String fyouxianji;
}
