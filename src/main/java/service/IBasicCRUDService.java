package service;

import java.util.List;

public interface IBasicCRUDService<E, K> {
    void add(E e);

    void update(E e);

    void delete(K k);

    List<E> selectAll();

    E selectById(K k);
}
