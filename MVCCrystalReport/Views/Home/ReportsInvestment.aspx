<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MVCCrystalReport.Investment>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ReportsInvestment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ReportsInvestment</h2>
        <%--<div><a href="@Url.Action("ExportReport")"> Get Report in PDF</a></div>--%>
        <div><a href="http://localhost:27072/home/ExportReport/"> Get Report in PDF</a></div>
    <table>
        <tr>
            <th>
            </th>
            <th>
                InvestmentNo
            </th>
            <th>
                FirstName
            </th>
            <th>
                LastName
            </th>
            <th>
                Address
            </th>
            <th>
                MobileNo
            </th>
            <th>
                Landline
            </th>
            <th>
                OtherNo
            </th>
            <th>
                Email
            </th>
            <th>
                InvestmentAmount
            </th>
            <th>
                InvestmentDate
            </th>
            <th>
                IsActive
            </th>
            <th>
                Comment
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%--               <%: Html.ActionLink("Edit", "Edit", new { id=item.InvestmentNo }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.InvestmentNo })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.InvestmentNo })%>
                --%>
            </td>
            <td>
                <%: item.InvestmentNo %>
            </td>
            <td>
                <%: item.FirstName %>
            </td>
            <td>
                <%: item.LastName %>
            </td>
            <td>
                <%: item.Address %>
            </td>
            <td>
                <%: item.MobileNo %>
            </td>
            <td>
                <%: item.Landline %>
            </td>
            <td>
                <%: item.OtherNo %>
            </td>
            <td>
                <%: item.Email %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.InvestmentAmount) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.InvestmentDate) %>
            </td>
            <td>
                <%: item.IsActive %>
            </td>
            <td>
                <%: item.Comment %>
            </td>
        </tr>
        <% } %>
    </table>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>
