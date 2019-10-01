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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "produto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Produto.findAll", query = "SELECT p FROM Produto p")
    , @NamedQuery(name = "Produto.findByCdProdutos", query = "SELECT p FROM Produto p WHERE p.cdProdutos = :cdProdutos")
    , @NamedQuery(name = "Produto.findByNmNome", query = "SELECT p FROM Produto p WHERE p.nmNome = :nmNome")
    , @NamedQuery(name = "Produto.findByVlUnidade", query = "SELECT p FROM Produto p WHERE p.vlUnidade = :vlUnidade")
    , @NamedQuery(name = "Produto.findByNmMarca", query = "SELECT p FROM Produto p WHERE p.nmMarca = :nmMarca")})
public class Produto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "cd_produtos")
    private String cdProdutos;
    @Size(max = 500)
    @Column(name = "nm_nome")
    private String nmNome;
    @Column(name = "vl_unidade")
    private Integer vlUnidade;
    @Size(max = 500)
    @Column(name = "nm_marca")
    private String nmMarca;
    @OneToMany(mappedBy = "cdSessao")
    private Collection<Produto> produtoCollection;
    @JoinColumn(name = "cd_sessao", referencedColumnName = "cd_produtos")
    @ManyToOne
    private Produto cdSessao;

    public Produto() {
    }

    public Produto(String cdProdutos) {
        this.cdProdutos = cdProdutos;
    }

    public String getCdProdutos() {
        return cdProdutos;
    }

    public void setCdProdutos(String cdProdutos) {
        this.cdProdutos = cdProdutos;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    public Integer getVlUnidade() {
        return vlUnidade;
    }

    public void setVlUnidade(Integer vlUnidade) {
        this.vlUnidade = vlUnidade;
    }

    public String getNmMarca() {
        return nmMarca;
    }

    public void setNmMarca(String nmMarca) {
        this.nmMarca = nmMarca;
    }

    @XmlTransient
    public Collection<Produto> getProdutoCollection() {
        return produtoCollection;
    }

    public void setProdutoCollection(Collection<Produto> produtoCollection) {
        this.produtoCollection = produtoCollection;
    }

    public Produto getCdSessao() {
        return cdSessao;
    }

    public void setCdSessao(Produto cdSessao) {
        this.cdSessao = cdSessao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cdProdutos != null ? cdProdutos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.cdProdutos == null && other.cdProdutos != null) || (this.cdProdutos != null && !this.cdProdutos.equals(other.cdProdutos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Produto[ cdProdutos=" + cdProdutos + " ]";
    }
    
}
