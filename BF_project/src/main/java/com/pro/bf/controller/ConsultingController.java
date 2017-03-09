package com.pro.bf.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.pro.bf.controller.ServerKind.ServerSpec;
import com.pro.bf.dto.EmailVO;
import com.pro.bf.dto.LentVO;
import com.pro.bf.serviceImpl.LentServiceImpl;

@Controller
@RequestMapping(value = "consulting")
public class ConsultingController {

	final String DEFAULTUSERNAME = "chash512@gmail.com";
	final String DEFAULTPASSWORD = "tmdgus5736";

	@Autowired
	LentServiceImpl lentService;
	@Autowired
	WebApplicationContext ctx;

	/*
	 * @Resource(name="mailSender") private MailSender mailSender;
	 */

	@RequestMapping(value = "recommend")
	public String recommend() {
		String url = "consulting/recommend";
		return url;
	}

	@ResponseBody
	@RequestMapping(value = "recommend", method = RequestMethod.POST)
	public Map<String, List> execRecommend(String asset, String addr) {
		List<LentVO> lentRecList = new ArrayList<LentVO>();
		try {
			System.out.println(asset
					+ "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			lentRecList = lentService.lentRecList(asset + "0000", addr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Map<String, List> data = new HashMap<String, List>();

		for (int i = 0; i < 5; i++) {
			data.put("recList", lentRecList);
			/*
			 * data.put("price", lentRecList.get(i).getLent_price2());
			 * data.put("addr",
			 * lentRecList.get(i).getLent_dong()+" "+lentRecList
			 * .get(i).getLent_firstzip
			 * ()+"-"+lentRecList.get(i).getSecondzip());
			 */

			System.out.println(lentRecList.get(i).getLent_price2());
			System.out.println(lentRecList.get(i).getLent_dong() + " "
					+ lentRecList.get(i).getLent_firstzip() + "-"
					+ lentRecList.get(i).getLent_secondzip());
		}

		return data;
	}

	// 메일보내기
	@RequestMapping("consult")
	public String Consult() {
		String url = "consulting/consult";
		return url;
	}

	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail(HttpServletRequest request) {
		String url = "consulting/sendMail";
		return url;
	}

	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	public String mailSender(final EmailVO emailVO) throws IllegalStateException, IOException, MessagingException {
		// 파일임시저장
		MultipartFile picture = emailVO.getPicture();
		String name = UUID.randomUUID().toString();
		String savename = ctx.getServletContext().getRealPath("/WEB-INF/tmpSave/" + name);
		File tmpSaveFile = new File(savename);
		if(!tmpSaveFile.exists()){
			tmpSaveFile.createNewFile();
		}
		final Resource temp = ctx.getResource("/WEB-INF/tmpSave/" + name);
		final String originalName = picture.getOriginalFilename();

		if (originalName != null) {
			picture.transferTo(tmpSaveFile);
		}
		
		String url = "consulting/consult";

		ServerSpec mailServer = null;

		if ("Naver".equals(emailVO.getMailServer())) {
			mailServer = ServerKind.NAVER.getSmtp();

		} else if ("Gmail".equals(emailVO.getMailServer())) {
			mailServer = ServerKind.GMAIL.getSmtp();
		}

		final String to = emailVO.getTo();
		final String from = emailVO.getSender() + "@" + mailServer.getDomain();

		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost(mailServer.getHost());
		mailSender.setPort(mailServer.getPort());
		mailSender.setUsername(from);
		mailSender.setPassword(emailVO.getPassword());
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", true);
		mailSender.setJavaMailProperties(props);

		/*
		// 일반적인 메일보내기
		SimpleMailMessage mail = new SimpleMailMessage();

		mail.setTo(to);
		mail.setFrom(from);
		mail.setSubject(emailVO.getTitle());
		mail.setText(emailVO.getContext());*/

		/*helper.setFrom(from);
		helper.setTo(to);
		helper.setSubject("");*/
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,
						true, "UTF-8");
				helper.setFrom(from);
				helper.setTo(to);
				helper.setSubject(emailVO.getTitle());
				helper.setText(emailVO.getContext());
				
				if (originalName != null) {
					helper.addAttachment(originalName, temp);
				}
			}
		};

		mailSender.send(preparator);

		// // fileupload
		// session = request.getSession();
		// String savePath = "resources/upload";
		// ServletContext context = session.getServletContext();
		// String uploadFilePath = context.getRealPath(savePath);
		//
		// if (!file.isEmpty()) {
		// File file1 = new File(uploadFilePath, System.currentTimeMillis()
		// + file.getOriginalFilename());
		// file.transferTo(file1);
		// emailVO.setPicture(file1.getName());
		// }

		System.out.println("전송 완료");

		/*
		 * SimpleMailMessage message = new SimpleMailMessage();
		 * message.setSubject(emailVO.getTitle());
		 * message.setFrom(emailVO.getSender()); message.setTo(emailVO.getTo());
		 * message.setText(emailVO.getContext());
		 * 
		 * try { mailSender.send(message);
		 * 
		 * } catch (MailException e) { e.printStackTrace(); }
		 */

		return url;

	}

	/*
	 * @RequestMapping(value="execRecommend",method = RequestMethod.POST) public
	 * List<String> execRecommend(String asset){
	 * 
	 * List<String> recommendList = new ArrayList<String>(); try { recommendList
	 * = lentService.lentRecList(asset); } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return recommendList; }
	 */
}
