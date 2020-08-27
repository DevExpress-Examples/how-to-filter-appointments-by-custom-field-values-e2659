﻿<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraScheduler" TagPrefix="dx" %>

<%@ Register Src="~/CustomSchedulerForms/CustomVerticalAppointmentTemplate.ascx"
    TagName="CustomVerticalAppointmentTemplate" TagPrefix="cat" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
        <b>Filter By Price:</b>
        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" SelectedIndex="0" Width="100px" ValueType="System.String">
            <Items>
                <dx:ListEditItem Selected="True" Text="[Show All]" Value="[Show All]" />
                <dx:ListEditItem Text="0" Value="0" />
                <dx:ListEditItem Text="7" Value="7" />
                <dx:ListEditItem Text="7.5" Value="7.5" />
                <dx:ListEditItem Text="8" Value="8" />
                <dx:ListEditItem Text="10" Value="10" />
            </Items>
            <ClientSideEvents SelectedIndexChanged="function(s, e) {
    document.getElementById('HiddenField1').value = s.GetText();
    scheduler.Refresh();
}" />

        </dx:ASPxComboBox>
        </p>
        <asp:HiddenField ID="HiddenField1" runat="server" />

        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ClientInstanceName="scheduler" ActiveViewType="WorkWeek" 
            onfilterappointment="ASPxScheduler1_FilterAppointment">
            <OptionsCustomization AllowAppointmentCreate="None" AllowAppointmentEdit="None" AllowAppointmentDelete="None" />
            <Storage>
                <Appointments ResourceSharing="True">
                    <Mappings 
                        AppointmentId="ID" 
                        AllDay="AllDay" 
                        Description="Description" 
                        End="EndTime"
                        Label="Label" 
                        Location="Location" 
                        RecurrenceInfo="RecurrenceInfo" 
                        ReminderInfo="ReminderInfo"
                        ResourceId="CarId" 
                        Start="StartTime" 
                        Status="Status" 
                        Subject="Subject" 
                        Type="EventType" />

                        <CustomFieldMappings>
                        <dxwschs:ASPxAppointmentCustomFieldMapping Member="Price" Name="Price" />
                    </CustomFieldMappings>

                </Appointments>
            </Storage>

            <Views>
                <DayView>
                    <Templates>
                        <VerticalAppointmentTemplate>
                            <cat:CustomVerticalAppointmentTemplate runat="server" />
                        </VerticalAppointmentTemplate>
                    </Templates>
                </DayView>
                <WorkWeekView>
                    <Templates>
                        <VerticalAppointmentTemplate>
                            <cat:CustomVerticalAppointmentTemplate runat="server" />
                        </VerticalAppointmentTemplate>
                    </Templates>
                </WorkWeekView>
            </Views>

        </dxwschs:ASPxScheduler>
    </div>
    </form>
</body>
</html>