package responsitory.iml;

import model.Product;
import responsitory.IProductResponsitory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductResponsitory implements IProductResponsitory {
    private static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1, "Thanh Hai", "john@codegym.vn", "Quang Nam"));
        productMap.put(2, new Product(2, "Quoc Viet", "john@codegym.vn", "Quang Nam"));
        productMap.put(3, new Product(3, "Cat Uyen", "john@codegym.vn", "Quang Nam"));
        productMap.put(4, new Product(4, "Hoang Giang", "john@codegym.vn", "Quang Nam"));
        productMap.put(5, new Product(5, "Quang Vinh", "john@codegym.vn", "Quang Nam"));
        productMap.put(6, new Product(6, "The Son", "john@codegym.vn", "Quang Nam"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }
}
