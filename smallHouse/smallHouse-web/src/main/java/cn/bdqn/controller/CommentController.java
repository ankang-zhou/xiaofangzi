package cn.bdqn.controller;

import cn.bdqn.domain.Comment;
import cn.bdqn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService service;

    @RequestMapping("/show")
    public String show(Model model){

        List<Comment> list = service.selectCommentById(1);

        for (Comment com:list
             ) {
            System.out.println(com.getCommentId());
            com.setReplyComment(service.selectReplyCommentByCommentId(com));
        }

        model.addAttribute("comments",list);

        return "comment";
    }

    @RequestMapping("/AddComment")
    public String addComment(Comment comment){
        System.out.println("123");
        System.out.println(comment.getCommentContent());
        System.out.println(comment.getArticleId());
        System.out.println(comment.getCommentRevert());
        System.out.println(comment.getCommentReply());
        comment.setCommentState(1);
        comment.setCommentTime(new Date());

        service.insertComment(comment);

        return "forward:/comment/show";

    }

}
