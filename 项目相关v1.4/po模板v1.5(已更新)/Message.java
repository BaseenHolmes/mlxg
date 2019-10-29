package com.huaxing.mlxg.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
	private Long messageid;
	private String mename;
	private Long mesend;
	private Long merecive;
	private Date medate;
	private String metext;


}
