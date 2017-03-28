package com.jeil.mail;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class MailSender {

	@Autowired
	protected JavaMailSender mailsender;

	public void Sendmail(Mail mail) throws Exception {

		MimeMessage msg = mailsender.createMimeMessage();
		try {
			msg.setSubject(mail.getSubject());
			msg.setText(mail.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(mail.getReceiver()));

		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		try {
			mailsender.send(msg);
		} catch (MailException e) {
			System.out.println("MailException");
			e.printStackTrace();
		}
	}

}
