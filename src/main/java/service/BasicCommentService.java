package service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Comment;
import repository.CommentRepository;
import repository.ICommentRepository;

import java.util.List;

public class BasicCommentService implements IBasicCommentService {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");
    ICommentRepository commentRepository = new CommentRepository();

    @Override
    public List<Comment> getCommentsByUser(String id) {
        return commentRepository.getCommentsByUser(id);
    }

    @Override
    public List<Comment> getCommentsByPost(String id) {
        return commentRepository.getCommentsByPost(id);
    }

    @Override
    public long getCountAllComments() {
        return commentRepository.getCountAllComments();
    }

    @Override
    public long getCountCommentsByUser(String id) {
        return commentRepository.getCountCommentsByUser(id);
    }

    @Override
    public long getCountCommentsByPost(String id) {
        return commentRepository.getCountCommentsByPost(id);
    }

    @Override
    public void add(Comment comment) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            commentRepository.add(comment, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Comment comment) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            commentRepository.update(comment, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void delete(Integer id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            commentRepository.delete(id, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Comment> selectAll() {
        return commentRepository.selectAll();
    }

    @Override
    public Comment selectById(Integer id) {
        return commentRepository.selectById(id);
    }
}