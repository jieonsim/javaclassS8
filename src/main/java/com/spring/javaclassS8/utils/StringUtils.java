package com.spring.javaclassS8.utils;

public class StringUtils {
	public static String maskEmail(String email) {
		if (email == null || email.isEmpty()) {
			return email;
		}

		String[] parts = email.split("@");
		if (parts.length != 2) {
			return email;
		}

		String name = parts[0];
		String domain = parts[1];

		// 이름 부분 마스킹
		StringBuilder maskedName = new StringBuilder();
		for (int i = 0; i < name.length(); i++) {
			if (i < 2) {
				maskedName.append(name.charAt(i));
			} else if (i < 5) {
				maskedName.append('*');
			}
		}

		// 도메인 부분 마스킹
		String maskedDomain = domain.substring(0, 2);

		return maskedName.toString() + "@" + maskedDomain;
	}
}
