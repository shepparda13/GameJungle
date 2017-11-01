using System;
using System.Web.UI;
using System.Data;

public partial class Order : System.Web.UI.Page
{
    private Product selectedProduct;

    protected void Page_Load(object sender, EventArgs e)
    {

        {
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("Products.aspx");
            }
                     
        }

        if (!IsPostBack)

        selectedProduct = GetSelectedProduct();
        lblName.Text = selectedProduct.Name;
        lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c");
        imgProduct.ImageUrl = "Images/" + selectedProduct.ImageFile;
    }

    private Product GetSelectedProduct()
    {
        DataView productsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        DataRowView row = (DataRowView)productsTable[0];

        Product p = new Product();
        p.ProductID = row["prod_code"].ToString();
        p.Name = row["prod_name"].ToString();
        p.UnitPrice = (decimal)row["prod_price"];
        p.ImageFile = row["image_file"].ToString();
        return p;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CartItemList cart = CartItemList.GetCart();
            CartItem cartItem = cart[selectedProduct.Name];
            if (cartItem == null)
            {
                cart.AddItem(selectedProduct, Convert.ToInt32(txtQuantity.Text));
            }
            else
            {
                cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
            }
            Response.Redirect("Cart.aspx");
        }
    }
}