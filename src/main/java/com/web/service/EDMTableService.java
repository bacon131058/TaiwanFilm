package com.web.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;
import com.web.model.booking.SessionBean;

@Service
@Transactional
public class EDMTableService {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void tableResetHibernate() {
		Session session = factory.getCurrentSession();
		int count = 0;
		String line = "";
		ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource("/data/movie.dat").getFile());
		// 1. 由"data/movie.dat"逐筆讀入movie表格內的初始資料，然後依序新增到movie表格中
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println(line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				MovieBean movie = new MovieBean();
				movie.setMovieName(token[0]);
				movie.setEnglishName(token[1]);
				movie.setReleaseDate(token[2]);
				movie.setDirector(token[3]);
				movie.setActor(token[4]);
				movie.setType(token[5]);
				movie.setTicketPrice(token[6]);
				movie.setMovieLength(token[7]);
				movie.setRate(token[8]);
				// 讀取圖片檔
				File image = new File(classLoader.getResource(token[9]).getFile());
				byte[] bFile = Files.readAllBytes(image.toPath());
				movie.setImage(new SerialBlob(bFile));
				movie.setFileName(token[9].substring(token[9].lastIndexOf("/") + 1));
				movie.setYoutube(token[10]);
				movie.setMovieStory(token[11]);
				session.save(movie);
				count++;
			}
			// 印出資料新增成功的訊息
			System.out.println("新增   " + count + " 筆   movies 記錄成功");
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 2. cinema表格
		file = new File(classLoader.getResource("data/cinema.dat").getFile());
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			count = 0;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				CinemaBean cinema = new CinemaBean();
				cinema.setCinemaName(token[0]);
				cinema.setCinemaPhone(token[1]);
				cinema.setCinemaAddress(token[2]);
				cinema.setCinemaMrt(token[3]);
				cinema.setCinemaBus(token[4]);
				// 讀取圖片檔
				File image = new File(classLoader.getResource(token[5]).getFile());
				byte[] bFile = Files.readAllBytes(image.toPath());
				cinema.setImage(new SerialBlob(bFile));
				cinema.setFileName(token[5].substring(token[5].lastIndexOf("/") + 1));
				cinema.setCinemaCountry(token[6]);
				session.save(cinema);
				count++;
			}
			// 印出資料新增成功的訊息
			System.out.println("新增   " + count + " 筆   cinemas 記錄成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sessionResetHibernate() {
		Session session = factory.getCurrentSession();
		int count = 0;
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
							SessionBean sb = new SessionBean();
							sb.setCinemaId(k);
							sb.setSessionDate(dateStr);
							sb.setSessionDay(weekDays[w]);
							MovieBean mb = session.get(MovieBean.class, mid[(i % 2) + (i2 * 2)]);
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
			System.out.println("新增   " + count + " 筆   sessions 記錄成功");
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();

		}

	}

}
