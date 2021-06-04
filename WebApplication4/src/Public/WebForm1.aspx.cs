using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using Newtonsoft.Json;
using WebApplication4.src.DAO;
using WebApplication4.src.Helper;

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
            Formulario formulario = new Formulario("Anderson", "28", "12312421412", id);
            DataTable dtDados = ConexaoOracle.RetornaDados("select id, nome, tamanho from teste_anexo where rownum <= 1 order by id desc");
            formulario.nomeArquivo = dtDados.Rows[0]["NOME"].ToString();
            formulario.tamanhoArquivo = dtDados.Rows[0]["TAMANHO"].ToString();

            formulario.linkDownload = $"<a style='color: #423a3a; font-size: 10pt' href='GetFile.ashx?idAnexo={dtDados.Rows[0]["ID"]}' target='_blank'>Baixar</a>";

            return JsonConvert.SerializeObject(formulario);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (uploadDocumentos.HasFiles)
            {
                foreach (HttpPostedFile file in uploadDocumentos.PostedFiles)
                {
                    string nomeArquivo = file.FileName;
                    string extensao = Path.GetExtension(nomeArquivo);

                    if (extensao.ToUpper().Equals(".PNG") || extensao.ToUpper().Equals(".PDF") || extensao.ToUpper().Equals(".DOCX") || extensao.ToUpper().Equals(".JPG"))
                    {
                        string tamanhoConvertido = "";
                        int tamanhoDoArquivo = file.ContentLength;
                        tamanhoDoArquivo = Utilitarios.divideTamanho(tamanhoDoArquivo);
                        if (tamanhoDoArquivo < 1024)
                        {
                            tamanhoConvertido = tamanhoDoArquivo.ToString() + "KB";
                        }
                        else
                        {
                            tamanhoDoArquivo = Utilitarios.divideTamanho(tamanhoDoArquivo);
                            tamanhoConvertido = tamanhoDoArquivo.ToString() + "MB";
                        }

                        System.IO.Stream fs = file.InputStream;
                        byte[] bytes = Utilitarios.fileStreamByte(fs, file.ContentLength);


                        ConexaoOracle.InsereAnexo(bytes, nomeArquivo, tamanhoConvertido);
                    }
                    else
                    {
                        throw new Exception("Formato de arquivo inválido, favor anexar arquivos em um destes formatos: .png, .pdf, .docx ou .jpg");
                    }
                }
            }
        }
    }
}