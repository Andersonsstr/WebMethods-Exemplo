<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/fileinput.min.css" />
    <link rel="stylesheet" href="css/all-krajee.min.css" />

    <title>Hello, world!</title>
</head>
<body style="background: rgb(238,174,202); background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);">
    <form id="form1" runat="server">
        <div class="container mt-4" style="border-radius: 50px; background-color: white; padding-bottom: 1%; text-align: center">
            <h1 style="padding-top: 6%">PageMethods</h1>
            <div id="result" class="mt-5">
                <div class="row">
                    <div class="col">
                        <h3>Nome:
                            <label id="nome"></label>
                        </h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h3>CPF:
                        <label id="cpf"></label>
                        </h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h3>Idade:
                <label id="idade"></label>
                        </h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h3>ID Botão:
                <label id="idBotao"></label>
                        </h3>
                    </div>
                </div>
                <div id="divArquivo" hidden="hidden">
                    <div class="row">
                        <div class="col">
                            <h3>Nome do Arquivo:
                            <label id="idNomeArquivo"></label>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h3>Tamanho:
                            <label id="idTamanho"></label>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h3>Download: 
                                <label id="idDownload"></label>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="form-group row" style="width: 800px; align-items: center; display: inline-block">
                    <label class="col-sm-12 col-form-label" style="font-size: 1.5rem">Anexar Arquivos*</label>
                    <!-- Input Anexar Arquivos -->
                    <asp:FileUpload type="file" class="file fileUpload noLoading" name="inputptbr[]" ID="uploadDocumentos" AllowMultiple="true" runat="server" data-preview-file-type="text" data-msg-placeholder="Selecione os arquivos para fazer o upload" required="required" />
                    <p class="col-sm-12 help-block mt-1">
                        Extensões Permitidas: "PDF ou JPG."
                    </p>
                </div>
                <div class="m-4">
                    <asp:Button ID="btnUpload" Text="Upload" CssClass="btn btn-danger" OnClick="btnUpload_Click" runat="server" />
                    <asp:Button ID="btnEnviar" Text="Clique Aqui para Testar" CssClass="btn btn-primary" OnClientClick="teste(this.id);return false" runat="server" />
                </div>
            </div>

            <label style="bottom: 0; position: fixed;">Coded by Anderson S.</label>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src='script/fileinput.min.js'></script>
    <script type="text/javascript" src='script/locales/pt-BR.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript">
        var d;
        function teste(id) {
            $.ajax({
                type: "POST",
                url: "WebForm1.aspx/GetData",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: id }),
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
            $('#divArquivo').removeAttr('hidden');
            objeto = $.parseJSON(result.d);
            console.log(objeto);
            $("#nome").text(objeto.nome);
            $("#cpf").text(objeto.cpf);
            $("#idade").text(objeto.idade);
            $("#idBotao").text(objeto.idBotao);
            $("#idNomeArquivo").text(objeto.nomeArquivo);
            $("#idTamanho").text(objeto.tamanhoArquivo);
            $("#idDownload").html(objeto.linkDownload);
        }

        $("#uploadDocumentos").fileinput({
            language: "pt-BR",
            showUpload: false,
            showRemove: true,
            showPreview: true,
            required: true,
            browseOnZoneClick: true,
            validateInitialCount: true,
            autoReplace: true,
            overwriteInitial: false,
            allowedPreviewTypes: false,
            theme: "explorer-fas",
            uploadAsync: true,
            maxFileSize: 15000,
            initialPreviewAsData: true,
            showCancel: true,
            overwriteInitial: false,
            maxFileCount: 5,
            removeFromPreviewOnError: true,
            allowedFileExtensions: ["jpg", "png", "pdf", "docx"],
            fileActionSettings: {
                showUpload: false,
                showZoom: false,
            }
        });
    </script>
</body>
</html>
