package com.web.init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.model.member.MembersBean;

@Service
@Transactional
public class MemberInitDataService {

	@Autowired
	SessionFactory factory;

	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public void insertInitData() {
		Session session = factory.getCurrentSession();
		String line = "";
		ClassLoader classLoader = getClass().getClassLoader();

		int memberCount = 0;
		File file = new File(classLoader.getResource("/data/member.dat").getFile());
		try (FileInputStream fis = new FileInputStream(file); InputStreamReader isr = new InputStreamReader(fis, "UTF8"); BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] data = line.split("\\|");
				MembersBean member = new MembersBean();
				member.setMemberName(data[0]);
				member.setEmail(data[1]);
				member.setPassword(data[2]);
				member.setMemberMode(data[3]);
				session.save(member);
				memberCount++;
			}
			// 印出資料新增成功的訊息
			System.out.println("新增   " + memberCount + " 筆   members 記錄成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("新建表格時發生例外: " + e.getMessage());
		}
	}
}
