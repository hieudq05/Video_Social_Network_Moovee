package repository;

import jakarta.persistence.EntityManager;

import java.util.List;

public interface IBasicCUDRepository<E, K> {
    int add(E entity, EntityManager entityManager);

    int update(E entity, EntityManager entityManager);

    int delete(K k, EntityManager entityManager);

    List<E> selectAll();

    E selectById(K k);
}
