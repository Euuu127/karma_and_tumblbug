package com.karma_and_tumblbug.p1.shipping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.karma_and_tumblbug.p1.util.Pager;

@Controller
@RequestMapping("/shipping/**")
public class ShippingController {
	
	@Autowired
	private ShippingService shippingService;
	
	
	//업데이트
	@PostMapping("shippingUpdate")
	public ModelAndView setUpdate(ShippingDTO shippingDTO, ModelAndView mv)throws Exception{
		int result = shippingService.setUpdate(shippingDTO);
		if(result>0) {
			//성공시 리스트로
			mv.setViewName("redirect:./shippingList");
		}else {
			mv.addObject("msg", "X 수정 실패 X");
			mv.addObject("path", "./shippingList");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}
	
	@GetMapping("shippingUpdate")
	public ModelAndView setUpdate(ShippingDTO shippingDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		shippingDTO = shippingService.getSelect(shippingDTO);
		mv.addObject("dto", shippingDTO);
		mv.setViewName("shipping/shippingUpdate");
		
		return mv;
	}
	
	//삭제
	@PostMapping("shippingDelete")
	public ModelAndView setDelete(ShippingDTO shippingDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = shippingService.setDelete(shippingDTO);
		
		String message = "X 삭제 실패 X";
		String path = "./shippingList";
		
		if(result>0) {
			message="O 삭제 성공 O";
		}
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("common/commonResult");
		return mv;
	}
	
	//삽입
	@PostMapping("shippingInsert")
	public String setInsert(ShippingDTO shippingDTO, Model model)throws Exception{
		int result = shippingService.setInsert(shippingDTO);
		String message = "X 배송지 등록 실패 X";
		
		if(result>0) {
			message="배송지 등록 성공";
		}
		model.addAttribute("msg", message);
		model.addAttribute("path", "./shippingList");
		
		return "common/commonResult";
		
	}
	
	@GetMapping("shippingInsert")
	public void setInsert(ShippingDTO shippingDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", shippingDTO);
		mv.setViewName("shipping/shippingInsert");
	}
	
	//리스트
	@RequestMapping("shippingList")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(pager.getCurPage());
		
		List<ShippingDTO> ar = shippingService.getList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("shipping/shippingList");
		mv.addObject("pager", pager);
		return mv;
	}
	
	//셀렉트
	@GetMapping("shippingSelect")
	public ModelAndView getSelect(ShippingDTO shippingDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		shippingDTO = shippingService.getSelect(shippingDTO);
		mv.addObject("dto", shippingDTO);
		mv.setViewName("shpping/shippingSelect");
		return mv;
	}
	

	

}