package com.spring.javaclassS8.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

public class CaptchaGenerator {
    private static final String CHARACTERS = "ABCDEFGHJKLMNPQRSTUVWXYZ";
    private static final int CAPTCHA_LENGTH = 5;
    private static final int WIDTH = 390;
    private static final int HEIGHT = 150;

    public static String generateCaptchaText() {
        Random random = new Random();
        StringBuilder captchaText = new StringBuilder(CAPTCHA_LENGTH);
        for (int i = 0; i < CAPTCHA_LENGTH; i++) {
            captchaText.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
        }
        return captchaText.toString();
    }

    public static String generateCaptchaImage(String captchaText, String filePath) throws IOException {
        BufferedImage bufferedImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedImage.createGraphics();

        g2d.setColor(Color.PINK);
        g2d.fillRect(0, 0, WIDTH, HEIGHT);

        g2d.setFont(new Font("Arial", Font.BOLD, 48));
        g2d.setColor(Color.WHITE);

        int x = 20;
        int y = 100;

        for (char c : captchaText.toCharArray()) {
            g2d.drawString(String.valueOf(c), x, y);
            x += 60;
        }

        g2d.dispose();

        File file = new File(filePath);
        ImageIO.write(bufferedImage, "jpg", file);
        return file.getName();
    }
}
