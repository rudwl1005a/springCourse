package org.zerock.controller.project1;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.project1.BoardVO;
import org.zerock.domain.project1.PageInfoVO;
import org.zerock.service.project1.BoardService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void list(@RequestParam(value="page", defaultValue = "1") Integer page, Model model) {

		// defaultValue = "1"
		/* if (page == null) {page = 1;} */
		
		Integer numberPerPage = 10; // 한 페이지의 레코드 수
		
		// 3. business logic
//		List<BoardVO> list = service.getList();
		List<BoardVO> list = service.getListPage(page, numberPerPage);	
		PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage);
		
		
		// 4. add attribute
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		// 5. forward / redirect
		// jsp path : /WEB-INF/views/board/list.jsp
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") Integer id, Model model) {
		BoardVO board = service.get(id);
		
		model.addAttribute("board", board);
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr){
		
		// 목록 조회로 redirect
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", board.getId() + "번 게시글이 수정되었습니다.");
		}
		return "redirect:/board/list";
		
		// 수정하던 게시물 조회로 redirect
//		if(service.modify(board)) {
//			rttr.addAttribute("id", board.getId());
//		}
//		return "redirect:/board/get";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		// 3. business logic
		service.register(board);

		// 4. add attribute -> 방금 등록한 id사용하기 위함
		rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");
		
		// 5. forward / redirect
		// 책:목록으로 redirect
		return "redirect:/board/list";
	}

	// 위에 get이랑 같은 일을 하니까 배열로 둘다 처리 하게끔 만들어주자
//	@GetMapping("/modify")
//	public void modify(@RequestParam("id") Integer id, Model model) {
//		BoardVO board = service.get(id);
//		
//		model.addAttribute("board", board);
//	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr) {
		
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", id + "번 게시글이 삭제되었습니다.");
		}
		
		return "redirect:/board/list";
	}
	
}
