package com.pro.bf.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

@Controller
@RequestMapping("admin")
public class AdminConsController {

	@Resource(name="cons") // root-context.xml 등록해 놓은 properties의 id를 가져온다.	
	private Properties cons;
	
	@Inject
	WebApplicationContext ctx;
	
	@RequestMapping(value="ConsManager", method=RequestMethod.GET)
	public String ConsManager() {
		String url = "admin/consult/cons";
		return url;
	}
	
	@RequestMapping(value="ConsManager", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Properties ConsManagerForJson() {
		return cons;
	}
	
	@RequestMapping(value="ConsManager", method=RequestMethod.POST)
	public String ConsManager2(String irum, String email) throws FileNotFoundException, IOException {
		File file = ctx.getResource("classpath:com/pro/jdbc/properties/cons.properties").getFile();
		String url = "admin/consult/cons";
		cons.put(email, irum);
		cons.store(new FileOutputStream(file), "");
		return url;
	}
	
	@RequestMapping("regist")
	public String ConsRegist() {
		String url = "admin/consult/consRegist";
		return url;
	}
	
	@RequestMapping(value="delete", produces="application/json")
	@ResponseBody
	public Map<String, Object> ConsDelete(@RequestParam(required=false) String[] check) throws IOException {
		if(check != null) {
			for(String key:check) {
				cons.remove(key);
			}
			File file = ctx.getResource("classpath:com/pro/jdbc/properties/cons.properties").getFile();
			cons.store(new FileOutputStream(file), "");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}
}
