package repository;

import java.util.List;

public interface ICrudRepository<E> {
    List<E> search(String country);
}
