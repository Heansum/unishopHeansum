package com.cos.unishop.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.unishop.bucket.Bucket;
import com.cos.unishop.bucket.BucketProducts;
import com.cos.unishop.bucket.BucketProductsRepository;
import com.cos.unishop.bucket.BucketRepository;
import com.cos.unishop.domain.post.Post;
import com.cos.unishop.domain.post.PostRepository;
import com.cos.unishop.domain.user.User;
import com.cos.unishop.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BucketController {
	
	private final HttpSession session;
	private final PostRepository postRepository;
	private final BucketRepository bucketRepository;
	private final UserRepository userRepository;
	private final BucketProductsRepository bucketProductsRepository;
	
	@PostMapping("/bucket")
	public @ResponseBody String input(@RequestBody BucketProducts bucket) {
		
		User principal = (User) session.getAttribute("principal");
		
		System.out.println(bucket.getProductname());
		System.out.println(principal.getId());
		System.out.println(bucketProductsRepository.mFindByUserId(principal.getId()));
		
		bucket.setUser(principal);
		bucketProductsRepository.save(bucket);
		System.out.println("나 때려짐? input PostMapping");
		

		return "ok";
	}
	
	
	
	

	
	@GetMapping("/bucket/{id}")
	public String showBucket(@PathVariable int id, Model model) {
		System.out.println("get 장바구니 나실행됨?");
		// 들어오는 id는 principal id임
		
		List<BucketProducts> bucketProductsEntity = bucketProductsRepository.mFindAllByProductId(id);
//		User userEntity = userRepository.findById(id).get();
//		List<Bucket> bucketEntity = userEntity.getBucket();
		
		
		System.out.println("마지막 나실행됨>?");
//		Bucket bucketEntity = bucketRepository.findById(id).get();
		model.addAttribute("bucketProductsEntity",bucketProductsEntity);
		return "user/bucket";
	}
	
	
}
