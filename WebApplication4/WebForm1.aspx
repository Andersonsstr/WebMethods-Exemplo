<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <title>Hello, world!</title>
</head>
<body style="background: rgb(238,174,202); background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);">
    <form id="form1" runat="server">
        <div class="container mt-4" style="border-radius: 50px; background-color: white; height: 600px; text-align: center">
            <h1 style="padding-top:6%">PageMethods</h1>
            <div id="result" class="mt-5">
                <div class="row">
                    <div class="col">
                       <h3> Nome: <label id="nome"></label></h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                      <h3> CPF:
                        <label id="cpf"></label></h3> 
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                      <h3>  Idade:
                <label id="idade"></label></h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                      <h3>  ID Botão:
                <label id="idBotao"></label></h3>
                    </div>
                </div>
                <div class="m-4">
                    <asp:Button ID="btn2" Text="Clique Aqui para Testar" CssClass="btn btn-primary" OnClientClick="teste(this.id);return false" runat="server" />
                </div>
            </div>
            <label style="bottom:0; position: fixed;">Coded by Anderson S.</label>            
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript">
        var d;
        function teste(id) {
            $.ajax({
                type: "POST",
                url: "WebForm1.aspx/GetData",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: id}),
                dataType: "json",
                success: function (result) {
                    imprimeDados(result);
                },
                error: function (error) {
                    alert(error);
                }
            });
        }

        function imprimeDados(result) {
            objeto = $.parseJSON(result.d);
            $("#nome").text(objeto.nome);
            $("#cpf").text(objeto.cpf);
            $("#idade").text(objeto.idade);
            $("#idBotao").text(objeto.idBotao);
        }
    </script>
</body>
</html>
