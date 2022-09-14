<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tx_html5_localstorage.index" %>

<%@ Register Assembly="TXTextControl.Web, Version=31.0.1100.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" Namespace="TXTextControl.Web" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web.TextControl: Save documents in local storage</title>
    <script src="Scripts/jquery-3.6.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnStore" runat="server" Text="Store document locally" OnClick="btnStore_Click" />
                <input onclick="restoreDocument()" id="btnRecover" type="button" value="Restore" />
                <asp:HiddenField ID="hiddenDocument" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <br />

        <cc1:TextControl ID="TextControl1" runat="server" />

        <script type="text/javascript">

            // Stores the content of the
            // hidden field to the local storage (Base64 string)
            function storeDocument() {
                localStorage.document = $("#hiddenDocument").val();
                showMessage("Document has been stored to local storage.");
            }

            // Loads the stored document back into the Text Control
            function restoreDocument() {
                TXTextControl.loadDocument(TXTextControl.streamType.InternalUnicodeFormat, localStorage.document);
            }

            //  shows a message box
            function showMessage(text) {
                var elemContainer = document.getElementById("txTemplateDesignerContainer");
                var elemMsg = document.createElement("DIV");
                elemMsg.id = "txErrMsgDiv";
                elemMsg.classList.add("unselectable");
                elemMsg.style.zIndex = "9999";
                text = text.replace(/\r?\n/g, "<br />");
                elemMsg.innerHTML = text;
                elemContainer.appendChild(elemMsg);
                elemMsg.style.marginTop = -(elemMsg.clientHeight / 2) + "px";
                elemMsg.style.marginLeft = -(elemMsg.clientWidth / 2) + "px";
                fadeOutAndRemove(elemMsg, elemContainer, 1000, 1000);
            }

            // fades out the message box
            function fadeOutAndRemove(elem, elemContainer, delay, time) {
                elem.style.transition = "opacity " + (time / 1000) + "s";
                setTimeout(function () {
                    elem.style.opacity = 0;
                    setTimeout(function () {
                        elemContainer.removeChild(elem);
                    }, time);
                }, delay);
            }

        </script>
    </div>
    </form>
</body>
</html>

