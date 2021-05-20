using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication4
{
    public class Pessoa
    {
        public string nome { get; set; }
        public string idade { get; set; }
        public string cpf { get; set; }
        public string idBotao { get; set; }

        public Pessoa(string nome, string idade, string cpf, string idBotao)
        {
            this.nome = nome;
            this.idade = idade;
            this.cpf = cpf;
            this.idBotao = idBotao;
        }
    }
}