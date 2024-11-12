package repository;

import model.Comment;

import java.util.List;

public interface IBasicSelectCommentRepository {
    List<Comment> getCommentsByUser(String id);

    List<Comment> getCommentsByPost(String id);

    long getCountAllComments();

    long getCountCommentsByUser(String id);

    long getCountCommentsByPost(String id);
}
