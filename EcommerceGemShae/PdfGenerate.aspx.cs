using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceGemShae
{
    public partial class PdfGenerate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Session["orderid"].ToString();
            OrderNumLabel.Text = orderId;

            FindOrderDateTime();

            string address = Session["address"].ToString();
            BuyerAddLabel.Text = address;

            ShowGrid(OrderNumLabel.Text);
        }

        [Obsolete]
        protected void DownloadButton_Click(object sender, EventArgs e)
        {
            ExportPdf();
        }

        //My Functions
        [Obsolete]
        public void ExportPdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

            Panel1.RenderControl(htmlTextWriter);

            StringReader stringReader = new StringReader(stringWriter.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlParser.Parse(stringReader);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        public void FindOrderDateTime()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OrderTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string selectOrder = "select * from orderdetails_master where order_id='" + OrderNumLabel.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(selectOrder, conn)
                {
                    Connection = conn
                };

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = cmd;

                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);

                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    OrderDTLabel.Text = dataSet.Tables[0].Rows[0]["date_time"].ToString();
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public void ShowGrid(String orderId)
        {
            DataTable dataTable = new DataTable();
            DataRow dataRow;

            dataTable.Columns.Add("item_num");
            dataTable.Columns.Add("product_id");
            dataTable.Columns.Add("product_name");
            dataTable.Columns.Add("quantity");
            dataTable.Columns.Add("product_cost");
            dataTable.Columns.Add("subtotal");

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OrderTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string selectOrder = "select * from orderdetails_master where order_id='" + OrderNumLabel.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(selectOrder, conn)
                {
                    Connection = conn
                };

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                sqlDataAdapter.SelectCommand = cmd;

                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);

                int totalRows = dataSet.Tables[0].Rows.Count;
                int i = 0;
                int grandTotal = 0;
                
                while (i < totalRows)
                {
                    dataRow = dataTable.NewRow();
                    dataRow["item_num"] = dataSet.Tables[0].Rows[i]["item_num"].ToString();
                    dataRow["product_id"] = dataSet.Tables[0].Rows[i]["product_id"].ToString();
                    dataRow["product_name"] = dataSet.Tables[0].Rows[i]["product_name"].ToString();
                    dataRow["quantity"] = dataSet.Tables[0].Rows[i]["quantity"].ToString();
                    dataRow["product_cost"] = dataSet.Tables[0].Rows[i]["product_cost"].ToString();
                    dataRow["subtotal"] = dataSet.Tables[0].Rows[i]["subtotal"].ToString();

                    grandTotal = grandTotal + Convert.ToInt32(dataSet.Tables[0].Rows[i]["subtotal"].ToString());
                    dataTable.Rows.Add(dataRow);
                    i++;
                }

                GridView1.DataSource = dataTable;
                GridView1.DataBind();

                GrandTLabel.Text = grandTotal.ToString();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
    }
}