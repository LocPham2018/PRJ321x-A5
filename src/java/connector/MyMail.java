/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

import entity.MailMessage;
import entity.Users;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author AMIN
 */
public class MyMail {
    
    public Session getSession(String email, String password) {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });
        return session;
    }
    
    public boolean sendMail(MailMessage mm, Session session) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mm.getFrom()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mm.getTo()));
            message.setRecipients(Message.RecipientType.CC, InternetAddress.parse(mm.getCc()));
            message.setSubject(mm.getSubject());
            message.setContent(mm.getMessage(), "text/html; charset=UTF-8");
            Transport.send(message);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(MyMail.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
