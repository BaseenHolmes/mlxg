package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Uploadfile {
	private Long fileid;
	private String coname;
	private String coper;
	private String cotime;
	private Long projectid;

}
