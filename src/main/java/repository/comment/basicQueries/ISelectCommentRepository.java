package repository.comment.basicQueries;

import model.defaults.Comment;

import java.util.List;

public interface ISelectCommentRepository {
    List<Comment> getCommentsByUser(String id);

    List<Comment> getCommentsByPost(String id);

    long getCountAllComments();

    long getCountCommentsByUser(String id);

    long getCountCommentsByPost(String id);
}
