package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Need {
	private Long needid;
	private String nname;
	private String ntext;
	private Long projectid;


}
