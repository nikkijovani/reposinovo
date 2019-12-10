/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.iff.mercado.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
    , @NamedQuery(name = "Produto.findByNmNome", query = "SELECT p FROM Produto p WHERE p.nmNome = :nmNome")
    , @NamedQuery(name = "Produto.findByNmMarca", query = "SELECT p FROM Produto p WHERE p.nmMarca = :nmMarca")
    , @NamedQuery(name = "Produto.findByIdProduto", query = "SELECT p FROM Produto p WHERE p.idProduto = :idProduto")
    , @NamedQuery(name = "Produto.findByDtPromocao", query = "SELECT p FROM Produto p WHERE p.dtPromocao = :dtPromocao")
    , @NamedQuery(name = "Produto.findByVlUnidade", query = "SELECT p FROM Produto p WHERE p.vlUnidade = :vlUnidade")
    , @NamedQuery(name = "Produto.findByVlPromocao", query = "SELECT p FROM Produto p WHERE p.vlPromocao = :vlPromocao")
    , @NamedQuery(name = "Produto.findByDsDescricao", query = "SELECT p FROM Produto p WHERE p.dsDescricao = :dsDescricao")
/*, @NamedQuery(name = "Produto.findByExtensao", query = "SELECT p FROM Produto p WHERE p.extensao = :extensao")*/
})
public class Produto implements Serializable {

    @Lob
    @Column(name = "ft_produto")
    private byte[] ftProduto;

    @Column(name = "vl_unidade")
    private BigDecimal vlUnidade;
    @Column(name = "vl_promocao")
    private BigDecimal vlPromocao;
    @Size(max = 2147483647)
    @Column(name = "extensao")
    private String extensao;
    @OneToMany(mappedBy = "idProduto")
    private Collection<Compra> compraCollection;

    private static final long serialVersionUID = 1L;
    @Size(max = 500)
    @Column(name = "nm_nome")
    private String nmNome;
    @Size(max = 500)
    @Column(name = "nm_marca")
    private String nmMarca;

    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "geraProd")
    @SequenceGenerator(name = "geraProd", sequenceName = "sq_prod")
    @Column(name = "id_produto")
    private Integer idProduto;

    @Column(name = "dt_promocao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dtPromocao;
    @Size(max = 100)
    @Column(name = "ds_descricao")
    private String dsDescricao;
    /*@Lob
    @Column(name = "ft_produto")
    private byte[] ftProduto;
    @Size(max = 2147483647)
    @Column(name = "extensao")
    private String extensao;*/
    @JoinColumn(name = "id_sessao", referencedColumnName = "id_sessao")
    @ManyToOne
    private Sessao idSessao;

    public Produto() {
    }

    public Produto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    public String getNmNome() {
        return nmNome;
    }

    public void setNmNome(String nmNome) {
        this.nmNome = nmNome;
    }

    public String getNmMarca() {
        return nmMarca;
    }

    public void setNmMarca(String nmMarca) {
        this.nmMarca = nmMarca;
    }

    public Integer getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    public Date getDtPromocao() {
        return dtPromocao;
    }

    public void setDtPromocao(Date dtPromocao) {
        this.dtPromocao = dtPromocao;
    }

    public String getDsDescricao() {
        return dsDescricao;
    }

    public void setDsDescricao(String dsDescricao) {
        this.dsDescricao = dsDescricao;
    }

    /*public byte[] getFtProduto() {
        return ftProduto;
    }

    public void setFtProduto(byte[] ftProduto) {
        this.ftProduto = ftProduto;
    }

    public String getExtensao() {
        return extensao;
    }

    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }*/
    public Sessao getIdSessao() {
        return idSessao;
    }

    public void setIdSessao(Sessao idSessao) {
        this.idSessao = idSessao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProduto != null ? idProduto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.idProduto == null && other.idProduto != null) || (this.idProduto != null && !this.idProduto.equals(other.idProduto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.iff.mercado.entidades.Produto[ idProduto=" + idProduto + " ]";
    }

    public boolean temPromoValida() {
        Date hoje = new Date();
        int code;
        boolean data;
        if (hoje.before(this.dtPromocao)) {

            data = true;
        } else if (hoje.after(this.dtPromocao)) {
            data = false;
        } else {
            data = true;
        }

        return data;

    }

    public BigDecimal getVlUnidade() {
        return vlUnidade;
    }

    public void setVlUnidade(BigDecimal vlUnidade) {
        this.vlUnidade = vlUnidade;
    }

    public BigDecimal getVlPromocao() {
        return vlPromocao;
    }

    public void setVlPromocao(BigDecimal vlPromocao) {
        this.vlPromocao = vlPromocao;
    }

    public byte[] getFtProduto() {
        return ftProduto;
    }

    public void setFtProduto(byte[] ftProduto) {
        this.ftProduto = ftProduto;
    }

    public String getExtensao() {
        return extensao;
    }

    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }

    @XmlTransient
    public Collection<Compra> getCompraCollection() {
        return compraCollection;
    }

    public void setCompraCollection(Collection<Compra> compraCollection) {
        this.compraCollection = compraCollection;
    }
}
