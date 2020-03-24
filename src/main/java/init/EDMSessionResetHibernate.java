package init;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.booking.model.movieBean;
import com.web.booking.model.sessionBean;

import init.util.HibernateUtils;

public class EDMSessionResetHibernate {

	public static void main(String[] args) {

		int count = 0;

		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// 1. 自定義商業邏輯逐筆讀入session表格內的初始資料，然後依序新增到session表格中
			try {
				// cinemaId 13家
				for (int k = 1; k <= 13; k++) {
					// sessionDate 3天後
					for (int j = 0; j < 3; j++) {
						Calendar calendar = Calendar.getInstance();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						calendar.add(Calendar.DATE, j);
						String dateStr = sdf.format(calendar.getTime());
						String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
						int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
						if (w < 0) {
							w = 0;
						}
						// movieId 7個電影
						int[] mid = { 1, 2, 3, 4, 5, 6, 7 };
						for (int r = 0; r < 20; r++) {
							int random1 = (int) (Math.random() * 7);
							int random2 = (int) (Math.random() * 7);
							int temp = mid[random1];
							mid[random1] = mid[random2];
							mid[random2] = temp;
						}
						for (int i2 = 0; i2 < 3; i2++) {
							int time = 12 * 60 + 40;
							for (int i = 0; i < 7; i++) {
								sessionBean sb = new sessionBean();
								sb.setCinemaId(k);
								sb.setSessionDate(dateStr);
								// 2月13 demo改成
								// sb.setSessionDate("2020022" + j);
								// sb.setSessionDate("2020021" + (j + 4));
								sb.setSessionDay(weekDays[w]);
								// 2月13 demo改成
								// if (j + 4 < 7) {
								// sb.setSessionDay(weekDays[j + 4]);
								// } else {
								// sb.setSessionDay(weekDays[j - 3]);
								// }
								// if (j + 5 < 7) {
								// sb.setSessionDay(weekDays[j + 5]);
								// } else {
								// sb.setSessionDay(weekDays[j - 2]);
								// }
								movieBean mb = session.get(movieBean.class, mid[(i % 2) + (i2 * 2)]);
								if (Integer.parseInt(mb.getMovieLength().substring(4, 5)) > 3) {
									time += 100;
								} else {
									time += 120;
								}
								sb.setMovieId(mid[(i % 2) + (i2 * 2)]);
								sb.setSessionTime(time % 60 == 0 ? time / 60 + ":00" : time / 60 + ":" + time % 60);
								session.save(sb);
								count++;
							}
						}
					}
				}
				// 印出資料新增成功的訊息
				System.out.println("新增   " + count + " 筆   movies 記錄成功");
				session.flush();
			} catch (Exception e) {
				System.err.println("新建表格時發生例外: " + e.getMessage());
				e.printStackTrace();
				tx.rollback();
			}
			tx.commit();
		} catch (

		Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		}
		factory.close();

	}
}
