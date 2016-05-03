using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
public partial class EP_Category_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            DDL_DatingBind();
        }
    }


    protected void DDL_DatingBind()
    {
        string mySQL = "select DISTINCT EP_Cate_Stage from npi_ep_category ";
        int index = 0;


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader SelData = MySqlCmd.ExecuteReader();

        while (SelData.Read())
        {

            string temp = SelData["EP_Cate_Stage"].ToString();
            cate_Staege_DDL.Items.Add(new ListItem(temp,temp));
            index++;        
        }

    }

    public void bindDDL_gridview_countpage()

    {

        //讓下拉式選單顯示頁數

        DropDownList ddlSelectPage = (DropDownList)GD_CATE.BottomPagerRow.FindControl("ddlSelectPage");

        for (int i = 0; i < GD_CATE.PageCount; i++)
        {

            ddlSelectPage.Items.Add(new ListItem((i + 1).ToString(), i.ToString()));

        }

    }

    protected void butSearch_Click(object sender, EventArgs e)
    {
        clsMySQL db = new clsMySQL();
        string sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + cate_Staege_DDL.SelectedValue + "' OR ( EP_Cate_Cate='" + Text_Category.Text + "')";


        clsMySQL.DBReply dr = db.QueryDS(sql_category);
        GD_CATE.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CATE.DataBind();
        //bindDDL_gridview_countpage();
        db.Close();



    }

    protected void GD_CAP_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void GD_CAP_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GD_CAP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GD_CAP_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GD_CAP_PageIndexChanged(object sender, EventArgs e)
    {
        string sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + cate_Staege_DDL.SelectedValue + "' OR ( EP_Cate_Cate='" + Text_Category.Text + "')";
        clsMySQL db = new clsMySQL();

        clsMySQL.DBReply dr = db.QueryDS(sql_category);
        GD_CATE.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CATE.DataBind();
        db.Close();
    }

    protected void GD_CAP_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GD_CATE.PageIndex = e.NewPageIndex;

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlSelectPage = (DropDownList)GD_CATE.BottomPagerRow.FindControl("ddlSelectPage");

        int pIndex = 0;
        if (int.TryParse(ddlSelectPage.SelectedValue, out pIndex))
        {
            GD_CATE.PageIndex = pIndex;
            getData(GD_CATE, "select * from product;");
        }       
    }

    public void getData()
    {
        DataTable aTb = WebUtility.GetSQLdata("select * from product where id='0';", "teachDB");

        if (aTb.Rows.Count == 0)
        {

            aTb.Rows.Add(aTb.NewRow());

            GridView1.DataSource = aTb;
            GridView1.DataBind();


            int columnCount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());

            GridView1.Rows[0].Cells[0].ColumnSpan = columnCount;
            GridView1.Rows[0].Cells[0].Text = "無資料!";
            GridView1.RowStyle.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
        }
        else
        {
            GridView1.DataSource = aTb;
            GridView1.DataBind();
        }


    }


}