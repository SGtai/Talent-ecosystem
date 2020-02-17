package com.cykj.net.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jump")
public class JumpController
{

	@RequestMapping("/{id}/{name}")
	public String jumpfront(@PathVariable("id") String id, @PathVariable("name") String name) {
		return "/WEB-INF/"+id+"/"+name;
	}
}