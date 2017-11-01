public class CartItem
{
    public Product Product { get; set; }
    public int Quantity { get; set; }

    public CartItem() { }

    public CartItem(Product product, int quantity)
    {
        this.Product = product;
        this.Quantity = quantity;
    }

    public void AddQuantity(int quantity)
    {
        this.Quantity += quantity;
    }

    public string Display()
    {
        string displayString = Product.Name + " (" + Quantity.ToString() + " at " + Product.UnitPrice.ToString("c") + " each)";
        return displayString;
    }
}