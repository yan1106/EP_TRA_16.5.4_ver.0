<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EP_Category_Add.aspx.cs" Inherits="EP_Category_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EP_Category_Add</title>
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="../JS/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js"></script>
<script src="../JS/jquery-ui-1.9.2/jquery-1.10.0.min.js" type="text/javascript"></script>    
<script src="../JS/jquery-ui-1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="../JS/jquery-ui-1.9.2/jquery-ui.css" rel="stylesheet" type="text/css" />  
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="Panel_Packge" runat="server">
    <fieldset style="width:95%; " class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">Category Information</legend> 
      <table> 
          <tr>
              <td>Category_Stage:<asp:DropDownList ID="cate_Staege_DDL" runat="server"></asp:DropDownList></td>
              <td>Category_Name:</td>             
              <td><asp:TextBox ID="Text_Category" runat="server"></asp:TextBox></td>
              <td><asp:Button ID="butSearch" runat="server" Text="Search" 
                    class="blueButton button2" onclick="butSearch_Click"/></td>
              
          </tr> 
          
      </table>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
        <hr />     
               
        <asp:GridView ID="GD_CATE" runat="server" AutoGenerateColumns="False" CellPadding="3" OnRowCommand="GD_CAP_RowCommand" OnSelectedIndexChanged="GD_CAP_SelectedIndexChanged" OnRowDeleting="GD_CAP_RowDeleting1" OnRowUpdating="GD_CAP_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" OnPageIndexChanged="GD_CAP_PageIndexChanged" OnPageIndexChanging="GD_CAP_PageIndexChanging" PageSize="6"
            >

    <PagerTemplate>
    <asp:LinkButton ID="cmdFirstPage" CssClass="navigate" runat="server" CommandName="Page"
        CommandArgument="First" Visible="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>">
    <img src="image/first.gif" height="16px" /></asp:LinkButton>
    <asp:LinkButton ID="cmdPreview" CssClass="navigate" runat="server" CommandArgument="Prev"
        CommandName="Page" Visible="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>"><img src="image/previous.png"  style="background-color:Transparent;"  /></asp:LinkButton>
    第
    <asp:Label ID="lblcurPage" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1      %>'></asp:Label>頁/共<asp:Label
        ID="lblPageCount" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageCount %>'></asp:Label>頁
    <asp:LinkButton ID="cmdNext" CssClass="navigate" runat="server" CommandName="Page"
        CommandArgument="Next" Visible="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>"><img src="image/next.png"  style="background-color:Transparent;"  /></asp:LinkButton>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">


        </asp:DropDownList>
    
    </PagerTemplate>




            <HeaderStyle  BorderColor="White" BorderWidth="4px"  BorderStyle="Solid"  />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <HeaderTemplate>
                        <asp:Button ID="btnInsert" runat="server" CausesValidation="False" class="blueButton button2" CommandName="Insert" Text="New Capability" />
                    </HeaderTemplate>
                    <ItemTemplate>                        
                        <asp:ImageButton ID="ImageButton_View" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="View" ImageUrl="icon/view.jpg" />
                        <asp:ImageButton ID="ImageButton2_Update" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Update" ImageUrl="icon/update.jpg" />
                        <asp:ImageButton ID="ImageButton3_Delete" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Delete" ImageUrl="icon/delete.jpg" OnClientClick="return confirm('是否刪除？');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="npi_EP_Cate_Username" HeaderText="User" />
                <asp:BoundField DataField="npi_EP_Cate_UpdateTime" HeaderText="UpdateTime" />
                <asp:BoundField DataField="EP_Cate_Stage" HeaderText="Effect  Stage" />
                <asp:BoundField DataField="EP_Cate_Iiitems" HeaderText="Input Items" />
                <asp:BoundField DataField="EP_Cate_SpeChar" HeaderText="Special Characteristics" />
                <asp:BoundField DataField="EP_Cate_Md" HeaderText="Methodology" />
                <asp:BoundField DataField="EP_Cate_Cate" HeaderText="Category" />
                <asp:BoundField DataField="EP_Cate_KP" HeaderText="Key parameter" />
            </Columns>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" CssClass="style-GD" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            
            
        </asp:GridView>
         </asp:Panel>                            
        <br />
</form>
</body>    
</html>     