package util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;
    private static final String USERNAME = "hieudqpd10569@gmail.com";
    private static final String PASSWORD = "tydh pslr rdax hpnr";

    public static boolean sendEmailVideo(String toEmail, String fromEmail, String fromName, String videoTitle, String urlVideo) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {
            String htmlContent = String.format("""
                <html>
                    <body>
                        <p>Xin chào,</p>
                        <p>Bạn vừa nhận được một video thú vị. Hãy nhấn vào nút bên dưới để xem:</p>
                        <p>%s</p>
                        <a href="%s" style="text-decoration: none;">
                            <button style="
                                background-color: #4CAF50;
                                color: white;
                                padding: 10px 20px;
                                border: none;
                                border-radius: 5px;
                                cursor: pointer;
                                font-size: 16px;">
                                Xem Video
                            </button>
                        </a>
                        <p>Chúc bạn xem vui vẻ!</p>
                    </body>
                </html>
            """, videoTitle, urlVideo);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(fromName+" (" + fromEmail + ") muốn chia sẻ một video thú vị với bạn!");
            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
