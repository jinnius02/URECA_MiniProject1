package com.ureca.person.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ureca.person.dto.Person;
import com.ureca.person.model.service.PersonService;

import jakarta.servlet.http.HttpServletRequest;

@Controller //스프링 컨테이너로 객체 관리 받고 싶어요!!
@RequestMapping("/person")
public class PersonController {
	
	@Autowired
	PersonService service;//service=null;기본값
	
/*
<컨트롤러의 역할>
1.요청분석
2.데이터 얻어오기
3.모델호출
4.모델호출 결과를 (영역에)저장
5.페이지이동 ◀ 맨 마지막에 정의 :어떻게? 리턴으로

<요청 URL>
/person/form    GET
/person/form    POST
/person/list    GET
/person/upform  GET
/person/upform  POST
/person/delete  GET


 */
	
//	@RequestMapping("/form") //요청URL정의   ==>1.
//	@RequestMapping(value = "/form", method = RequestMethod.GET) //요청URL정의   ==>1.
	@GetMapping("/form")
	public String form() {//입력폼 보이기
	  System.out.println(">>> GET form");
	  return "form";  //  "/WEB-INF/views/"+ "form"  + ".jsp"    ==> 5. forward이동	
	}
	
//	@RequestMapping(value = "/form", method = RequestMethod.POST) //요청URL정의   ==>1.
//	@PostMapping("/form")
//	public String regist(Person person, Model model) {//DB입력
//		System.out.println(">>> POST form");
//		System.out.println("person>>>"+ person);
//		
//		try {
//			service.add(person);//3.
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
////		return "redirect:/person/list";  // 5.	
//		return "redirect:list";  // 5.	
//	}
	
	@PostMapping("/form")
	public String regist(Person person, @RequestParam(value = "photo", required = false) MultipartFile file, Model model) {
	    // 파일이 제공되었고 비어 있지 않은 경우 처리
	    if (file != null && !file.isEmpty()) {
	        String fileName = file.getOriginalFilename();
	        person.setPhotoFilename(fileName);  // 파일 이름을 Person 객체에 저장

	        // 파일 저장 경로 지정
	        String uploadDir = "/Users/mostwj/Desktop/ureca/workspace/uploads";

	        // 디렉토리가 존재하지 않는 경우 생성
	        File uploadPath = new File(uploadDir);
	        if (!uploadPath.exists()) {
	            uploadPath.mkdirs();
	        }

	        // 파일 저장 경로와 파일명을 합쳐 파일 객체 생성
	        File savedFile = new File(uploadPath, fileName);

	        // 파일 저장 시도
	        try {
	            file.transferTo(savedFile);
	            model.addAttribute("message", "File uploaded successfully!");
	        } catch (IOException e) {
	            e.printStackTrace();
	            model.addAttribute("message", "Failed to upload file!");
	            return "form";  // 파일 저장 실패 시 다시 폼 페이지로 리다이렉트
	        }
	    } else {
	        // 파일이 제공되지 않은 경우 메시지 추가
	        model.addAttribute("message", "No file was uploaded.");
	    }

	    // 데이터베이스에 person 정보 저장 시도
	    try {
	        service.add(person);
	        model.addAttribute("message", "Person added successfully!");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        model.addAttribute("message", "Database error!");
	        return "form";  // 데이터베이스 오류 시 다시 폼 페이지로 리다이렉트
	    }

	    return "redirect:list";  // 성공적으로 처리된 후 목록 페이지로 리다이렉트
	}
	
	@GetMapping("/list") //1.
	public String list(Model model) { //DB목록출력
		//Model은 영역객체 중에 request와 같음
		
		try {
			//목록 테이블에 출력할 데이터 얻어오기
			List<Person> list = service.readAll(); //3.			
			
			model.addAttribute("list", list);
			//4.영역에 데이터를 저장! => 왜? 데이터를 View와 공유하기 위해
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "list";  //5.
	}
	
	@GetMapping("/upform")//  localhost:8080/person/upform?no=3
	public String upform(@RequestParam("no") int no,
			             Model model) {//수정폼 보이기
		
//		Person person = service.read(no);
//		model.addAttribute("person", person);
		
		try {
			model.addAttribute("person", service.read(no));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "upform";
	}
	
//	@PostMapping("/upform")
//	public String modify(Person person) {//DB수정 요청
//		try {
//			service.edit(person);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return "redirect:list";//수정 결과를 list페이지로 확인
//	}
	
//	@PostMapping("/upform")
//	public String modify(Person person, @RequestParam(value = "photo", required = false) MultipartFile file, Model model, HttpServletRequest request) throws SQLException {
//	    if (file != null && !file.isEmpty()) {
//	        // 파일명 추출
//	        String fileName = file.getOriginalFilename();
//	        person.setPhotoFilename(fileName);
//
//	        // 파일 저장 경로 설정
//	        String uploadDir = request.getServletContext().getRealPath("/uploads/"); // 실제 배포된 경로를 기준으로 경로 설정
//
//	        File uploadPath = new File(uploadDir);
//	        if (!uploadPath.exists()) {
//	            uploadPath.mkdirs(); // 디렉토리가 존재하지 않으면 생성
//	        }
//
//	        // 파일 저장
//	        File savedFile = new File(uploadPath, fileName);
//	        try {
//	            file.transferTo(savedFile);
//	            model.addAttribute("message", "File uploaded successfully!");
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	            model.addAttribute("message", "Failed to upload file!");
//	            return "upform";
//	        }
//	    }
//
//	    try {
//	        service.edit(person);
//	        return "redirect:list";
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	        model.addAttribute("message", "Error updating person!");
//	        return "upform";
//	    }
//	}
	
	@PostMapping("/upform")
	public String modify(Person person, @RequestParam(value = "photo", required = false) MultipartFile file, Model model, HttpServletRequest request) throws SQLException {
	    if (file != null && !file.isEmpty()) {
	        String fileName = file.getOriginalFilename();
	        person.setPhotoFilename(fileName);

	        String uploadDir = request.getServletContext().getRealPath("/uploads/");

	        File uploadPath = new File(uploadDir);
	        if (!uploadPath.exists()) {
	            uploadPath.mkdirs();
	        }

	        File savedFile = new File(uploadPath, fileName);
	        try {
	            file.transferTo(savedFile);
	            model.addAttribute("message", "File uploaded successfully!");
	        } catch (IOException e) {
	            e.printStackTrace();
	            model.addAttribute("message", "Failed to upload file!");
	            return "upform";
	        }
	    } else {
	        // 파일이 업로드되지 않은 경우, 기존 파일명을 유지
	        Person existingPerson = service.read(person.getNo());
	        person.setPhotoFilename(existingPerson.getPhotoFilename());
	    }

	    try {
	        service.edit(person);
	        return "redirect:list";
	    } catch (SQLException e) {
	        e.printStackTrace();
	        model.addAttribute("message", "Error updating person!");
	        return "upform";
	    }
	}
	
	@GetMapping("/delete")//  localhost:8080/person/delete?no=3
	public String remove(@RequestParam("no") int no) {//DB삭제 요청
		try {
			service.remove(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:list";//삭제 결과를 list페이지로 확인
	}
	
	@GetMapping("/home")
	public String home() {
	    System.out.println(">>> Accessing home page");
	    return "home"; // 'home.jsp'로 연결될 뷰의 이름을 반환
	}
	
	@GetMapping("/size")
	public String sizePage() {
		System.out.println(">>> Accessing size page");
	    return "size"; // 'size.jsp' 파일로 이동
	}
	
	@GetMapping("/randomFlavors=pint")
	public String showRandomFlavors3(Model model) {
	    try {
	        List<Person> flavors = service.getRandomFlavors(3);
	        model.addAttribute("flavors", flavors);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "errorPage"; // 오류 페이지로 리다이렉션
	    }
	    return "randomFlavors=pint"; // 결과를 보여줄 JSP 페이지
	}
	
	@GetMapping("/randomFlavors=quarter")
	public String showRandomFlavors4(Model model) {
	    try {
	        List<Person> flavors = service.getRandomFlavors(4);
	        model.addAttribute("flavors", flavors);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "errorPage"; // 오류 페이지로 리다이렉션
	    }
	    return "randomFlavors=quarter"; // 결과를 보여줄 JSP 페이지
	}
	
	@GetMapping("/randomFlavors=family")
	public String showRandomFlavors5(Model model) {
	    try {
	        List<Person> flavors = service.getRandomFlavors(5);
	        model.addAttribute("flavors", flavors);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "errorPage"; // 오류 페이지로 리다이렉션
	    }
	    return "randomFlavors=family"; // 결과를 보여줄 JSP 페이지
	}
	
	@GetMapping("/randomFlavors=half-gallon")
	public String showRandomFlavors6(Model model) {
	    try {
	        List<Person> flavors = service.getRandomFlavors(6);
	        model.addAttribute("flavors", flavors);
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "errorPage"; // 오류 페이지로 리다이렉션
	    }
	    return "randomFlavors=half-gallon"; // 결과를 보여줄 JSP 페이지
	}
	
}





