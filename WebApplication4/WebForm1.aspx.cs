using System;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using Newtonsoft.Json;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = false)]
        public static string GetData(string id)
        {
            Pessoa pessoa = new Pessoa("Anderson", "28", "12312421412", id);
            return JsonConvert.SerializeObject(pessoa);
        }



    }
}