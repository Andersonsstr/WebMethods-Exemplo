using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using WebApplication4.src.DAO;

namespace WebApplication4.src.Public
{
    /// <summary>
    /// Summary description for GetFile
    /// </summary>
    public class GetFile : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            if (context.Request.Url.ToString().Contains("idAnexo"))
            {
                string idArquivo = context.Request.QueryString["idAnexo"];

                DataTable dtDados = ConexaoOracle.RetornaDados($"select nome, anexo from teste_anexo where id = {idArquivo}");

                byte[] conteudo = (byte[])dtDados.Rows[0]["ANEXO"];

                string attachment = $"attachment; filename=" + dtDados.Rows[0]["NOME"].ToString();
                context.Response.ClearContent();
                //context.Response.ContentType = "image/jpeg";
                context.Response.AddHeader("content-disposition", attachment);
                context.Response.BinaryWrite(conteudo);
                context.Response.End();

            }
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}