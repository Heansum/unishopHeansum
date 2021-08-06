package com.cos.unishop.bucket;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.cos.unishop.domain.post.Post;
import com.cos.unishop.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@Entity
public class BucketProducts {
// 장바구니 DB입니다
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JoinColumn(name = "user_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private User user; 
	

//	@ManyToOne
//	private Bucket bucket;
//	private Post product;
//	{
//	private int id;
//	
//	private String productname;
//	private String image;
//	private String detail;
//	private int price;
//	private String size;
//	private String category;
//	}
	
	private int count;
	
//	@JoinColumn(name = "total_payment")
	private int totalPayment;
	
	private String productname;
	private String image;
	private String size;
	private int price;
	
}
