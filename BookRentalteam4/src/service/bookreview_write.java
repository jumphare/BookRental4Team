package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import dao.review_board_dao;
import dto.review_board_dto;

public class bookreview_write implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("Review");
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=UTF-8");

		String path = request.getRealPath("rb_upload");
		System.out.println("path: "+path);
		int size = 10*1024*1024;
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MultipartRequest multi = new MultipartRequest(request,
													  path, //업로드 경로
													  size, //파일 크기
													  "utf-8", //파일명 (한글일 경우) 인코딩
													  new DefaultFileRenamePolicy()); //중복 파일명 해결
		
		review_board_dto rb=new review_board_dto();
		rb.setId(id);
		rb.setRb_Subject(multi.getParameter("rb_subject"));
		rb.setRb_Content(multi.getParameter("rb_content"));
		rb.setRb_File(multi.getFilesystemName("rb_file"));
	
		
		review_board_dao dao= review_board_dao.getInstance();	
		int result = dao.insert(rb);
		if(result == 1) System.out.println("작성 완료");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/ReviewListAction.do");
		return forward;

	}

}
