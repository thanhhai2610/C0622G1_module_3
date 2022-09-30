package service.iml;

import model.Product;
import responsitory.IProductResponsitory;
import responsitory.iml.ProductResponsitory;
import service.IProductService;


import java.util.List;


public class ProductService implements IProductService {
  private IProductResponsitory productResponsitory = new ProductResponsitory();

    @Override
    public List<Product> findAll() {
        return productResponsitory.findAll() ;
    }

    @Override
    public void add(Product product) {
        productResponsitory.add(product);
    }

    @Override
    public Product findById(int id) {
        return productResponsitory.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productResponsitory.update(id, product);
    }

    @Override
    public void remove(int id) {
        productResponsitory.remove(id);
    }
}
