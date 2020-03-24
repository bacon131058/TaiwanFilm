package com.web.model.activity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;




@Entity
@Table(name="activity")
public class activityBean  implements Serializable {

	private static final long serialVersionUID = 1L;
		@Id
	    @GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer activityId;	
		private String activityTitle;
		@Column(columnDefinition="nvarchar(max)")
		private String activityContent;
		private Integer category;
		private String createTime;
		private Integer activityWatched;
		private String activityAuthor;
		private String activityLikes;
		private String activityMainContent;
		private Integer status;
		private String startTime;
		private String endTime;
		private Integer activityNumber;
		
		
		private Blob activityImage;
		
		private Blob coverImage;	
		private String  fileName;
		
		public String getActivityMainContent() {
			return activityMainContent;
		}
		public void setActivityMainContent(String activityMainContent) {
			this.activityMainContent = activityMainContent;
		}

			
	
		
		public Integer getStatus() {
			return status;
		}
		public void setStatus(Integer status) {
			this.status = status;
		}
		public Blob getActivityImage() {
			return activityImage;
		}
		public void setActivityImage(Blob activityImage) {
			this.activityImage = activityImage;
		}
		
		



		@Transient
		private MultipartFile	productImage;  	
		
		public MultipartFile getProductImage() {
			return productImage;
		}
		
		public void setProductImage(MultipartFile productImage) {
			this.productImage = productImage;
		}
		
	
		public Blob getCoverImage() {
			return coverImage;
		}
		public void setCoverImage(Blob coverImage) {
			this.coverImage = coverImage;
		}
		
		
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		





		public activityBean(Integer activityId, String activityTitle, String activityContent, 
				Blob activityPicture, Integer category, String createTime,String fileName,
				Integer activityWatched, String activityAuthor, String activityLikes, Blob activityImage,
				String activityMainContent,Integer status,Blob coverImage,String startTime,Integer activityNumber	,String endTime
				) {
			this.activityId = activityId;
			this.activityTitle = activityTitle;
			this.activityContent = activityContent;
			this.activityImage = activityImage;
			this.category = category;
			this.createTime = createTime;
			this.activityWatched = activityWatched;
			this.activityAuthor = activityAuthor;
			this.activityLikes = activityLikes;
			this.fileName = fileName;
			this.activityMainContent = activityMainContent;
			this.coverImage = coverImage;
			this.status = status;
			this.startTime = startTime;
			this.endTime = endTime;
			this.activityNumber = activityNumber;
		}
	
		
			

		public Integer getActivityNumber() {
			return activityNumber;
		}
		public void setActivityNumber(Integer activityNumber) {
			this.activityNumber = activityNumber;
		}
		public activityBean() {		
		}
		public Integer getActivityId() {
			return activityId;
		}
		public void setActivityId(Integer activityId) {
			this.activityId = activityId;
		}
		public String getActivityTitle() {
			return activityTitle;
		}
		public void setActivityTitle(String activityTitle) {
			this.activityTitle = activityTitle;
		}
		public String getActivityContent() {
			return activityContent;
		}
		public void setActivityContent(String activityContent) {
			this.activityContent = activityContent;
		}

		
		
		
		public Integer getCategory() {
			return category;
		}

		
		
		
		
		public String getEndTime() {
			return endTime;
		}
		public void setEndTime(String endTime) {
			this.endTime = endTime;
		}
		public String getStartTime() {
			return startTime;
		}
		public void setStartTime(String startTime) {
			this.startTime = startTime;
		}
		public void setCategory(Integer category) {
			this.category = category;
		}
		public void setCreateTime(String createTime) {
			this.createTime = createTime;
		}
		public String getCreateTime() {
			return createTime;
		}

		public Integer getActivityWatched() {
			return activityWatched;
		}
		public void setActivityWatched(Integer activityWatched) {
			this.activityWatched = activityWatched;
		}
		public String getActivityAuthor() {
			return activityAuthor;
		}
		public void setActivityAuthor(String activityAuthor) {
			this.activityAuthor = activityAuthor;
		}
		public String getActivityLikes() {
			return activityLikes;
		}
		public void setActivityLikes(String activityLikes) {
			this.activityLikes = activityLikes;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		
		
	


		
		
	
		
		
		
}
