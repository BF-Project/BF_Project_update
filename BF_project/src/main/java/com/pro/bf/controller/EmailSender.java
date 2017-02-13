package com.pro.bf.controller;

import javax.annotation.Resource;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.pro.bf.dto.EmailVO;

@Component // 해당 빈을 스프링 컨테이너에 등록
@Controller
public class EmailSender {

	@Resource(name="mailSender")
	protected JavaMailSender mailSender;
	
	public void SendMail(EmailVO email) throws Exception{
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(email.getTitle());
		msg.setText(email.getContext());
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getTo()));
		
		mailSender.send(msg);
	}
}