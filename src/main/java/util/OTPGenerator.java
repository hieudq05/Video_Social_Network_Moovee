package util;

import java.security.SecureRandom;

public class OTPGenerator {
    public static String generateOTP(int length) {
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder otp = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            otp.append(secureRandom.nextInt(10));
        }

        return otp.toString();
    }
}
