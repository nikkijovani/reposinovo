/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "sessao")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sessao.findAll", query = "SELECT s FROM Sessao s")
    , @NamedQuery(name = "Sessao.findByCdSessao", query = "SELECT s FROM Sessao s WHERE s.cdSessao = :cdSessao")
    , @NamedQuery(name = "Sessao.findByNmNome", query = "SELECT s FROM Sessao s WHERE s.nmNome = :nmNome")})
public class Sessao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "cd_sessao")
    private String cdSessao;
    @Size(max = 500)
    @Column(name = "nm_nome")
    private String nmNome;

    public Sessao() {
    }

    public Sessao(String cdSessao) {
        this.cdSessao = cdSessao;
    }

    public String getCdSessao() {
        return cdSessao;
    }

    public void setCdSessao(String cdSessao) {
        this.cdSessao = cdSessao;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdSessao != null ? cdSessao.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sessao)) {
            return false;
        }
        Sessao other = (Sessao) object;
        if ((this.cdSessao == null && other.cdSessao != null) || (this.cdSessao != null && !this.cdSessao.equals(other.cdSessao))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Sessao[ cdSessao=" + cdSessao + " ]";
    }
    
}
