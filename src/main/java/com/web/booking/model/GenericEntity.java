package com.web.booking.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

@MappedSuperclass
public class GenericEntity implements Serializable {
	private static final long serialVersionUID = -3046603780142649202L;

	@Column(name = "CRT_TIME", nullable = false)
	private LocalDateTime createTime;
	@Column(name = "UPD_TIME")
	private LocalDateTime updateTime;
	// @Column(name = "UPD_TIME")
	// @LastModifiedDate
	// private LocalDateTime updateTime;

	@PrePersist
	public void prePersist() {
		this.createTime = LocalDateTime.now();
	}

	@PreUpdate
	public void preUpdate() {
		this.updateTime = LocalDateTime.now();
	}

	public LocalDateTime getCreateTime() {
		return createTime;
	}

	public LocalDateTime getUpdateTime() {
		return updateTime;
	}
}