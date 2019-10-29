package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Module {
	private Long moduleid;
	private String mname;
	private String mbiaoshi; //标识
	private Date mstart;
	private Date mupdate;
	private String myouxianji;
	private Long needid;
	private String needname;
	private Long projectid;
	private String projectname;
	private String mtext;

}
