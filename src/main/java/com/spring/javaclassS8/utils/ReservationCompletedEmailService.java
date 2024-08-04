package com.spring.javaclassS8.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.vo.reserve.ReservationDetailVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Service
public class ReservationCompletedEmailService {

	@Autowired
	private JavaMailSender mailSender;

	public void sendReservationCompletedEmail(String email, ReservationVO reservation, List<ReservationDetailVO> reservationDetails) throws MessagingException {
		String htmlContent = getHtmlTemplate(reservation, reservationDetails);
		sendHtmlEmail(email, "[티켓챔프] 예매가 완료되었습니다", htmlContent);
	}
	
	private String getHtmlTemplate(ReservationVO reservation, List<ReservationDetailVO> reservationDetails) {
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E)");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
        DateTimeFormatter reservationDateFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        
        String memberName = reservation.getMemberName();
        String reservationDate = reservation.getCreatedAt().toLocalDateTime().format(reservationDateFormatter);
        String ticketName = reservation.getHomeTeamName() + " vs " + reservation.getAwayTeamName();
        
        // gameDate와 gameTime을 각각 포맷팅
        String formattedGameDate = LocalDate.parse(reservation.getGameDate()).format(dateFormatter);
        String formattedGameTime = LocalTime.parse(reservation.getGameTime()).format(timeFormatter);
        String gameDateTime = formattedGameDate + " " + formattedGameTime;
        
        String seats = generateSeatsHtml(reservationDetails);
        String paymentMethod = reservation.getTotalAmount() == 0 ? "스포츠 예매권" : "신용카드";
        String reservationNumber = reservation.getReservationNumber();
        String venueName = reservation.getVenueName();
        int totalTicketPrice = reservation.getTotalTicketPrice();
        int advanceTicketDiscount = reservation.getAdvanceTicketDiscount();
        int ticketPrice = totalTicketPrice - advanceTicketDiscount;
        int bookingFee = reservation.getBookingFee();
        int totalAmount = reservation.getTotalAmount();
        
        // cancelDeadline 포맷팅
        String cancelDeadline = reservation.getCancelDeadline();
        if (cancelDeadline != null) {
            cancelDeadline = LocalDateTime.parse(cancelDeadline, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
                                          .format(dateTimeFormatter);
        } else {
            cancelDeadline = "취소 마감시간 정보 없음";
        }

        return "<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 680px; font-family: 돋움, dotum, applegothic, sans-serif; font-size: 12px; color: #242428; word-break: break-all; margin: 0 auto;\">\r\n"
        + "    <tbody>\r\n"
        + "        <tr>\r\n"
        + "            <td style=\"padding: 0 25px\">\r\n"
        + "                <table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 630px; font-family: 돋움, dotum, applegothic, sans-serif\">\r\n"
        + "                    <tbody>\r\n"
        + "                        <tr>\r\n"
        + "                            <td align=\"left\" valign=\"top\">\r\n"
        + "                                <table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 630px; font-family: 돋움, dotum, applegothic, sans-serif\">\r\n"
        + "                                    <tbody>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <td valign=\"top\" colspan=\"2\" height=\"21\" style=\"font-size: 0; line-height: 0\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> &nbsp; </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <td valign=\"top\" colspan=\"2\" height=\"80\" style=\"font-size: 14px; font-weight: bold; line-height: 18px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 안녕하세요. " + memberName + "님!</span>\r\n"
        + "                                                <br>\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                                <span style=\"color: rgb(250, 40, 40); font-family: Arial;\">" + reservationDate + "</span>\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 아래와 같이 예매가 성공적으로 완료되었습니다. </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <td align=\"left\" valign=\"top\" colspan=\"2\" height=\"16\" style=\"font-size: 14px; font-weight: bold;\">\r\n"
        + "                                                <span style=\"font-family: Arial;\">예매한 티켓정보 </span>\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <td valign=\"top\" colspan=\"2\" height=\"10\" style=\"font-size: 0; line-height: 0\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> &nbsp; </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <td align=\"left\" valign=\"top\" colspan=\"2\">\r\n"
        + "                                                <table align=\"left\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 630px; font-family: 돋움, dotum, applegothic, sans-serif; border-top: 1px solid #cfd0d7; border-bottom: 1px solid #ecedf2\">\r\n"
        + "                                                    <tbody>\r\n"
        + "                                                        <tr>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 티켓명 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" colspan=\"3\" width=\"500\" height=\"31\" style=\"padding: 0 10px; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> "+ ticketName +" </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                        </tr>\r\n"
        + "                                                        <tr>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 예매자 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> " + memberName +" </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 예매번호 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> "+ reservationNumber +" </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                        </tr>\r\n"
        + "                                                        <tr>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 관람일시 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> " + gameDateTime + " </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 장소 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> " + venueName + " </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                        </tr>\r\n"
        + "                                                        <tr>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 좌석 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\">\r\n"
        + "                                                                    <p>" + seats + "</p>\r\n"
        + "                                                                </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 티켓 수령 방법 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 현장수령 </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                        </tr>\r\n"
        + "                                                        <tr>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 결제수단 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> " + paymentMethod + " </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" width=\"130\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 예매 상태 </span>\r\n"
        + "                                                            </th>\r\n"
        + "                                                            <td align=\"left\" width=\"185\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                                <span style=\"font-family: Arial;\"> 예매완료 </span>\r\n"
        + "                                                            </td>\r\n"
        + "                                                        </tr>\r\n"
        + "                                                    </tbody>\r\n"
        + "                                                </table>\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                    </tbody>\r\n"
        + "                                </table>\r\n"
        + "                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td height=\"50\"></td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td align=\"left\" valign=\"top\" height=\"16\" style=\"font-size: 14px; font-weight: bold;\">\r\n"
        + "                                <span style=\"font-family: Arial;\">결제정보</span>\r\n"
        + "                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td height=\"10\"></td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td align=\"left\" valign=\"top\">\r\n"
        + "                                <table align=\"left\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 630px; font-family: 돋움, dotum, applegothic, sans-serif; border-top: 1px solid #cfd0d7; border-bottom: 1px solid #ecedf2\">\r\n"
        + "                                    <tbody>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"middle\" width=\"120\" height=\"31\" style=\"padding: 0 10px; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 결제수단 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"480\" height=\"31\" style=\"padding: 0 10px; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> " + paymentMethod + " </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"middle\" width=\"120\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 티켓금액 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"480\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> " + ticketPrice + "원 </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"middle\" width=\"120\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 예매수수료 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"480\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> " + bookingFee + "원 </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"middle\" width=\"120\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 총 결제금액 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"480\" height=\"31\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #fa2828\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                                <strong><span style=\"font-family: Arial;\">" + totalAmount + "원</span></strong>\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                    </tbody>\r\n"
        + "                                </table>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td style=\"padding-top: 30px; text-align: center; line-height: 0;\">\r\n"
        + "                                <button type=\"button\" onclick=\"window.open('http://localhost:9090/javaclassS8/')\" style=\"width:260px; height:56px; background-color:black; color:white; border-radius:5px; font-size:16px; font-weight: bold; cursor: pointer;\">예매내역보기</button>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td height=\"50\"></td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td align=\"left\" valign=\"top\" height=\"17\" style=\"font-size: 14px; font-weight: bold;\">\r\n"
        + "                                <span style=\"font-family: Arial;\">취소/환불안내</span>\r\n"
        + "                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td height=\"10\"></td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td align=\"left\" valign=\"top\">\r\n"
        + "                                <table align=\"left\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width: 630px; font-family: 돋움, dotum, applegothic, sans-serif; border-top: 1px solid #cfd0d7; border-bottom: 1px solid #ecedf2\">\r\n"
        + "                                    <tbody>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"middle\" width=\"109\" height=\"31\" style=\"padding: 0 10px; border-right: 1px solid #ecedf2; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 구분 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <th align=\"left\" colspan=\"2\" rowspan=\"1\" valign=\"middle\" width=\"480\" height=\"31\" style=\"padding: 0 10px; background: #f8f9fa; font-size: 13px; color: #62676c; text-align: left; letter-spacing: -1px\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 취소 수수료 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"middle\" width=\"109\" height=\"29\" style=\"padding: 0 8px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c; text-align: left\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 취소 마감시간 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" colspan=\"2\" width=\"480\" height=\"29\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #fa2828\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                                <strong><span style=\"font-family: Arial;\">" + cancelDeadline + "</span></strong>\r\n"
        + "                                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <th align=\"left\" colspan=\"1\" rowspan=\"2\" valign=\"middle\" width=\"109\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c; text-align: left\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 취소 수수료 </span>\r\n"
        + "                                            </th>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"164\" height=\"47\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 예매당일 </span>\r\n"
        + "                                            </td>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"295\" height=\"47\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 예매 당일밤 12시 이전 취소시에는 취소수수료 없음</span>\r\n"
        + "                                                <br>\r\n"
        + "                                                <span style=\"font-family: Arial;\">(단, 취소기한내에 한함) </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                        <tr>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"164\" height=\"47\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; border-right: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 예매익일 ~</span>\r\n"
        + "                                                <br>\r\n"
        + "                                                <span style=\"font-family: Arial;\">취소마감시간 전 </span>\r\n"
        + "                                            </td>\r\n"
        + "                                            <td align=\"left\" valign=\"middle\" width=\"295\" height=\"47\" style=\"padding: 0 10px; border-top: 1px solid #ecedf2; font-size: 12px; color: #62676c\">\r\n"
        + "                                                <span style=\"font-family: Arial;\"> 티켓 금액의 10% </span>\r\n"
        + "                                            </td>\r\n"
        + "                                        </tr>\r\n"
        + "                                    </tbody>\r\n"
        + "                                </table>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                    </tbody>\r\n"
        + "                </table>\r\n"
        + "            </td>\r\n"
        + "        </tr>\r\n"
        + "        <tr>\r\n"
        + "            <td height=\"45\"></td>\r\n"
        + "        </tr>\r\n"
        + "        <tr>\r\n"
        + "            <td style=\"padding: 16px 25px 20px 25px; border-top: 2px solid #cfd0d7; background: #f8f9fa\">\r\n"
        + "                <table style=\"width: 630px; margin: 0 auto; border: 0; border-spacing: 0; border-collapse: collapse; font-family: 돋움, dotum, applegothic, sans-serif\">\r\n"
        + "                    <tbody>\r\n"
        + "                        <tr>\r\n"
        + "                            <td colspan=\"2\" style=\"padding: 0; font-size: 11px; font-family: 돋움, dotum, applegothic, sans-serif; color: #62676c; line-height: 16px; letter-spacing: -0.4px\">\r\n"
        + "                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                <p style=\"margin: 0; padding: 0\">\r\n"
        + "                                    <span style=\"font-family: Arial;\"> (28575) 충북 청주시 서원구 사직대로 109</span>\r\n"
        + "                                    <br>\r\n"
        + "                                    <span style=\"font-family: Arial;\"> 대표이사 : 심지언｜사업자등록번호 : 123-45-67890｜통신판매업 신고번호 : 제 2024-충북청주-12345호</span>\r\n"
        + "                                    <br>\r\n"
        + "                                    <span style=\"font-family: Arial;\"> 개인정보보호 책임자 : 심지언 </span>\r\n"
        + "                                </p>\r\n"
        + "                            </td>\r\n"
        + "                        </tr>\r\n"
        + "                        <tr>\r\n"
        + "                            <td style=\"padding: 20px 0 0 0;\">\r\n"
        + "                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                                <p style=\"margin: 0; padding: 0; font-size: 11px; font-family: 돋움, dotum, applegothic, sans-serif; color: #a7acb6; line-height: 16px; letter-spacing: -0.4px\">\r\n"
        + "                                    <span style=\"font-family: Arial;\"> Copyright © TicketChamp Corporation. All rights reserved. </span>\r\n"
        + "                                </p>\r\n"
        + "                                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "                            </td>\r\n"
        + "                            <td style=\"padding: 0; text-align: right\"></td>\r\n"
        + "                        </tr>\r\n"
        + "                    </tbody>\r\n"
        + "                </table>\r\n"
        + "                <span style=\"font-family: Arial;\"> </span>\r\n"
        + "            </td>\r\n"
        + "        </tr>\r\n"
        + "    </tbody>\r\n"
        + "</table>";
	}

        private String generateSeatsHtml(List<ReservationDetailVO> reservationDetails) {
            return reservationDetails.stream()
                .map(detail -> String.format("%s %d블록 %d열 %d번", detail.getSeatName(), detail.getSeatBlock(), detail.getSeatRow(), detail.getSeatNumber()))
                .collect(Collectors.joining("<br>"));
        }

        private void sendHtmlEmail(String to, String subject, String htmlContent) throws MessagingException {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlContent, true);

            mailSender.send(message);
        }
}