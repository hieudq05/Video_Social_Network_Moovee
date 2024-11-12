package service;

import model.Comment;
import java.util.List;

public interface IBasicCRUDCommentService extends IBasicCRUDService<Comment, Integer> {
    List<Comment> getCommentsByUser(String id);

    List<Comment> getCommentsByPost(String id);

    long getCountAllComments();

    long getCountCommentsByUser(String id);

    long getCountCommentsByPost(String id);
}
