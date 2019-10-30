/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.entidades;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author aluno
 */
@Entity
@Table(name = "sessao")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sessao.findAll", query = "SELECT s FROM Sessao s")
    , @NamedQuery(name = "Sessao.findByNmNome", query = "SELECT s FROM Sessao s WHERE s.nmNome = :nmNome")
    , @NamedQuery(name = "Sessao.findByIdSessao", query = "SELECT s FROM Sessao s WHERE s.idSessao = :idSessao")})
public class Sessao implements Serializable {

    @OneToMany(mappedBy = "idSessao")
    private Collection<Produto> produtoCollection;

    private static final long serialVersionUID = 1L;
    @Size(max = 500)
    @Column(name = "nm_nome")
    private String nmNome;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_sessao")
    private Integer idSessao;

    public Sessao() {
    }

    public Sessao(Integer idSessao) {
        this.idSessao = idSessao;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    public Integer getIdSessao() {
        return idSessao;
    }

    public void setIdSessao(Integer idSessao) {
        this.idSessao = idSessao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSessao != null ? idSessao.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sessao)) {
            return false;
        }
        Sessao other = (Sessao) object;
        if ((this.idSessao == null && other.idSessao != null) || (this.idSessao != null && !this.idSessao.equals(other.idSessao))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Sessao[ idSessao=" + idSessao + " ]";
    }

    @XmlTransient
    public Collection<Produto> getProdutoCollection() {
        return produtoCollection;
    }

    public void setProdutoCollection(Collection<Produto> produtoCollection) {
        this.produtoCollection = produtoCollection;
    }
    
}
