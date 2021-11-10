package com.koreait.board;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mod")
public class BoardModServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String siboard = req.getParameter("iboard");
        int iboard = Integer.parseInt(siboard);

        BoardVO param = new BoardVO();
        param.setIboard(iboard);
        BoardVO result = BoardDAO.selBoard(param);

        req.setAttribute("detail", result);
        String path = "/WEB-INF/jsp/mod.jsp";
        req.getRequestDispatcher(path).forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        BoardVO param = new BoardVO();
        String siboard = req.getParameter("iboard");
        int iboard = Integer.parseInt(siboard);
        param.setIboard(iboard);
        param.setTitle(req.getParameter("title"));
        param.setCtnt(req.getParameter("ctnt"));
        param.setWriter(req.getParameter("writer"));

        int result = BoardDAO.modBoard(param);
        switch(result) {
            case 1:
                res.sendRedirect("/detail?iboard=" + siboard);
                break;
        }
    }
}
