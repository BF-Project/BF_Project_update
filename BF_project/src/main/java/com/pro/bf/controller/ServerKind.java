package com.pro.bf.controller;


public enum ServerKind {

	NAVER(new ServerSpec("smtp.naver.com", "smtp", 587, "naver.com"),
			new ServerSpec("pop.naver.com", "pop3s", 995, "naver.com"),
			new ServerSpec("imap.naver.com", "imaps", 993, "naver.com")),
	GMAIL(new ServerSpec("smtp.gmail.com", "smtp", 587, "gmail.com"),
			new ServerSpec("pop.gmail.com", "pop3s", 995, "gmail.com"),
			new ServerSpec("imap.gmail.com", "imaps", 993, "gmail.com"))
			;
	
	ServerKind(ServerSpec smtp, ServerSpec pop, ServerSpec imap) {
		this.smtp = smtp;
		this.pop = pop;
		this.imap = imap;
	}
	
	private ServerSpec smtp;
	private ServerSpec pop;
	private ServerSpec imap;
	
	public ServerSpec getSmtp() {
		return smtp;
	}
	public ServerSpec getPop() {
		return pop;
	}
	public ServerSpec getImap() {
		return imap;
	}

	public static class ServerSpec {
		
		private String domain; 
		private String host;
		private Integer port;
		private String name;
		public ServerSpec(String host, String name, Integer port, String domain) {
			this.host = host;
			this.name = name;
			this.port = port;
			this.domain = domain;
		}
		public String getHost() {
			return host;
		}
		public Integer getPort() {
			return port;
		}
		public String getName() {
			return name;
		}
		public String getDomain() {
			return domain;
		}
		
		
		
	}
	
}
