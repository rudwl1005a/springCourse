package org.zerock.controller.project1;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.project1.MemberVO;
import org.zerock.service.project1.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute("member") MemberVO member, RedirectAttributes rttr, Model model) {
		
		MemberVO m = service.read(member.getId());
		
		if(m == null) {
			boolean ok = service.register(member);
			
			if(ok) {
				rttr.addFlashAttribute("result", "회원가입이 완료되었습니다.");
				return "redirect:/board/list";
			}
			else {
				return "redirect:/member/signup";
			}			
		}
		else {
			model.addAttribute("alertMessage", "중복된 아이디 입니다.");
			return null;
		}
		
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(String id, String password, HttpSession session) {
		
		// service 사용해서 아이디로 MemberVO 얻고
		MemberVO vo = service.read(id);
		
		
		// MemberVO가 null이거나 패스워드가 다르면 로그인 실패		
		if(vo == null) {
			// 로그인 실패
			return null;
		}
		
		// 얻어온 MemberVO의 패스워드와 입력한 패스워드가 같은지 확인
		boolean correctPassword = password.equals(vo.getPassword());
		
		if(!correctPassword) {
			// 로그인 실패
			return null;
		}
		
		// MemberVO가 null이 아니거나 패스워드가 같으면 로그인 성공
		// 로그인 성공
		session.setAttribute("loggedInMember", vo);
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 invalidate
		session.invalidate();
		
		// /board/list redirect
		return "redirect:/board/list";
	}
	
	@GetMapping("/info")
	public String info(HttpSession session) {
		/* filter로 처리
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		
		// 로그아웃 상태
		if(vo == null) {
			return "redirect:/member/login";
		}
		*/
		
		// 로그인된 상태
		return null;
	}
	
	@PostMapping("/info")
	public String info(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		/* filter로 처리
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		
		// 로그아웃 상태
		if(vo == null) {
			return "redirect:/member/login";
		}
		*/
		
		// 로그인된 상태
		boolean ok = service.modify(member);
		if(ok) {
			rttr.addFlashAttribute("result", "회원 정보가 변경되었습니다.");
			// 세션에 있는 정보 변경
			session.setAttribute("loggedInMember", service.read(member.getId()));
		}
		else {
			rttr.addFlashAttribute("result", "회원 정보가 변경되지 않았습니다.");			
		}
		
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(String id, HttpSession session, RedirectAttributes rttr) {
		/* filter로 처리
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		
		// 로그아웃 상태
		if(vo == null) {
			return "redirect:/member/login";
		}
		*/
		
		// 로그인 된 상태
		service.remove(id);
		
		session.invalidate();
		
		rttr.addFlashAttribute("result", "회원 탈퇴하였습니다.");
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		/* filter로 처리
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		
		// 로그아웃 상태
		if(vo == null) {
			return "redirect:/member/login";
		}
		*/
		
		// 로그인 된 상태
		List<MemberVO> list = service.getList();
		
		model.addAttribute("memberList", list);
		return null;
	}
}
