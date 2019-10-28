package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Need {
	private Long needid;
	private String nname;
	private String ntext;
	private Long projectid;
    private String projectname;
    private Date nstart;
    private Date nupdate;

}
