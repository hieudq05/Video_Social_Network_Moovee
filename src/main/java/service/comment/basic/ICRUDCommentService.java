package service.comment.basic;

import model.defaults.Comment;
import service.interfaces.IBasicCRUDService;

import java.util.List;

public interface ICRUDCommentService extends IBasicCRUDService<Comment, Integer> {
    List<Comment> getCommentsByUser(String id);

    List<Comment> getCommentsByPost(String id);

    long getCountAllComments();

    long getCountCommentsByUser(String id);

    long getCountCommentsByPost(String id);
}
