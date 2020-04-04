package com.web.init;

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
import com.web.model.booking.MovieStatusEnum;
import com.web.model.booking.SessionBean;
import com.web.service.BookingService;

@Service
@Transactional
public class BookingInitDataService {

	@Autowired
	SessionFactory factory;

	@Autowired
	BookingService bookingService;

	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void insertInitData() {
		Session session = factory.getCurrentSession();
		String line = "";
		ClassLoader classLoader = getClass().getClassLoader();

		// 1. 由"data/movie.dat"逐筆讀入movie表格內的初始資料，然後依序新增到movie表格中
		int movieCount = 0;
		File file = new File(classLoader.getResource("/data/movie.dat").getFile());
		try (FileInputStream fis = new FileInputStream(file); InputStreamReader isr = new InputStreamReader(fis, "UTF8"); BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] data = line.split("\\|");
				MovieBean movie = new MovieBean();
				movie.setMovieName(data[0]);
				movie.setEnglishName(data[1]);
				movie.setReleaseDate(data[2]);
				movie.setDirector(data[3]);
				movie.setActor(data[4]);
				movie.setType(data[5]);
				movie.setTicketPrice(data[6]);
				movie.setMovieLength(data[7]);
				movie.setRate(data[8]);
				// 讀取圖片檔
				File image = new File(classLoader.getResource(data[9]).getFile());
				byte[] bFile = Files.readAllBytes(image.toPath());
				movie.setImage(new SerialBlob(bFile));
				movie.setFileName(data[9].substring(data[9].lastIndexOf("/") + 1));
				movie.setYoutube(data[10]);
				movie.setMovieStory(data[11]);
				movie.setStatus(MovieStatusEnum.valueOf(data[12]));
				session.save(movie);
				movieCount++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 2. cinema表格
		int cinemaCount = 0;
		file = new File(classLoader.getResource("data/cinema.dat").getFile());
		try (FileInputStream fis = new FileInputStream(file); InputStreamReader isr = new InputStreamReader(fis, "UTF8"); BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] data = line.split("\\|");
				CinemaBean cinema = new CinemaBean();
				cinema.setCinemaName(data[0]);
				cinema.setCinemaPhone(data[1]);
				cinema.setCinemaAddress(data[2]);
				cinema.setCinemaMrt(data[3]);
				cinema.setCinemaBus(data[4]);
				// 讀取圖片檔
				File image = new File(classLoader.getResource(data[5]).getFile());
				byte[] bFile = Files.readAllBytes(image.toPath());
				cinema.setImage(new SerialBlob(bFile));
				cinema.setFileName(data[5].substring(data[5].lastIndexOf("/") + 1));
				cinema.setCinemaCountry(data[6]);
				session.save(cinema);
				cinemaCount++;
			}
			// 印出資料新增成功的訊息
			System.out.println("新增   " + cinemaCount + " 筆   cinemas 記錄成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("新建表格時發生例外: " + e.getMessage());
		}

		// 3. 自定義商業邏輯逐筆讀入session表格內的初始資料，然後依序新增到session表格中
		int sessionCount = 0;
		try {
			// cinemaId 13家
			for (int cinemaIndex = 1; cinemaIndex <= 13; cinemaIndex++) {
				// sessionDate 3天後
				for (int dateIndex = 0; dateIndex < 3; dateIndex++) {
					Calendar calendar = Calendar.getInstance();
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
					calendar.add(Calendar.DATE, dateIndex);
					String dateStr = simpleDateFormat.format(calendar.getTime());
					String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
					int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
					if (dayOfWeek < 0) {
						dayOfWeek = 0;
					}
					// movieId 7個電影(後面4位為遞補位數)
					int[] movieArray = { 1, 2, 3, 4, 5, 6, 7, 0, 0, 0, 0 };
					for (int randomIndex = 0; randomIndex < 20; randomIndex++) {
						int random1 = (int) (Math.random() * 7);
						int random2 = (int) (Math.random() * 7);
						int temp = movieArray[random1];
						movieArray[random1] = movieArray[random2];
						movieArray[random2] = temp;
					}
					// 後面4位放入前4位做遞補
					movieArray[7] = movieArray[0];
					movieArray[8] = movieArray[1];
					movieArray[9] = movieArray[2];
					movieArray[10] = movieArray[3];
					// 同時播放多少部電影
					for (int quantityIndex = 0; quantityIndex < 3; quantityIndex++) {
						int time = 12 * 60 + 40;
						for (int movieIndex = 0; movieIndex < 7; movieIndex++) {
							SessionBean sb = new SessionBean();
							CinemaBean cb = session.get(CinemaBean.class, cinemaIndex);
							sb.setCinemaBean(cb);
							sb.setSessionDate(dateStr);
							sb.setSessionDay(weekDays[dayOfWeek]);
							MovieBean mb = session.get(MovieBean.class, movieArray[movieIndex + (quantityIndex * 2)]);
							sb.setMovieBean(mb);
							sb.setSessionTime(time % 60 == 0 ? time / 60 + ":00" : time / 60 + ":" + time % 60);
							session.save(sb);
							if (Integer.parseInt(mb.getMovieLength().substring(4, 5)) > 3) {
								time += 100;
							} else {
								time += 120;
							}
							sessionCount++;
						}
					}
				}
			}
			// 印出資料新增成功的訊息
			System.out.println("新增   " + movieCount + " 筆   movies 記錄成功");
			System.out.println("新增   " + cinemaCount + " 筆   cinemas 記錄成功");
			System.out.println("新增   " + sessionCount + " 筆   sessions 記錄成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("新建表格時發生例外: " + e.getMessage());

		}

	}

}
