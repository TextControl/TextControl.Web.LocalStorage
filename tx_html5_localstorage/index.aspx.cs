using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tx_html5_localstorage
{
    public partial class index : System.Web.UI.Page
    {
        protected void btnStore_Click(object sender, EventArgs e)
        {
            // save the document and store in a hidden field
            // as a Base64 encoded string
            byte[] data;
            TextControl1.SaveText(out data, 
                TXTextControl.Web.BinaryStreamType.InternalUnicodeFormat);

            hiddenDocument.Value = Convert.ToBase64String(data);

            // call the 'storeDocument()' JS function
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(
              this, this.GetType(),
              "CallStoreDocument",
              "storeDocument();", true);
        }
    }
}