/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.util;

import br.edu.iff.mercado.controles.ControleSessao;
import br.edu.iff.mercado.entidades.Sessao;
import java.util.List;

/**
 *
 * @author aluno
 */
public class WebHelpis {
    
    public static String montarSelectSessao(Sessao sessaoDoProduto) {
        StringBuffer select = new StringBuffer("<select name=\"\">");
        List<Sessao> sessoes = ControleSessao.listar();
        for (Sessao sessao : sessoes) {
            select.append("<option value=\"");
            select.append(sessao.getIdSessao());
            if (sessao.equals(sessaoDoProduto)) {
                select.append("\" selected>");
            } else {
                select.append("\">");
            }
            select.append(sessao.getNmNome());
            select.append("</option>");
        }
        select.append("</select>");
        return select.toString();
    }
    
}
