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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

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
    , @NamedQuery(name = "Produto.findByNmMarca", query = "SELECT p FROM Produto p WHERE p.nmMarca = :nmMarca")
    , @NamedQuery(name = "Produto.findByCdSessao", query = "SELECT p FROM Produto p WHERE p.cdSessao = :cdSessao")
    , @NamedQuery(name = "Produto.findById", query = "SELECT p FROM Produto p WHERE p.id = :id")})
public class Produto implements Serializable {

    private static final long serialVersionUID = 1L;
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
    @Size(max = 500)
    @Column(name = "cd_sessao")
    private String cdSessao;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "minhageradora")
    @SequenceGenerator(name = "minhageradora", sequenceName = "sq_produto")
    @Column(name = "id")
    private Integer id;

    public Produto() {
    }

    public Produto(Integer id) {
        this.id = id;
    }

    public Produto(Integer id, String cdProdutos) {
        this.id = id;
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

    public String getCdSessao() {
        return cdSessao;
    }

    public void setCdSessao(String cdSessao) {
        this.cdSessao = cdSessao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Produto[ id=" + id + " ]";
    }
    
}
