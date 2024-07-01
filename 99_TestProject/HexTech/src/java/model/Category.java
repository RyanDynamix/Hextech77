
package model;

public class Category {
    private int category;
    private String name;
    private int ParentCategoryID;

    public Category() {
    }

    public Category(int category, String name, int ParentCategoryID) {
        this.category = category;
        this.name = name;
        this.ParentCategoryID = ParentCategoryID;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentCategoryID() {
        return ParentCategoryID;
    }

    public void setParentCategoryID(int ParentCategoryID) {
        this.ParentCategoryID = ParentCategoryID;
    }

    @Override
    public String toString() {
        return "Category{" + "category=" + category + ", name=" + name + ", ParentCategoryID=" + ParentCategoryID + '}';
    }
    
}
