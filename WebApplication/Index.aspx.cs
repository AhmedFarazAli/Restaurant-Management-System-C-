using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AHMEDSSYSTEM;Initial Catalog=suppliers;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Close();
            }

            try
            {
                con.Open();

                SqlCommand cmdShow = new SqlCommand("SELECT * FROM Inventory", con);
                SqlDataReader reader = cmdShow.ExecuteReader();

                datagrid.DataSource = reader;
                datagrid.DataBind();

                con.Close();
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Insert(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    con.Open();

                    SqlCommand cmdInsert = new SqlCommand("INSERT INTO Inventory VALUES('" + pid.Text + "','" + pname.Text + "', '" + cat.Text + "', '" + quant.Text + "', '" + sname.Text + "')", con);
                    cmdInsert.ExecuteNonQuery();

                    Response.Write("<script> alert('Product Successfully Added') </script>");

                    pname.Text = "";
                    cat.Text = "";
                    quant.Text = "";
                    sname.Text = "";

                    con.Close();

                    Page_Load(sender, e);
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void Update(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    con.Open();

                    SqlCommand findID = new SqlCommand("SELECT * FROM Inventory WHERE ProductID = '" + pid.Text + "'", con);
                    SqlDataReader rd = findID.ExecuteReader();

                    if (rd.HasRows)
                    {
                        if (pname.Text != "")
                        {
                            SqlCommand cmdUpdate1 = new SqlCommand("UPDATE Inventory SET ProductName = '" + pname.Text + "' WHERE ProductID = '" + pid.Text + "'", con);
                            cmdUpdate1.ExecuteNonQuery();

                            Response.Write("<script> alert('Product Successfully Updated') </script>");
                        }

                        if (cat.Text != "")
                        {
                            SqlCommand cmdUpdate2 = new SqlCommand("UPDATE Inventory SET Category = '" + cat.Text + "' WHERE ProductID = '" + pid.Text + "'", con);
                            cmdUpdate2.ExecuteNonQuery();

                            Response.Write("<script> alert('Product Successfully Updated') </script>");
                        }

                        if (quant.Text != "")
                        {
                            SqlCommand cmdUpdate3 = new SqlCommand("UPDATE Inventory SET Region = '" + quant.Text + "' WHERE ProductID = '" + pid.Text + "'", con);
                            cmdUpdate3.ExecuteNonQuery();

                            Response.Write("<script> alert('Product Successfully Updated') </script>");
                        }

                        if (sname.Text != "")
                        {
                            SqlCommand cmdUpdate4 = new SqlCommand("UPDATE Inventory SET SupplierName = '" + sname.Text + "' WHERE ProductID = '" + pid.Text + "'", con);
                            cmdUpdate4.ExecuteNonQuery();

                            Response.Write("<script> alert('Product Successfully Updated') </script>");
                        }

                        pid.Text = "";
                        con.Close();
                        Page_Load(sender, e);
                    }

                    else
                    {
                        errormsg.Text = "Product ID doesn't exist";
                    }

                    con.Close();
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void Delete(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    con.Open();


                    SqlCommand findID = new SqlCommand("SELECT * FROM Inventory WHERE ProductID = '" + pid.Text + "'", con);
                    SqlDataReader rd = findID.ExecuteReader();
                   
                    if (rd.HasRows)
                    {
                        SqlCommand cmdDelete = new SqlCommand("DELETE FROM Inventory WHERE ProductID = '" + pid.Text + "'", con);
                        cmdDelete.ExecuteNonQuery();

                        Response.Write("<script> alert('Product Successfully Deleted') </script>");

                        pid.Text = "";




                        Page_Load(sender, e);
                    }

                    else
                    {
                        errormsg.Text = "Product ID doesn't exist";
                    }

                    con.Close();
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}