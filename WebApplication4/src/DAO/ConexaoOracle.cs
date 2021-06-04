using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace WebApplication4.src.DAO
{
    public class ConexaoOracle
    {
        public static string connectionStringhmg = WebConfigurationManager.AppSettings["OracleConnectionString"];
        public static void InsereAnexo(byte[] anexo, string nome_arquivo, string tamanho)
        {
            OracleConnection con = new OracleConnection(connectionStringhmg);
            OracleCommand comandosql = new OracleCommand();

                comandosql.CommandText = $"insert into teste_anexo values ('', :anexo, '{nome_arquivo}', '{tamanho}')";
                comandosql.Parameters.Add(":anexo", anexo);
                comandosql.Connection = con;

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                comandosql.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine("Falha de conexão com o banco de dados! " + ex.Message);
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

        public static DataTable RetornaDados(string select)
        {
            OracleConnection con = new OracleConnection(connectionStringhmg);
            DataTable ds = new DataTable();

            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                OracleDataAdapter Adapter = new OracleDataAdapter(select, con);
                Adapter.Fill(ds);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
            return ds;
        }
    }
}