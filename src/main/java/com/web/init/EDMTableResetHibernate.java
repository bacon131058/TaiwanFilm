package com.web.init;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.init.util.HibernateUtils;
import com.web.init.util.SystemUtils2018;
import com.web.model.booking.CinemaBean;
import com.web.model.booking.MovieBean;

public class EDMTableResetHibernate {

	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";
		int count = 0;

		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			// 1. 由"data/movie.dat"逐筆讀入movie表格內的初始資料，然後依序新增到movie表格中
			try (FileInputStream fis = new FileInputStream("data/movie.dat");
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
					movie.setImage(SystemUtils2018.fileToBlob(token[9].trim()));
					movie.setFileName(SystemUtils2018.extractFileName(token[9].trim()));
					movie.setYoutube(token[10]);
					movie.setMovieStory(token[11]);
					session.save(movie);
					count++;
				}
				// 印出資料新增成功的訊息
				System.out.println("新增   " + count + " 筆   movies 記錄成功");
				session.flush();
			}

			// 2. cinema表格
			try (FileInputStream fis = new FileInputStream("data/cinema.dat");
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
					cinema.setImage(SystemUtils2018.fileToBlob(token[5].trim()));
					cinema.setFileName(SystemUtils2018.extractFileName(token[5].trim()));
					cinema.setCinemaCountry(token[6]);
					session.save(cinema);
					count++;
				}
				// 印出資料新增成功的訊息
				System.out.println("新增   " + count + " 筆   cinemas 記錄成功");
				session.flush();
			}
			tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		}
		factory.close();
	}

}
