package com.cos.unishop.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
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
		
		System.out.println("유저가 선택한 상품 이름 : " + bucket.getProductname());
		System.out.println("유저의 프라이머리 키: " + principal.getId());
		System.out.println(bucketProductsRepository.mFindByUserId(principal.getId()));
		
		String UserChoiceProductName = bucket.getProductname();
		List<String> bucketEntityProNameList = null;
		bucketEntityProNameList = bucketProductsRepository.mFindByUserId(principal.getId());
		
		
		int size = bucketEntityProNameList.size();
		System.out.println("리스트 사이즈 : "+size);
		// 고객이 상품을 조금이라도 넣었을 때
		
		// 만약 고객이 선택한 것 중에 같은 것이 있으면
		// num의 값을 높여서 save 하지 않도록 넘긴다.
		int num = 0;
		for(int i=0; i< size ; i++) {
			if(UserChoiceProductName.equals(bucketEntityProNameList.get(i))) {
				System.out.println(UserChoiceProductName+" : 유저가 선택한 이름이에요!");
				System.out.println(bucketEntityProNameList.get(i)+"for문안의 이름 값이에요!"+ "인덱스번호: "+i);
				num ++;
				if(i==size-1) {
					return "no";	
				}
				
			} 
		}
		
		// for문 다돌고나면
		// num의 값을 선택하여 save할지 유무를 정한다
		
		if(num != 0) {
			// 없으면 버킷에 저장한다
			
			bucket.setUser(principal);
			bucketProductsRepository.save(bucket);
			System.out.println("나 때려짐? input PostMapping");
			return "ok";
		}
		
		
		// 고객이 상품을 아예 안넣었을 때
		// 없으면 버킷에 저장한다
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
